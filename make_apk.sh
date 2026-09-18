#!/bin/bash

# Ro AI CLI APK Project Generator & Builder Wrapper
# Safe developer utility for structuring Android projects in Termux

PROJECT_NAME="${1:-RoApp}"

echo "=================================================="
echo " 📱 RO AI APK BUILDER UTILITY // TARGET: $PROJECT_NAME"
echo "=================================================="

# 1. Create project directory structure
echo "[*] Creating project workspace..."
mkdir -p "$PROJECT_NAME/app/src/main/java/com/ro/app"
mkdir -p "$PROJECT_NAME/app/src/main/res/layout"
mkdir -p "$PROJECT_NAME/app/src/main/res/values"

# 2. Generate template AndroidManifest.xml
cat << 'MANIFEST' > "$PROJECT_NAME/app/src/main/AndroidManifest.xml"
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.ro.app">
    <application
        android:allowBackup="true"
        android:label="RoApp"
        android:theme="@android:style/Theme.NoTitleBar">
        <activity android:name=".MainActivity"
                  android:exported="true">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>
</manifest>
MANIFEST

# 3. Generate template MainActivity.java
cat << 'JAVA' > "$PROJECT_NAME/app/src/main/java/com/ro/app/MainActivity.java"
package com.ro.app;

import android.app.Activity;
import android.os.Bundle;
import android.widget.TextView;

public class MainActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        TextView tv = new TextView(this);
        tv.setText("Ro AI Core Online - Boss Framework Active");
        setContentView(tv);
    }
}
JAVA

# 4. Generate strings.xml
cat << 'XML' > "$PROJECT_NAME/app/src/main/res/values/strings.xml"
<resources>
    <string name="app_name">RoApp</string>
</resources>
XML

echo "[*] Workspace successfully generated at ./$PROJECT_NAME"
echo "[*] Ready for compilation pipeline integration, Boss."
