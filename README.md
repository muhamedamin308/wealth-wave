# Wealth Wave

A comprehensive Flutter-based personal finance management application designed to help users track, manage, and optimize their financial activities. Wealth Wave provides an intuitive interface for managing wallets, tracking transactions, viewing financial statistics, and maintaining user profiles.

## 🎯 Features

- **Authentication & Security**
  - User registration and login with Firebase Authentication
  - Secure storage of user credentials using encrypted local storage
  - Support for multiple user accounts

- **Dashboard & Home**
  - Overview of financial transactions
  - Real-time balance tracking
  - Quick access to key financial metrics

- **Wallet Management**
  - Manage multiple wallets
  - Track wallet balances and activity
  - Organize funds across different categories

- **Transaction Tracking**
  - Record income and expense transactions
  - Categorize transactions by type
  - View transaction history with dates and amounts

- **Financial Statistics**
  - Visual representation of spending patterns
  - Financial analytics and insights
  - Comprehensive reports on financial activity

- **User Profile**
  - Personal account information management
  - Profile customization
  - Account settings and preferences

## 🛠️ Tech Stack

- **Frontend Framework:** Flutter with Dart (67.4% of codebase)
- **Backend/Authentication:** Firebase (Authentication & Core)
- **Native Components:** C++ (16.4%), Swift (1.5%), C (0.9%)
- **State Management:** BLoC (flutter_bloc 9.1.1)
- **Routing:** GoRouter 17.2.0
- **HTTP Client:** Dio 5.9.2
- **Local Storage:** 
  - Hive (hive_flutter) for database
  - Flutter Secure Storage for sensitive data
- **Serialization:** JSON Serializable & Freezed
- **Dependency Injection:** GetIt & Injectable
- **Responsive UI:** Flutter ScreenUtil
- **Environment Configuration:** flutter_dotenv
- **Testing:** Mockito & Mocktail

## 📋 Requirements

- **SDK Version:** Dart 3.11.4 or higher
- **Flutter:** Latest stable version
- **Platform Support:** iOS, Android, Web, Windows, macOS, Linux

## 🚀 Getting Started

### Prerequisites

1. Install Flutter from [flutter.dev](https://flutter.dev)
2. Set up an Android emulator or iOS simulator (or connect a physical device)
3. Install Firebase CLI tools

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/muhamedamin308/wealth-wave.git
   cd wealth-wave
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Set up Firebase:**
   - Create a Firebase project at [console.firebase.google.com](https://console.firebase.google.com)
   - Download the configuration files (google-services.json for Android, GoogleService-Info.plist for iOS)
   - Place them in the respective android/ and ios/ directories

4. **Configure environment variables:**
   - Create a `.env` file in the project root
   - Add your Firebase and API configuration:
     ```
     FIREBASE_API_KEY=your_api_key
     FIREBASE_PROJECT_ID=your_project_id
     # Add other required environment variables
     ```

5. **Generate code (if needed):**
   ```bash
   flutter pub run build_runner build
   ```

6. **Run the app:**
   ```bash
   flutter run
   ```

## 📁 Project Structure

```
lib/
├── features/
│   ├── auth/                 # Authentication feature (login, signup)
│   ├── home/                 # Home/dashboard feature
│   ├── wallet/               # Wallet management feature
│   ├── statistics/           # Financial statistics feature
│   ├── profile/              # User profile feature
│   └── onboarding/           # Onboarding & splash screens
├── config/
│   ├── routes/               # Navigation & routing configuration
│   └── theme/                # App theming and styling
├── core/
│   ├── common/               # Shared utilities and extensions
│   └── util/                 # Helper functions and constants
├── di/                       # Dependency injection setup
├── services/                 # Core services (auth, storage, etc.)
└── main.dart                 # Application entry point
```

## 🏗️ Architecture

Wealth Wave follows **Clean Architecture** principles with separation of concerns:

- **Presentation Layer:** BLoC pattern for state management, UI widgets
- **Domain Layer:** Business logic, use cases, and entities
- **Data Layer:** Repositories, data sources, models
- **Core/Services:** Shared services, utilities, and configurations

## 🔐 Security Features

- Firebase Authentication for secure user verification
- Encrypted local storage for sensitive user data
- Environment variable management for API keys
- Secure token storage and session management

## 🎨 UI/UX

- Custom theme configuration with Material Design
- Responsive design using Flutter ScreenUtil
- Smooth page transitions with custom animations
- Inter font family for consistent typography
- Light and dark mode support ready

## 📦 Key Dependencies

| Package | Purpose |
|---------|---------|
| firebase_auth | User authentication |
| firebase_core | Firebase initialization |
| flutter_bloc | State management |
| go_router | Navigation and routing |
| hive_flutter | Local data persistence |
| dio | HTTP requests |
| flutter_secure_storage | Encrypted storage |
| freezed | Code generation |
| injectable | Dependency injection |
| json_serializable | JSON serialization |

## 🧪 Testing

The project includes setup for unit and widget testing with:
- Mockito for mocking dependencies
- Mocktail for testing BLoCs and controllers
- Flutter test framework

Run tests with:
```bash
flutter test
```

## 🔄 Navigation Flow

1. **Splash Screen** → App initialization
2. **Onboarding Screen** → First-time user experience
3. **Authentication** → Login/Signup
4. **Home Screen** → Main dashboard with transactions
5. **Wallet/Statistics/Profile** → Feature navigation

## 🐛 Troubleshooting

### Build Issues
- Clear build cache: `flutter clean`
- Regenerate code: `flutter pub run build_runner build --delete-conflicting-outputs`
- Update dependencies: `flutter pub upgrade`

### Firebase Issues
- Verify Firebase configuration files are in place
- Check that your `.env` file contains correct Firebase credentials
- Ensure Firebase project is properly initialized in the console

### Platform-Specific Issues
- For iOS: Run `pod install` in the ios/ directory
- For Android: Ensure Android SDK is properly configured
- Check platform-specific requirements in Firebase documentation

## 📝 License

This project is currently unlicensed. Please check with the repository owner for licensing information.

## 👤 Author

**Muhammad Amin**
- GitHub: [@muhamedamin308](https://github.com/muhamedamin308)

## 🤝 Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues to improve the project.

## 📚 Resources

- [Flutter Documentation](https://docs.flutter.dev)
- [Firebase Documentation](https://firebase.google.com/docs)
- [BLoC Library](https://bloclibrary.dev)
- [Clean Architecture in Dart](https://resocoder.com/flutter-clean-architecture)

## 📞 Support

For support, please open an issue in the GitHub repository or contact the maintainer directly.

---

**Last Updated:** June 2026
