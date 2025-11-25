class ApiConstants {
  // Base URL
  static const String baseUrl = 'https://flutter.topmax.ae/api-test/';

  // Auth Endpoints
  static const String requestOtp = 'user/request-otp';
  static const String verifyOtp = 'user/verify-otp';
  static const String resendOtp = 'user/resend-otp';
  static const String logout = 'user/logout';

  // Home Endpoints
  static const String mobileHome = 'mobile/home';
  static const String search = 'home/search';

  // Jobs Endpoints
  static const String jobs = 'user/jobs';
  static String jobDetails(int id) => 'user/jobs/$id';
  static String toggleSaveJob(int id) => 'user/jobs/$id/toggle-save';

  // Courses Endpoints
  static const String courses = 'user/courses';
  static String courseDetails(int id) => 'user/courses/$id';
  static String saveCourse(int id) => 'user/courses/$id/save';

  // Saved Items
  static const String savedItems = 'user/saved-items';

  // Location Endpoints
  static const String countries = 'location/countries';
  static String cities(int countryId) => 'location/countries/$countryId/cities';
  static String defaultCities(int countryId) => 'location/cities/$countryId';

  // Headers
  static const String acceptHeader = 'application/json';
  static const String acceptLanguageHeader = 'ar';
  static const String userAgentHeader = 'okhttp';
}

