import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class RefundPolicy extends StatelessWidget {
  RefundPolicy({super.key});
  final String url =
      'https://devops.exabyte-eg.com/projects/learnu/web/#/view/ar/refund-policy';
  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialUrlRequest: URLRequest(
        url: WebUri.uri(Uri.parse(url)),
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
    );
  }
}
