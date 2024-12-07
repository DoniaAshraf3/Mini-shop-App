Mini Shop App
A modern and user-friendly Flutter app for managing a product store and cart. This app uses Flutter BLoC for state management, Dio for API calls, Hive for local storage, and Flutter for a beautiful UI.

How to Run the Project
To run this Flutter project on your local machine, follow these steps:

Prerequisites:
Flutter: Ensure that Flutter is installed on your machine. You can follow the installation guide here.
Dart: Make sure you have Dart installed, which comes with Flutter.
Android Studio or Visual Studio Code: For Flutter development, install one of these IDEs.
Steps to Run:
Clone the repository:

bash
git clone https://github.com/your-username/mini_shop_app.git
Navigate to the project directory:

bash
cd mini_shop_app
Install dependencies:

bash
flutter pub get
Run the app: To run the app on an emulator or device:

bash
flutter run
App Features
Product List: Displays a list of products fetched from an API (https://fakestoreapi.com/products).
Search Functionality: Allows users to filter products by name.
Cart Management: Users can add/remove products to/from the cart with quantity management.
Product Details: A detailed view of each product, including the option to add it to the cart.
Error Handling: Graceful error handling with messages for network issues or empty states.
Local Storage: Cart data is saved locally using Hive for persistent storage.
Responsive UI: A responsive design with a clean, modern user interface.
Additional Libraries Used
The following libraries have been used in this project:

1. flutter_bloc:
For state management using the BLoC (Business Logic Component) pattern.
Documentation: flutter_bloc
2. dio:
For making HTTP requests and interacting with the API.
Documentation: dio
3. hive:
A lightweight and fast key-value database for Flutter, used to store cart items locally.
Documentation: hive
4. hive_flutter:
A Flutter adapter for Hive, enabling the use of Hive in Flutter apps.
Documentation: hive_flutter
5. fluttertoast (Optional):
Used to display simple messages in a toast-like popup.
Documentation: fluttertoast
Folder Structure
The project is organized as follows:

bash
lib/
│
├── main.dart            # Entry point of the app
├── home_screen.dart     # Main screen widget
├── product_list_screen.dart  # Product listing screen
├── product_details_screen.dart  # Product details screen
├── cart_screen.dart     # Cart screen
├── product_cubit.dart   # BLoC logic for product fetching
├── cart_cubit.dart      # BLoC logic for cart management
├── api_service.dart     # API service class for fetching data
└── cart_item.dart       # Cart item model
