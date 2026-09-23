#!/usr/bin/env bash
# ==============================================================================
# © 2026 Rolando H Ramirez Jr LLC. All Rights Reserved.
# Project: modern-saga-505708-b7 IAM Auto-Provisioner
# ==============================================================================

set -euo pipefail

PROJECT_ID="modern-saga-505708-b7"
SERVICE_ACCOUNT="rolando-h-ramirez-jr@modern-saga-505708-b7.iam.gserviceaccount.com"
MEMBER_IDENTITY="serviceAccount:${SERVICE_ACCOUNT}"

ROLES=(
  "roles/editor"
  "roles/iam.serviceAccountTokenCreator"
  "roles/logging.logWriter"
  "roles/storage.objectAdmin"
)

echo "================================================================="
echo " Verifying existing IAM policy bindings for:"
echo " ${SERVICE_ACCOUNT}"
echo " Project: ${PROJECT_ID}"
echo "================================================================="

gcloud projects get-iam-policy "${PROJECT_ID}" \
  --flatten="bindings[].members" \
  --format="table(bindings.role)" \
  --filter="bindings.members:${MEMBER_IDENTITY}"

echo ""
echo "================================================================="
echo " Binding required operational roles..."
echo "================================================================="

for ROLE in "${ROLES[@]}"; do
  echo "[+] Adding binding: ${ROLE}"
  gcloud projects add-iam-policy-binding "${PROJECT_ID}" \
    --member="${MEMBER_IDENTITY}" \
    --role="${ROLE}" \
    --condition=None \
    --quiet
done

echo ""
echo "[✓] IAM roles successfully verified and granted."
