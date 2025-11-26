# TopMax Jobs

TopMax Jobs is a Flutter-based mobile application for finding jobs and courses. It provides a clean and modern user interface for browsing job listings, viewing details, and managing user sessions.

## Features

- **Phone Number Authentication:** Secure user authentication using phone number and OTP verification.
- **Job Listings:** Browse and search for job opportunities.
- **Job Details:** View detailed information about each job.
- **Course Listings:** Explore and discover courses.
- **Course Details:** View detailed information about each course.
- **Saved Items:** Save jobs and courses for later viewing.
- **Session Management:** Automatic session expiry and logout.
- **Modern UI:** A clean and intuitive user interface built with Flutter.

## App Structure

The project follows a clean and scalable architecture, with a clear separation of concerns.

- **`lib/`**: The main source code of the application.
  - **`core/`**: Core components of the application.
    - **`constants/`**: Application-wide constants.
    - **`router/`**: Navigation and routing logic using `go_router`.
    - **`scaffold/`**: The main scaffold with the bottom navigation bar.
    - **`theme/`**: Application theme and styling.
  - **`features/`**: Individual features of the application, such as authentication, home, explore, profile, and more.
    - **`auth/`**: Authentication-related screens and widgets.
    - **`explore/`**: Explore and search functionality.
    - **`home/`**: The main home screen with job and course listings.
    - **`more/`**: Additional app features and settings.
    - **`profile/`**: User profile management.
  - **`models/`**: Data models for the application, using `freezed` for immutability.
  - **`services/`**: Services for interacting with APIs, managing sessions, and handling storage.
  - **`state/`**: State management using `flutter_riverpod`.
  - **`utils/`**: Utility functions and extensions.
  - **`widgets/`**: Reusable widgets used throughout the application.

## State Management

The app uses `flutter_riverpod` for state management. This provides a robust and scalable way to manage the app's state, with a clear separation between the UI and the business logic.

## Navigation

Navigation is handled by the `go_router` package, which provides a declarative and type-safe way to manage routes. The app uses a `ShellRoute` to create a persistent bottom navigation bar across the main screens.

