import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_budget_companion_113/budget/budget_local_dto.dart';
import 'package:smart_budget_companion_113/budget/budget_methods.dart';
import 'package:smart_budget_companion_113/budget/budget_repo.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BudgetOpaPage extends StatefulWidget {
  final String link;

  const BudgetOpaPage({
    Key? key,
    required this.link,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BudgetOpaPageState();
  }
}

class _BudgetOpaPageState extends State<BudgetOpaPage> {
  late WebViewController wbController;
  late String wvlnk;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    wvlnk = widget.link;
    wbController = WebViewController()
      ..setUserAgent('webview_aso_ios_3')
      ..setNavigationDelegate(
        NavigationDelegate(
          onUrlChange: (url) async {
            final currentUrl = url.url ?? '';

            if (currentUrl.contains('cabinet')) {
              final localObject = await BudgetRepo().budgetHiveGet();
              if (localObject != null) {
                final newLocalObject = BudgetLocalDto(
                  reg: localObject.reg,
                  strt: localObject.strt,
                  log: localObject.log,
                  cab: currentUrl,
                );
                await BudgetRepo().budgetHiveSet(newLocalObject);
              }
            }
            final openInBrowser = currentUrl.contains('.xlsx') ||
                currentUrl.contains('.pdf') ||
                currentUrl.contains('app/po-trade-broker') ||
                currentUrl.contains('openbrowser=1');
            if (openInBrowser) {
              budgetBrowse(currentUrl);
            }
            if (currentUrl.contains('logout')) {
              final localObject = await BudgetRepo().budgetHiveGet();
              if (localObject != null) {
                final newLocalObject = BudgetLocalDto(
                  reg: localObject.reg,
                  strt: localObject.strt,
                  log: localObject.log,
                  cab: '',
                );
                await BudgetRepo().budgetHiveSet(newLocalObject);
              }
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(wvlnk))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 5));
    });
    _enableRotation();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await wbController.canGoBack()) {
          await wbController.goBack();
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).viewPadding.top,
            bottom: MediaQuery.of(context).viewPadding.bottom,
          ),
          child: WebViewWidget(
            controller: wbController,
          ),
        ),
      ),
    );
  }

  void _enableRotation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }
}
