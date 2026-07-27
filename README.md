# Bigger2 - Flutter E-Commerce Application

Bigger2 is a modern, feature-rich e-commerce application built with Flutter, designed to provide a seamless shopping experience. It leverages Supabase for backend services, providing robust database, authentication, and storage capabilities.

## 🚀 Features

- **User Authentication:** Secure sign-up, login, and social authentication support.
- **Product Browsing:** Explore products across various categories with a user-friendly interface.
- **Cart Management:** Easy addition, removal, and management of items in the shopping cart.
- **Checkout Process:** Streamlined checkout with multiple payment methods (including Card Payment and Cash on Delivery).
- **Order Tracking:** View and track your order history and status.
- **User Profile:** Manage user information, addresses, and account settings.
- **Responsive UI:** A clean, aesthetic, and responsive design optimized for mobile devices.

## 🛠 Tech Stack

- **Framework:** [Flutter](https://flutter.dev/)
- **Backend:** [Supabase](https://supabase.com/)
- **State Management:** [Provider](https://pub.dev/packages/provider)
- **Configuration:** `flutter_dotenv` for environment variable management
- **Networking:** `http`
- **Asset Handling:** `cached_network_image`, `flutter_svg`
- **Other Key Packages:**
  - `get`: For navigation and state management utilities.
  - `shared_preferences` & `flutter_secure_storage`: For local data and secure credential storage.
  - `image_picker` & `file_picker`: For handling media uploads.

## 📂 Project Structure

The project follows a modular structure to ensure maintainability and scalability:

```text
lib/
├── assets/       # Static assets (images, icons)
├── config/       # Environment & Service configurations
├── data/         # Data layer (mock data providers)
├── models/       # Data models
├── navigation/   # Navigation components
├── screens/      # UI screens (organized by feature)
├── services/     # API/Backend interaction layer
└── utils/        # Utility functions and error handling
```

## 📦 Getting Started

### Prerequisites

- Flutter SDK (>= 3.9.0)
- Supabase account and project URL/Anon Key.
- A `.env` file in the root directory (configured as per `lib/config/env.dart`).

### Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd bigger2
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Setup environment variables:
   Create a `.env` file in the root directory and add your Supabase credentials:
   ```text
   SUPABASE_URL=your_supabase_url
   SUPABASE_ANON_KEY=your_supabase_anon_key
   ```

4. Run the application:
   ```bash
   flutter run
   ```

## 📜 License

This project is for educational and commercial purposes. Please refer to the repository owner for licensing information.
