import 'package:azure_reborn/additional/preferences.dart';
import 'package:azure_reborn/screen/sign_in_screen/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../helper/navigators.dart';
import 'constant.dart';

class Generals {
  static void signOut() async {
    if (Preferences.getInstance().contain(SharedPreferenceKey.JWT_auth)) {
      BuildContext? buildContext = Navigators.navigatorState.currentContext;

      if (buildContext != null) {
        Preferences.getInstance().remove(SharedPreferenceKey.JWT_auth);

        Navigators.pushAndRemoveAll(buildContext, const SignInPage());
      }
    }
  }

  static Future<PackageInfo> getPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo;
  }
}