# Facebook Clone

A mobile-responsive clone of the Facebook user interface built with Flutter. This project demonstrates complex UI implementation, navigation patterns, and static data simulation to mimic the real Facebook Android app experience.

## Features

*   **Authentication UI**: Login and Sign Up screens with Firebase integration support.
*   **Top Tab Navigation**: Custom top navigation bar switching between Home, Watch, Friends, Marketplace, Notifications, and Menu.
*   **Home Feed**:
    *   Stories carousel with "Create Story" and "Music" cards.
    *   Scrollable post feed with multi-image support.
    *   Interaction buttons (Like, Comment, Share) with counter metrics.
*   **Secondary Screens**:
    *   **Friends**: Friend requests and suggestions lists.
    *   **Marketplace**: Grid view of items for sale.
    *   **Watch**: Video feed UI.
    *   **Notifications**: Categorized notification list.
    *   **Menu**: Grid of shortcuts and logout option.
*   **Messenger Demo**: Clickable Messenger icon leading to a demonstration screen.

## Technologies

*   **Flutter**: UI Toolkit for building natively compiled applications.
*   **Dart**: Programming language.
*   **Firebase Auth**: For user authentication (Login/Signup).
*   **Google Fonts**: For typography.

## Getting Started

### Prerequisites

*   Flutter SDK
*   Dart SDK
*   Android Studio / VS Code

### Installation

1.  Clone the repository:
    ```bash
    git clone https://github.com/your-username/facebook-clone.git
    ```
2.  Navigate to the project directory:
    ```bash
    cd facebook_clone
    ```
3.  Install dependencies:
    ```bash
    flutter pub get
    ```
4.  Run the app:
    ```bash
    flutter run
    ```

## Project Structure

```
lib/
├── screens/
│   ├── home_screen.dart       # Main container with Top Tabs and Home Feed
│   ├── login_screen.dart      # Authentication Login
│   ├── signup_screen.dart     # Authentication Signup
│   ├── feeds_screen.dart      # (Legacy/Unused)
│   ├── friends_screen.dart    # Friends List Tab
│   ├── watch_screen.dart      # Video Tab
│   ├── marketplace_screen.dart# Marketplace Grid Tab
│   ├── notifications_screen.dart # Notifications Tab
│   ├── menu_screen.dart       # Menu & Logout Tab
│   └── messenger_screen.dart  # Messenger Demo Page
├── services/
│   └── auth_service.dart      # Firebase Auth Logic
├── widgets/
│   └── ...                    # Reusable widgets
└── main.dart                  # Application Entry Point
```

## Note

This is a UI clone and relies on static data for demonstration purposes, primarily showcasing Layout widgets, Navigation, and Interaction patterns in Flutter.
