# Dummy USA Intro

## Building the App

1. Clone the repository to your local machine.
2. Open the dummyUSA.xcworkspace file in Xcode.
3. Select the appropriate target and build the app.

## General Architecture

The iOS app follows the MVVM (Model-View-ViewModel) architectural pattern, incorporating Dependency Injection for handling dependencies and Async/Await for asynchronous operations.

Key Components:
- Dependency Injection: The project uses Propery Wrapper for dependency injection, allowing for loosely coupled components and easy testability.
- MVVM Pattern: The app follows the MVVM pattern, where Views display data and events, ViewModels handle business logic and data presentation, and Models represent data and services.
- UI shared: Contains style-related files such as Theme for theming, Modifiers, Colors, and Styles for reusable styles.
- Utilities: Contains extension files with utility functions, helping to keep the main codebase clean and organized.

## Libraries Used

The app uses the following libraries:

- Alamofire: A popular networking library for handling API requests and responses, simplifying network calls.
