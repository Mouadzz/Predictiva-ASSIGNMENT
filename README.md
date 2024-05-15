# Predictiva Frontend/Flutter Take-Home Assignment

This project is a submission for the Frontend/Flutter Developer take-home assignment at Predictiva Ltd. The task involves converting a provided UI design into a fully functional, mobile-responsive screen with a table populated by data retrieved from an API endpoint.

## Project Overview

The main goals of this project were to:

1. Convert a design mockup into a working Flutter web/mobile screen.
2. Ensure the screen is responsive across different devices and orientations.
3. Implement a table component from scratch that supports sorting and filtering.
4. Retrieve data from an API and populate the table.
5. Handle API errors gracefully with appropriate messages.

## Architecture

The project follows the Clean Architecture pattern, which divides the codebase into three main layers:

1. **Domain Layer**: Contains the core business rules and logic of the application.
2. **Presentation Layer**: Handles UI and user interactions, including widgets, pages, and state management (Bloc).
3. **Data Layer**: Manages data storage and retrieval from external sources like databases and APIs.

This structure helps in maintaining a clean, testable, and scalable codebase.

## Installation

1. **Clone the repository**:
   ```sh
   git clone https://github.com/Mouadzz/Predictiva-ASSIGNMENT.git
   ```
   ```sh
   cd Predictiva-ASSIGNMENT
   ```
2. **Install dependencies**:
   ```sh
   flutter pub get
   ```

## Usage

1. **Run the app**:

   ```sh
   flutter run
   ```

2. **Open in browser (for web)**:
   ```sh
   flutter run -d chrome
   ```

## Contact

For any questions or clarifications, feel free to reach out
