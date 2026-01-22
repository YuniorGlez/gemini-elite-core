# React Native New Architecture: Fabric & JSI (2026)

The New Architecture is mandatory as of 2026. It replaces the Bridge with **JSI (JavaScript Interface)** and the old renderer with **Fabric**.

## 1. JSI (JavaScript Interface)

JSI allows direct communication between JavaScript and C++.
-   **Elimination of JSON Serialization**: No more stringifying data to cross the bridge.
-   **Synchronous Execution**: Call native functions just like any other JS function.

## 2. Fabric Renderer

Fabric is the modern rendering engine for React Native.
-   **Concurrent Rendering**: Native views are rendered concurrently with React 19.
-   **Host Components**: Deep integration with native layout engines (Yoga).

## 3. TurboModules

TurboModules are native modules that are loaded lazily.
-   **Impact**: Faster app startup times and reduced memory usage.
-   **Codegen**: Strongly typed interfaces generated from TypeScript definitions.

## 4. Worklets: The JSI Execution Layer

Worklets leverage JSI to run JS on any thread. This is how Reanimated 4 and VisionCamera 4 achieve native-level performance.

## 5. Migration Checklist

-   [ ] Remove all legacy `NativeModules` references.
-   [ ] Enable `newArchEnabled=true` in `gradle.properties`.
-   [ ] Update `Podfile` to use the New Architecture flags.
-   [ ] Verify all third-party libraries support Fabric.

---
*Updated: January 22, 2026 - 20:15*
