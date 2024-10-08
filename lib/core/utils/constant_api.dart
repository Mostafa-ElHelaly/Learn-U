class ConstantApi {
  static const String baseUrl =
      'https://devops.exabyte-eg.com/projects/learnu/apis/public/api';

  static const String register = "$baseUrl/client/access/sign-up";
  static const String login = "$baseUrl/client/access/login";
  static const String forgetpassword = "$baseUrl/client/access/forget";
  static const String countries = "$baseUrl/public/deps/countries";
  static const String users = "$baseUrl/admin/clients/get";
  static const String categories = "$baseUrl/public/categories";
  static const String otpemail = "$baseUrl/client/access/otpmail";
  static const String search = "$baseUrl/public/courses";
  static const String trainers = "$baseUrl/admin/trainers/get";
  static const String coursedetails = "$baseUrl/public/course/";
  static const String sendreview = "$baseUrl/client/review/add";
  static const String getreview = "$baseUrl/public/course/reviews/";
}
