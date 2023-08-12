

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';




class WebViewScreen extends StatelessWidget {
  final String url;

  late WebViewController controller;

  WebViewScreen({Key? key, required this.url}) : super(key: key)
  {
    controller = WebViewController()..loadRequest(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(controller: controller),
    );
  }
}

