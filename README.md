# Dummy USA Intro

<img width="338" alt="image" src="https://github.com/user-attachments/assets/38a891f9-50e8-4693-9d10-b73dc717abd4">

## Building the App

1. Clone the repository to your local machine.
2. Open the dummyUSA.xcworkspace file in Xcode.
3. Select the appropriate target and build the app.

## Project's Scope

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

3. iPad Version

| Dashboard | States Population | State Population Details | Nation Population Details |
| ------------- | ------------- | ------------- | ------------- |
| <img src="https://github.com/user-attachments/assets/c20f0ea4-8d26-447c-b407-247c7791480c" width="240"> | <img src="https://github.com/user-attachments/assets/ed7e4156-8273-41f1-8ae7-c9e516d8a76a" width="240"> | <img src="https://github.com/user-attachments/assets/a38cb850-996b-4f2f-90e3-d16928559a58" width="240"> | <img src="https://github.com/user-attachments/assets/94747e9d-6cc9-464c-bad3-a0814aa2e171" width="240"> |

- UI and UX consistent with iPads

4. Dark/Light Themes

| Light | Dark |
| ------------- | ------------- |
| <img src="https://github.com/user-attachments/assets/e3accf48-2c2a-4c7f-b7df-ddf2245b0386" width="240"> | <img src="https://github.com/user-attachments/assets/33f0acfc-ab3b-404d-8615-b921288536be" width="240"> |

5. Localization

<img width="50%" alt="image" src="https://github.com/user-attachments/assets/78ddc35d-99f4-4478-81d4-4b07c088dca0">

- App includes localisation for all screens and errors
- Able to add more languages
- Project is ready for import/export localisation with review

6. Error Handling

| Network Issue | Server Issue |
| ------------- | ------------- |
| <img src="https://github.com/user-attachments/assets/d2080af5-928f-4c24-9957-521eb8955134" width="240"> | <img src="https://github.com/user-attachments/assets/ffc34420-8c93-4a16-a7a4-ac4e9abd4554" width="240"> |

- App includes localisation for all screens and errors
- Able to add more languages
- Project is ready for import/export localisation with review
- Retry button will try fetch again

7. Unit-testing

<img width="618" alt="image" src="https://github.com/user-attachments/assets/f43d1209-660b-41b3-b76c-6f9ebed728b8">


- Easy to integrate mock entities by Dependency approach
- Unit-tests implemented with async/await and Combine technologies
- All tests are completed
- Unit-tests flexible with changing constants to test all corner-cases

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
