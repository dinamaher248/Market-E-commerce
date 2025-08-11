class Endpoints {
  static String baseUrl = "https://marketi-app.onrender.com/api/v1";
  static String baseUrlForImage = "https://marketi-app.onrender.com";
  static String signInUrl = "$baseUrl/auth/signIn";
  static String signUpUrl = "$baseUrl/auth/signUp";
  static String sendPassEmail = "$baseUrl/auth/sendPassEmail";
  static String activeResetPass = "$baseUrl/auth/activeResetPass";
  static String resetPassword = "$baseUrl/auth/resetPassword";
  static String productUrl = "$baseUrl/home/products";
  static String categoryUrl = "$baseUrl/home/categories";
  static String brandsUrl = "$baseUrl/home/brands";
  static String bannerssUrl = "$baseUrl/home/banners";
  static String topSearchsUrl = "$baseUrl/home/topSearch";
}

class ApiKey {
  static String email = "email";
  static String password = "password";
  static String name = "name";
  static String phone = "phone";
  static String confirmPassword = "confirmPassword";
  static String id = "id";
  static String statusCode = "statusCode";
  static String message = "message";
  static String token = "token";
  static String status = "status";
  static String code = "code";
}
