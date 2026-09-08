class AppConstants {
  // App Info
  static const String appName = 'HabiSpace';

  // Supabase Configuration
  // TODO: Replace with your actual Supabase Project URL and Anon Key
  static const String supabaseUrl = 'https://lqhkeefmtatfygxbnepb.supabase.co';
  static const String supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxxaGtlZWZtdGF0ZnlneGJuZXBiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODg3MDkyMjYsImV4cCI6MjEwNDI4NTIyNn0.p8t5ws5iIzMhpTJgIdBi-WT1c2t5Iezj7JoH086VP_E';

  // Supabase Database Tables & Buckets
  static const String profilesTable = 'profiles';
  static const String avatarsBucket = 'avatars';

  // Languages
  static const String arabicLangCode = 'ar';
  static const String englishLangCode = 'en';

  // Cache & Storage Keys
  static const String cachedUserKey = 'CACHED_USER';
  static const String userTokenKey = 'USER_TOKEN';

  // Default Error Messages
  static const String networkErrorMessage = 'Network error. Please check your connection.';
  static const String serverErrorMessage = 'Server error. Please try again later.';
  static const String cacheErrorMessage = 'Cache error occurred.';
  static const String unknownErrorMessage = 'An unknown error occurred.';
}
