class ConstantApi {
  static const String baseUrl =
      'https://devops.exabyte-eg.com/projects/learnu/apis/public/api';

  static const String register = "$baseUrl/client/access/sign-up";
  static const String login = "$baseUrl/client/access/login";
  static const String forgetPassword = "$baseUrl/client/access/forget";
  static const String countries = "$baseUrl/public/deps/countries";
  static const String users = "$baseUrl/admin/clients/get";
  static const String categories = "$baseUrl/admin/categories/get";
  static const String otPeMail = "$baseUrl/client/access/otpmail";
  static const String search = "$baseUrl/public/courses/search";
}
