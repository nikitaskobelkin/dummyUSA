# Dummy USA Intro

<img width="338" alt="image" src="https://github.com/user-attachments/assets/38a891f9-50e8-4693-9d10-b73dc717abd4">

## Building the App

1. Clone the repository to your local machine.
2. Open the dummyUSA.xcworkspace file in Xcode.
3. Select the appropriate target and build the app.

## Features

1. Filters (year and drilldowns)

| Year Filter | Latest Year Result | Drilldowns Filter | All Time State Result |
| ------------- | ------------- | ------------- | ------------- |
| <img src="https://github.com/user-attachments/assets/823aca05-589f-4564-8eb1-e4f13988d73a" width="240"> | <img src="https://github.com/user-attachments/assets/81de6a54-400a-48da-b5f8-ab1d368a1848" width="240"> | <img src="https://github.com/user-attachments/assets/41d6f8e9-8c33-4908-b0b3-1346fca9288c" width="240"> | <img src="https://github.com/user-attachments/assets/4ebd56e1-7735-4b2d-821a-f24e3e7a0604" width="240"> |

- Able to add new filters for years, drilldowns too
- All data groupped by **year** in first step
- Data row preview includes **year** and **quantity** of internal records (level 2), in case of 1 record shows **origin** (state or nation)
- Selection of new filter refresh the search

2. Population

| Year Population | Searching | Population Details | Not found Error |
| ------------- | ------------- | ------------- | ------------- |
| <img src="https://github.com/user-attachments/assets/6539f893-2e3a-4f0d-a3e5-0fb64baecc38" width="240"> | <img src="https://github.com/user-attachments/assets/fae7555f-7e0c-409f-b9f7-1861a35ae5cc" width="240"> | <img src="https://github.com/user-attachments/assets/fd3db823-b0cb-4a99-bf92-a001c622c16d" width="240"> | <img src="https://github.com/user-attachments/assets/b8b642df-b250-43f8-911c-aa2c0497e933" width="240"> |

- List of states for the year (in case of nation it navigated directly to details from root)
- Searching by state
- Populations details: population and slug (optional)
- Not Found placeholder

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
