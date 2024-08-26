import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class SwarmfyVideoPage extends StatelessWidget {
  const SwarmfyVideoPage({super.key});

  final String src =
      'swarmify://21ccbf0f95a4a8d1a374e90bb05c1f89b2ea761db25f6f7a7b7c20f5c33f20a8';

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialUrlRequest: URLRequest(
        url: WebUri.uri(Uri.parse(
            "https://devops.exabyte-eg.com/projects/learnu/web/swarmify.html?src=${src}")),
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
