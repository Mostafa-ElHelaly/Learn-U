import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class SwarmfyVideoPage extends StatelessWidget {
  const SwarmfyVideoPage({super.key, required this.video_link});
  final String video_link;
  final String base_video_url =
      'https://devops.exabyte-eg.com/projects/learnu/web/swarmify.html?src=';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri.uri(Uri.parse(video_link.contains('youtu')
              ? video_link
              : "${base_video_url}${video_link}")),
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
