# Swift Repository Readme

This repository contains a Swift iOS application that displays Marvel characters and provides a detailed view with information about each character. The application follows the MVVM (Model-View-ViewModel) design pattern for its architecture. Additionally, to run the app successfully, you'll need to enter the API key and private key credentials in the `.plist` file and run `pod install` to install the necessary dependencies.

## Design Pattern: MVVM (Model-View-ViewModel)

The MVVM design pattern is chosen for this application due to its ability to separate concerns and enhance maintainability and testability. Here's a brief overview of each component in MVVM:

1. **Model:** The model represents the data and business logic of the application. In our case, it includes the data structures and operations related to Marvel characters.

2. **View:** The view is responsible for displaying the user interface elements and interacting with the user. In our application, the view will present the list of Marvel characters and provide navigation to the detail view.

3. **ViewModel:** The view model acts as a mediator between the view and the model. It provides data and behavior to the view, handles user interactions, and updates the model when necessary. In our implementation, the view model will retrieve the character data from the model and expose it to the view. It will also handle the user's actions, such as selecting a character for the detailed view.

Using the MVVM pattern helps to achieve separation of concerns, making the codebase more modular and easier to maintain. It also enables better testability by allowing us to test the view model independently of the view.

## Configuration: API Key and Private Key

To successfully run the application, you need to enter your API key and private key credentials in the `.plist` file. These credentials are required to access the Marvel API and retrieve the character data.

Please follow these steps to configure the API key and private key:

1. Locate the `.plist` file in the Xcode project.
2. Open the `.plist` file and find the entry for "APIKey" and "PrivateKey".
3. Replace the placeholder values with your own API key and private key credentials. Make sure to keep the format intact.
4. Save the changes to the `.plist` file.

It is essential to keep your API key and private key secure and not share them publicly. You may consider using environment variables or secure storage mechanisms for production deployments.

## Installation and Dependencies

To install the necessary dependencies for this application, you need to run `pod install`. Make sure you have CocoaPods installed on your system before proceeding with the installation.

Please follow these steps to install the dependencies:

1. Open a terminal window and navigate to the root directory of the project.
2. Run the command `pod install` to install the required dependencies.
3. Wait for the installation process to complete.

Once the dependencies are successfully installed, you can open the Xcode workspace file (`.xcworkspace`) and build the application.

## Usage

After successfully configuring the API credentials and installing the dependencies, you can build and run the application on the iOS Simulator or a physical device.

The application will display a list of Marvel characters. By clicking on a character, a detailed view will appear, providing more information about the selected character.

Feel free to explore the codebase, modify it, and add additional features as per your requirements.

## License

This project is licensed under the [MIT License](LICENSE). Feel free to use, modify, and distribute the code for both commercial and non-commercial purposes.

If you have any questions or need further assistance, please don't hesitate