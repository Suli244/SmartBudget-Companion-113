import 'package:flutter/material.dart';
import 'package:smart_budget_companion_113/widgets/custom_app_bar_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PerehodPoSsylke extends StatefulWidget {
  final String ssylka;
  final String title;

  const PerehodPoSsylke({
    Key? key,
    required this.title,
    required this.ssylka,
  }) : super(key: key);

  @override
  State<PerehodPoSsylke> createState() => _PerehodPoSsylkeState();
}

class _PerehodPoSsylkeState extends State<PerehodPoSsylke> {
  late WebViewController controller;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.ssylka));
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
