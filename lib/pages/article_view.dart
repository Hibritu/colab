import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb, defaultTargetPlatform, TargetPlatform;
import 'package:webview_windows/webview_windows.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticlePage extends StatelessWidget {
  final String url;
  const ArticlePage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      // For web, open in a new tab
      _launchURL() async {
        if (await canLaunch(url)) {
          await launch(url);
        }
      }
      WidgetsBinding.instance.addPostFrameCallback((_) => _launchURL());
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              margin: EdgeInsets.only(top: 40.0, bottom: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Buzz",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "line",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Center(child: Text('Opening article in browser...')),
                ],
              ),
            ),
          ),
        ),
      );
    } else if (defaultTargetPlatform == TargetPlatform.windows) {
      return _WindowsWebView(url: url);
    } else if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS) {
      return _MobileWebView(url: url);
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('Buzzline')),
        backgroundColor: Colors.white,
        body: const Center(child: Text('WebView is not supported on this platform.')),
      );
    }
  }
}

class _WindowsWebView extends StatefulWidget {
  final String url;
  const _WindowsWebView({required this.url});

  @override
  State<_WindowsWebView> createState() => _WindowsWebViewState();
}

class _WindowsWebViewState extends State<_WindowsWebView> {
  final _controller = WebviewController();

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    await _controller.initialize();
    await _controller.loadUrl(widget.url);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Article')),
      body: Webview(_controller),
    );
  }
}

class _MobileWebView extends StatelessWidget {
  final String url;
  const _MobileWebView({required this.url});

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..loadRequest(Uri.parse(url));
    return Scaffold(
      appBar: AppBar(title: const Text('Buzzline')),
      backgroundColor: Colors.white,
      body: WebViewWidget(controller: controller),
    );
  }
}