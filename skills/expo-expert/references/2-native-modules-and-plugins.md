# Reference: Native Modules & Config Plugins

## Overview
When the Expo SDK doesn't have what you need, you build it yourself using the **Expo Modules SDK** or modify existing native code via **Config Plugins**.

---

## 🛠️ 1. Expo Modules SDK (The Modern Bridge)
The Modules SDK allows you to write native code in Swift (iOS) and Kotlin (Android) using a declarative DSL.

### Example: High-Speed Cryptography
Instead of doing heavy crypto in JS, you write a native module:

```kotlin
// android/MyCryptoModule.kt
override fun definition() = ModuleDefinition {
  Name("MyCrypto")
  Function("hash") { data: String ->
    // Native high-speed hashing logic
    return data.sha256()
  }
}
```

---

## 🧩 2. Config Plugins
A Config Plugin is a function that runs during `prebuild` to modify the native project files (`Info.plist`, `AndroidManifest.xml`, `Podfile`).

### Example: Adding a Custom Permission
```javascript
// plugins/withCustomPermission.js
const { withAndroidManifest } = require('@expo/config-plugins');

module.exports = (config) => {
  return withAndroidManifest(config, (config) => {
    // Add logic to modify AndroidManifest.xml
    return config;
  });
};
```

---

## 📦 3. Local Expo Modules
In 2026, we keep custom native logic inside a `modules/` folder in the root of the project.

```text
project-root/
├── modules/
│   └── my-native-feature/
│       ├── ios/
│       ├── android/
│       └── index.ts
```
*Note: Run `npx expo prebuild` to link your local module to the development build.*
