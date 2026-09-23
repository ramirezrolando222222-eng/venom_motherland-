import crypto from 'crypto';
import fs from 'fs';

const REGISTRY_PATH = './.lion-registry.json';
const MASTER_HANDSHAKE_SECRET = process.env.LION_HANDSHAKE_KEY || 'LION_CODER_SECURE_APEX_2026';

function loadRegistry() {
  if (fs.existsSync(REGISTRY_PATH)) {
    return JSON.parse(fs.readFileSync(REGISTRY_PATH, 'utf8'));
  }
  return {};
}

function saveRegistry(registry) {
  fs.writeFileSync(REGISTRY_PATH, JSON.stringify(registry, null, 2));
}

const args = process.argv.slice(2);
const command = args[0];
const targetFile = args[1];
const outputFile = args[2] || targetFile + '.enc.js';

let registry = loadRegistry();

if (command === 'encrypt') {
  if (!targetFile) {
    console.error('❌ Error: Specify a file to encrypt.');
    process.exit(1);
  }

  const sourceCode = fs.readFileSync(targetFile, 'utf8');

  if (!registry[targetFile]) {
    registry[targetFile] = {
      seed: `SOVEREIGN_SEED_${crypto.randomBytes(16).toString('hex').toUpperCase()}`,
      salt: `salt_${crypto.randomBytes(8).toString('hex')}`
    };
    saveRegistry(registry);
  }

  const fileConfig = registry[targetFile];
  const iv = crypto.randomBytes(16);
  const compositeMaterial = fileConfig.seed + MASTER_HANDSHAKE_SECRET;
  const key = crypto.scryptSync(compositeMaterial, fileConfig.salt, 32);
  const cipher = crypto.createCipheriv('aes-256-cbc', key, iv);

  let encrypted = cipher.update(sourceCode, 'utf8', 'hex');
  encrypted += cipher.final('hex');

  const checksum = crypto
    .createHash('sha256')
    .update(encrypted + compositeMaterial)
    .digest('hex');

  const payload = {
    protocol: 'LION_CYPHER_X_HANDSHAKE',
    version: '2.6.0-apex',
    target: targetFile,
    iv: iv.toString('hex'),
    payload: encrypted,
    checksum: checksum
  };

  fs.writeFileSync(outputFile, JSON.stringify(payload, null, 2));
  console.log(`🦁 [LION CODER] Handshake Encrypted -> ${outputFile}`);

} else if (command === 'run') {
  if (!targetFile) {
    console.error('❌ Error: Specify an encrypted file to run.');
    process.exit(1);
  }

  const rawData = fs.readFileSync(targetFile, 'utf8');
  const moduleData = JSON.parse(rawData);

  const fileConfig = registry[moduleData.target];
  if (!fileConfig) {
    throw new Error(`❌ ACCESS DENIED: No dedicated engine seed found for target ${moduleData.target}`);
  }

  const compositeMaterial = fileConfig.seed + MASTER_HANDSHAKE_SECRET;
  
  const expectedChecksum = crypto
    .createHash('sha256')
    .update(moduleData.payload + compositeMaterial)
    .digest('hex');

  if (expectedChecksum !== moduleData.checksum) {
    throw new Error('🛡️ BREACH DETECTED: Invalid Secret Cryptographic Handshake. Seed is dead.');
  }

  const key = crypto.scryptSync(compositeMaterial, fileConfig.salt, 32);
  const decipher = crypto.createDecipheriv(
    'aes-256-cbc',
    key,
    Buffer.from(moduleData.iv, 'hex')
  );

  let decryptedCode = decipher.update(moduleData.payload, 'hex', 'utf8');
  decryptedCode += decipher.final('utf8');

  const dynamicFunction = new Function(decryptedCode);
  dynamicFunction();
}
