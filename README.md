# 🌡️ Flutter Temperature Converter App

A simple yet functional Flutter application that converts temperatures between **Fahrenheit and Celsius**, and keeps track of the conversion history.


## 🚀 Features

- Convert temperatures **from Fahrenheit to Celsius** and vice versa.
- Simple, clean, and responsive **user interface**.
- Displays **conversion history** in reverse chronological order.
- Input validation with friendly error handling.

## 🛠️ Built With

- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)
- Material Design widgets

## 📂 File Structure

```

lib/
├── main.dart          # Main application entry point

````

## 📖 How It Works

1. The app starts with `main()` and loads `MyApp`, which is a `StatelessWidget`.
2. The home screen is `ConverterPage`, a `StatefulWidget` that manages input, output, conversion type, and history.
3. Users select the conversion direction using `RadioListTile`.
4. On pressing **Convert**, the app parses the input, performs the conversion, and shows the result.
5. A history of conversions is displayed using `ListView.builder`.

## 🧠 Widgets Used

- `MaterialApp` & `Scaffold` – base structure and theme
- `AppBar` – top bar with the title
- `Column`, `Row`, and `Container` – layout and spacing
- `TextField` – for user input and displaying results
- `RadioListTile` – to select conversion direction
- `ElevatedButton` – to trigger the conversion
- `ListView.builder` – to dynamically display history
- `setState()` – to handle dynamic UI updates


## ✅ Requirements

- Flutter SDK
- Dart SDK
- A connected device or emulator

## 🧪 Run Locally

```bash
git clone https://github.com/MizeroR/Individual_Assignment_1.git
cd tempconv
flutter pub get
flutter run
````

## 📋 To-Do / Possible Improvements

* Add option to clear history
* Support more units (Kelvin, Rankine)
* Add dark mode
* Implement better input validation UX


## 🙋‍♂️ Author

* **Reine Mizero** – [@yourGitHub](https://github.com/MizeroR)
