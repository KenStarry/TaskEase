![Banner](https://github.com/user-attachments/assets/d2518e6a-5af2-4d95-9a4d-ae371b7203a7)

## Overview
The ToDo App is a task management application built using Flutter. It follows the **Clean Architecture** approach with the **MVVM (Model-View-ViewModel) pattern** and utilizes **BLoC (Business Logic Component) for state management**. The app allows users to sign in using **Google authentication** or **email and password authentication**, ensuring a seamless user experience.

## Features
- **Task Management:** Create, update, delete, and mark tasks as complete.
- **State Management:** Implemented using the **BLoC pattern** to ensure scalability and maintainability.
- **Authentication:** Users can log in using:
    - Google Sign-In
    - Email and Password
- **Clean Architecture with MVVM Pattern:**
    - **Presentation Layer:** Handles UI and user interactions.
    - **Domain Layer:** Contains business logic and use cases.
    - **Data Layer:** Manages data sources, including local and remote storage.
- **Responsive UI:** Optimized for different screen sizes.
- **Offline Support:** Stores tasks locally for access without internet.

## Tech Stack
- **Framework:** Flutter
- **State Management:** BLoC
- **Architecture:** Clean Architecture (MVVM Pattern)
- **Authentication:** Firebase Authentication (Google & Email Login)
- **Database:** Firestore (or any chosen backend solution)
- **Local Storage:** Shared Preferences / Hive (for caching)

## Installation & Setup
1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/todo-app.git
   cd todo-app
    ```
2. Install the dependencies:
    ```bash
    flutter pub get
    ```
3. Run the app:
    ```bash
    flutter run
    ```
   ## APK Access
   The APK is not publicly available but can be shared upon request. If you need access, please send an email request.


