# 📈 Stock Search & Authentication App

A Flutter application that allows users to authenticate, search for stocks, and view stock details in a visually appealing UI.

## 🚀 Features
 1️⃣ **User Authentication**
  - Login using API authentication.
  - Maintain a persistent login session using SharedPreferences or Secure Storage.

 2️⃣ **Stock Search & Listing**
  - Fetch stock details using the Stock Search API.
  - Display stocks in an interactive and modern UI.
  - Show detailed stock information, including name, price, change percentage, and other financial data.

## 🛠️ Tech Stack
- **Flutter** (Frontend UI)
- **Dio** (For API calls)
- **Riverpod** (State management)
- **Hive** (For session management)
- **API Integration** (For authentication & stock data retrieval)


## 🔧 Installation & Setup
To get started, follow these steps:

1. Clone the repository:

```bash
git clone https://github.com/MaharajMM/capricon_stock.git
```

2. Navigate to the project directory:
```bash
cd capricon_stock
```
3. Install dependencies:
```bash
flutter pub get
```
4. Build the project with build_runner
```bash
dart run build_runner build
```
**Note :** Go to ```Run & Debug``` tab and select ```Launch normal```

5. Run the app:
```bash
flutter run
```
## 🌍 API Configuration

- The project relies on a backend API for authentication and stock data.
- Update the API base URL by creating a ```.env``` file in root prject directory

```bash
DEVELOPMENT_BASE_URL = "https://your-api-url.com"
```

## 🖼️ Demo Video
https://github.com/user-attachments/assets/b85933a4-838b-4689-986e-1cfc50917094
