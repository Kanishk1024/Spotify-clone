# Spotify Clone 🎵

A cross-platform Spotify-inspired music streaming app built with **Flutter**, featuring clean architecture, Firebase integration, Bloc state management, and persistent theming.

## Features

- 🎨 **Clean Architecture:** Modular codebase with clear separation of data, domain, and presentation layers.
- 🔥 **Firebase Integration:** Secure authentication and real-time Firestore database.
- 🌗 **Dynamic Theming:** Light/Dark mode switching with persistent state using Bloc and Hydrated Bloc.
- 📱 **Responsive UI:** Custom widgets and adaptive layouts for seamless experience across devices.
- 🔒 **Authentication Flows:** Sign up, sign in, password reset, and onboarding screens.
- 🏗️ **State Management:** Bloc pattern for scalable and maintainable state handling.

## Screenshots

<!-- Add screenshots here if available -->

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Firebase Project](https://console.firebase.google.com/)
- Dart 3.x

### Setup

1. **Clone the repository:**

   ```sh
   git clone https://github.com/Kanishk1024/Spotify-clone.git
   cd Spotify-clone
   ```

2. **Install dependencies:**

   ```sh
   flutter pub get
   ```

3. **Firebase Setup:**

   - Add your `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) to the respective directories.
   - Update `firebase_options.dart` if needed.

4. **Run the app:**
   ```sh
   flutter run
   ```

## Project Structure

```
lib/
├── core/                # Core configs and utilities
├── data/                # Data sources and repositories
├── domain/              # Business logic and entities
├── presentation/        # UI, screens, widgets, blocs
├── service_locator.dart # Dependency injection setup
└── main.dart            # App entry point
```

## License

This project is licensed under the MIT License.

---

Made with Flutter
