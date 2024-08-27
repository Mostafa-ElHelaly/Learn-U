import 'package:Learn_U/core/utils/config_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class PrivacyandPolicy extends StatefulWidget {
  PrivacyandPolicy({super.key});

  @override
  State<PrivacyandPolicy> createState() => _PrivacyandPolicyState();
}

class _PrivacyandPolicyState extends State<PrivacyandPolicy> {
  final String url =
      'https://devops.exabyte-eg.com/projects/learnu/web/#/view/ar/privacy-policy';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InAppWebView(
      initialUrlRequest: URLRequest(
        url: WebUri.uri(Uri.parse(url)),
      ),
    ));
  }
}
