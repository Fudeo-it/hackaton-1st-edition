import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWrapperWidget extends StatefulWidget {
  final String url;
  const WebViewWrapperWidget({Key? key, required this.url}) : super(key: key);

  @override
  State<WebViewWrapperWidget> createState() => _WebViewWrapperWidgetState();
}

class _WebViewWrapperWidgetState extends State<WebViewWrapperWidget> {
  late final WebViewController _controller;
  int _loadingPercentage = 0;

  @override
  void initState() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) => setState(() {
            _loadingPercentage = 0;
          }),
          onPageFinished: (url) => setState(() {
            _loadingPercentage = 100;
          }),
          onWebResourceError: (WebResourceError error) {},
          onProgress: (progress) => setState(() {
            _loadingPercentage = progress;
          }),
          onNavigationRequest: (NavigationRequest request) =>
              NavigationDecision.navigate,
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebViewWidget(controller: _controller),
        if (_loadingPercentage < 100)
          LinearProgressIndicator(
            value: _loadingPercentage / 100.0,
          ),
      ],
    );
  }
}
