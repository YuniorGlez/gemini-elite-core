# Reference: Cross-Platform UX (iOS & Android)

## Overview
A "Pro" React Native app doesn't just look the same on both platforms—it respects the unique design language of each while maintaining brand consistency.

---

## 🗺️ 1. Navigation Patterns
Use **React Navigation 7** for the best balance of flexibility and performance.

- **iOS:** Use the native `StackView` with `headerTranslucent: true`.
- **Android:** Use `Material Top Tab` and ensure the `StatusBar` is properly managed.

---

## 📱 2. Platform-Specific Components
Use the `Platform` module or `.ios.tsx` / `.android.tsx` file extensions for deep specialization.

```tsx
const styles = StyleSheet.create({
  container: {
    ...Platform.select({
      ios: { paddingBottom: 20 },
      android: { paddingBottom: 0 },
    }),
  },
});
```

---

## ♿ 3. Accessibility (A11y)
2026 apps MUST be inclusive.
- **`accessibilityLabel`:** Provide descriptive labels for all interactive elements.
- **`accessible={true}`:** Group elements for screen readers.
- **Dynamic Type:** Support larger font sizes without breaking the layout.

---

## 🖼️ 4. Asset Management
- **SVG:** Use `react-native-svg` and `svgr` to convert SVGs into components.
- **Images:** Use `expo-image` (built on SDWebImage/Glide) for high-performance caching and blurred placeholders.

---

## 🏁 UX Checklist
- [ ] Does the app support `Dark Mode` natively?
- [ ] Are safe areas handled on all devices (Dynamic Island, notches)?
- [ ] Is the haptic feedback appropriate (Haptics on iOS, Vibrations on Android)?
- [ ] Do the loading states (Skeletons) match the final layout?
