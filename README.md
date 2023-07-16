# Flutter API Calls

This Flutter project demonstrates making API calls and displaying the retrieved data in a ListView. It fetches a list of products from a dummy API and renders them in a user-friendly UI.

## Features

- Loading Indicator: Displays a loading indicator while fetching data.
- Error Handling: Shows an error message if there's a failure in fetching data.
- Data Display: Renders the list of products with images and titles in a ListView.

## Project Structure

- `home_page.dart`: The main page fetches and displays the products.
- `product_store.dart`: Manages the state of the products and handles data fetching.
- `product_repository.dart`: Handles API integration and fetches products.
- `product_model.dart`: Defines the structure of a product.
- `http_client.dart`: Handles HTTP requests.
- `exceptions.dart`: Custom exception class to handle errors.

## Getting Started

1. Clone/download the project.
2. Run `flutter pub get` in the project directory.
3. Connect a device/emulator and run the app (`flutter run`).

## API Integration

The `ProductRepository` class fetches products from the API using the `HttpClient` class. It parses the response into a list of `ProductModel` objects. Errors are handled with custom exceptions.

## State Management

The `ProductStore` class manages the state of the products. It provides notifiers for loading, state, and error handling.

## UI Rendering

The `HomePage` class renders the UI components. It displays a loading indicator, error message, or product list in a ListView.

## Conclusion

This project showcases API integration and data display in Flutter. Feel free to customize and extend it as needed. If you have any questions, please let me know. Happy coding!
