import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_platform_interface/src/types/web_resource_error.dart'
    as webview_flutter;

class PrivacyandPolicy extends StatefulWidget {
  PrivacyandPolicy({super.key});

  @override
  State<PrivacyandPolicy> createState() => _PrivacyandPolicyState();
}

class _PrivacyandPolicyState extends State<PrivacyandPolicy> {
  final String url =
      'https://devops.exabyte-eg.com/projects/learnu/web/#/privacy-policy';

  late WebViewController controller;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (webview_flutter.WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri.uri(Uri.parse("${url}")),
        ),
        onReceivedServerTrustAuthRequest: (controller, challenge) async {
          print("challenge $challenge");
          return ServerTrustAuthResponse(
            action: ServerTrustAuthResponseAction.PROCEED,
          );
        },
        onWebViewCreated: (controller) {
          controller.addJavaScriptHandler(
            handlerName: 'onReady',
            callback: (args) {
              print('onReady');
              print(args);
            },
          );
          controller.addJavaScriptHandler(
            handlerName: 'onProgress',
            callback: (args) {
              print('onProgress');
              print(args);
            },
          );
          controller.addJavaScriptHandler(
            handlerName: 'onUpdate',
            callback: (args) {
              print('onUpdate');
              print(args);
            },
          );
          controller.addJavaScriptHandler(
            handlerName: 'onPlay',
            callback: (args) {
              print('onPlay');
              print(args);
            },
          );
          controller.addJavaScriptHandler(
            handlerName: 'onPause',
            callback: (args) {
              print('onPause');
              print(args);
            },
          );
          controller.addJavaScriptHandler(
            handlerName: 'onEnd',
            callback: (args) {
              print('onEnd');
              print(args);
            },
          );
          controller.addJavaScriptHandler(
            handlerName: 'onError',
            callback: (args) {
              print('onError');
              print(args);
            },
          );
        },
      ),
    );
  }
}
