import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class PrcicingScreen extends StatelessWidget {
  PrcicingScreen({super.key});

  final String url =
      'https://devops.exabyte-eg.com/projects/learnu/web/#/view/ar/pricing';

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
