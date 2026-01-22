# Reference: Modern Expo Workflow (2026)

## Overview
In 2026, the "Managed vs Bare" distinction is gone. We use the **Continuous Native Generation (CNG)** approach.

---

## 🛠️ 1. The Prebuild Mechanism
`npx expo prebuild` generates the `ios` and `android` directories on the fly based on your `app.json` and `Config Plugins`.

### Squaads Standard:
Do NOT commit the `ios` or `android` folders. Let EAS or your local `prebuild` generate them. This ensures your project is always "Managed" but allows for any native modification.

---

## 🏗️ 2. Development Builds (`expo-dev-client`)
Expo Go is for learning; **Development Builds** are for production.

**How to create one:**
1.  Install the client: `npx expo install expo-dev-client`
2.  Configure EAS: `eas build:configure`
3.  Build for simulator/device: `eas build --profile development --platform ios`

---

## 🚀 3. EAS (Expo Application Services)
EAS is the infrastructure layer for Expo.

- **EAS Build:** Handles the complex certificates and native compilation in the cloud.
- **EAS Submit:** Automatically uploads your binary to the App Store and Google Play.
- **EAS Update:** Global CDN for deploying JS/Asset changes without a new binary.

---

## 🎨 4. Expo Router 4
File-based routing that brings the "Next.js experience" to mobile.

- **Static Typing:** Routes are automatically typed based on the folder structure.
- **Deep Linking:** Handled automatically for every screen in the `app/` directory.
- **Shared Routes:** Use `(group)` folders to organize code without affecting the URL.
