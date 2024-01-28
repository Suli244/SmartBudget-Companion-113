import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:flutter_network_connectivity/flutter_network_connectivity.dart';
import 'package:country_codes/country_codes.dart';
// ignore: depend_on_referenced_packages
import 'package:url_launcher/url_launcher.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tzdata;

Future<bool> budgetIsUsingVpn() async {
  var connectivityResult = await (Connectivity().checkConnectivity());

  return connectivityResult == ConnectivityResult.vpn;
}

Future<String> budgetCountryCode() async {
  await CountryCodes.init();

  final Locale? deviceLocale = CountryCodes.getDeviceLocale();

  if (deviceLocale != null && deviceLocale.countryCode != null) {
    return deviceLocale.countryCode!.toLowerCase();
  }
  return '';
}

Future<bool> budgetIsSemulator(BuildContext context) async {
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  if (Theme.of(context).platform == TargetPlatform.iOS) {
    IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
    return !iosDeviceInfo.isPhysicalDevice;
  }
  return false;
}

Future<int> budgetBatteryLevel() async {
  final Battery battery = Battery();
  try {
    int batteryLevel = await battery.batteryLevel;

    return batteryLevel;
  } catch (e) {
    print('Error: $e');
  }
  return 0;
}

Future<bool> budgetIsCharging() async {
  final Battery battery = Battery();
  try {
    bool isCharging = false;
    battery.onBatteryStateChanged.listen((BatteryState state) {
      if (state == BatteryState.charging) {
        isCharging = true;
      }
    });
    return isCharging;
  } catch (e) {
    throw Exception(e);
  }
}

Future<bool> budgetHasSim(BuildContext context) async {
  return true;
}

Future<bool> budgetIsInternetConnected() async {
  final FlutterNetworkConnectivity flutterNetworkConnectivity =
      FlutterNetworkConnectivity(
    isContinousLookUp: true,
    lookUpDuration: const Duration(seconds: 5),
  );
  bool isNetworkConnectedOnCall =
      await flutterNetworkConnectivity.isInternetConnectionAvailable();
  return isNetworkConnectedOnCall;
}

Future<void> budgetBrowse(String ur) async {
  final url = Uri.parse(ur).normalizePath();
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}

Future<String> budgetGetTime() async {
  tzdata.initializeTimeZones();

  tz.TZDateTime moscowTime = tz.TZDateTime.now(tz.getLocation('Europe/Moscow'));
  return DateTime(moscowTime.year, moscowTime.month, moscowTime.day,
          moscowTime.hour, moscowTime.minute)
      .toString();
}
