Habi - Real Estate Mobile Application

A cross-platform real estate mobile application built using Flutter. The application provides property exploration, location-based interactive mapping, detailed real estate listings, user reviews, and integrated payment processing workflows. Built in a team environment using Supabase as the backend service.

Table of Contents

About The Project

Key Features

Architecture and Design Patterns

Tech Stack and Tools

Application Flow and Modules

Project Structure

Author and Team

About The Project

Habi is a real estate platform designed to connect property seekers with listings. The application covers the complete property discovery journey, including authentication, real-time map navigation, unit details exploration, ratings and reviews, and booking/payment processing.

Developed collaboratively using modular engineering practices to maintain separation of concerns and scalable code integration.

Key Features

Authentication and Onboarding: Splash screens, user authentication, and profile setups using Supabase Auth.

Property Discovery: Home feed, advanced category filters, search capabilities, and featured listings.

Interactive Maps and Navigation: Map views integrating location services to pinpoint real estate listings.

Detailed Property Views: High-resolution image galleries, unit specifications, virtual views, and user reviews.

Payment and Transactions: Multi-step payment workflows for booking and property transactions.

User Profiles: Account management, transaction history, saved properties, and setting controls.

Architecture and Design Patterns

Feature-Based Architecture: The codebase is structured around feature modules (e.g., auth, properties, payment, map) to ensure independent scalability and prevent cross-module coupling.

State Management: Implemented using Flutter Cubit (Bloc library) for predictable, reactive UI updates and separation of business logic from UI elements.

Backend Integration: Powered by Supabase for authentication, real-time database management, storage, and backend API requests.

Navigation: Managed via Auto Route for type-safe routing, parameter passing, and deep-linking support across nested navigation stacks.

Tech Stack and Tools

Framework: Flutter (Dart)

Backend Service (BaaS): Supabase (PostgreSQL Database, Auth, Storage)

State Management: Flutter Cubit

Routing: Auto Route (auto_route)

Maps and Location: Map Integration APIs / Location Services

Application Flow and Modules

Splash, Login, and Home: Onboarding flow, secure login, and main property dashboard.

Property Details and Reviews: Comprehensive property specifications, user-generated reviews, and house exploration pages.

Map and Navigation Module: Interactive geographical mapping showing nearby properties.

Payment Details: Multi-screen checkout, order summaries, and payment status verification.

Secondary Modules: Settings, profile adjustments, and application preferences.

Project Structure

habi-real-estate/
├── lib/
│   ├── core/                # Shared utilities, themes, Supabase client configuration, route setup
│   ├── features/            # Feature-first modular implementation
│   │   ├── auth/            # Authentication logic and UI
│   │   ├── home/            # Dashboard and feeds
│   │   ├── property/        # Property details, reviews, exploration
│   │   ├── map/             # Map view and navigation logic
│   │   ├── payment/         # Transaction and checkout flows
│   │   └── profile/         # User dashboard and preferences
│   └── main.dart
└── pubspec.yaml
