import 'package:flutter/material.dart';
import 'package:smart_budget_companion_113/widgets/custom_app_bar_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebBlueScopeNews extends StatefulWidget {
  final String url;
  final String title;

  const WebBlueScopeNews({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);

  @override
  State<WebBlueScopeNews> createState() => _WebBlueScopeNewsState();
}

class _WebBlueScopeNewsState extends State<WebBlueScopeNews> {
  late WebViewController controller;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarSmartBudget(title: widget.title),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: WebViewWidget(
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
