import 'package:azure_reborn/screen/community_post_screen/bloc/community_post_bloc.dart';
import 'package:azure_reborn/screen/cpu_information_screen/bloc/cpu_information_bloc.dart';
import 'package:azure_reborn/screen/feedback_user_screen/bloc/feedback_user_bloc.dart';
import 'package:azure_reborn/screen/home_body/home_body.dart';
import 'package:azure_reborn/screen/home_body/home_body_bloc.dart';
import 'package:azure_reborn/screen/my_profile/change_password_screen/bloc/change_password_bloc.dart';
import 'package:azure_reborn/screen/my_profile/delete_account_screen/bloc/delete_account_bloc.dart';
import 'package:azure_reborn/screen/my_profile/profile_screen/bloc/profile_screen_bloc.dart';
import 'package:azure_reborn/screen/my_profile/user_feedback_screen/bloc/user_feedback_bloc.dart';
import 'package:azure_reborn/screen/profile_tuning_screen/bloc/profile_tuning_bloc.dart';
import 'package:azure_reborn/screen/sign_in_screen/bloc/sign_in_bloc.dart';
import 'package:azure_reborn/screen/sign_in_screen/sign_in_page.dart';
import 'package:azure_reborn/screen/splash_screen/splash_screen.dart';
import 'package:azure_reborn/screen/splash_screen/splash_screen_bloc.dart';
import 'package:azure_reborn/screen/thermal_manager_screen/bloc/thermal_manager_bloc.dart';
import 'package:azure_reborn/screen/user_profile_screen/bloc/user_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'additional/constant.dart';
import 'additional/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.getInstance().init();

  SystemChrome.setSystemUIOverlayStyle(
   const SystemUiOverlayStyle(
      // statusBarColor: Colors.red, // You can use this as well
      statusBarIconBrightness: Brightness.dark, // OR Vice Versa for ThemeMode.dark
      statusBarBrightness: Brightness.light, // OR Vice Versa for ThemeMode.dark
    ),
  );
  runApp(const MyApp());


}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SplashScreenBloc(),),
        BlocProvider(create: (_) => HomeBodyBloc(),),
        BlocProvider(create: (_) => CpuInformationBloc(),),
        BlocProvider(create: (_) => ProfileTuningBloc(),),
        BlocProvider(create: (_) => ThermalManagerBloc(),),
        BlocProvider(create: (_) => SignInBloc(),),
        BlocProvider(create: (_) => FeedbackUserBloc(),),
        BlocProvider(create: (_) => CommunityPostBloc(),),
        BlocProvider(create: (_) => UserProfileBloc(),),
        BlocProvider(create: (_) => ChangePasswordBloc(),),
        BlocProvider(create: (_) => DeleteAccountBloc(),),
        BlocProvider(create: (_) => ProfileScreenBloc(),),
        BlocProvider(create: (_) => UserFeedbackBloc(),),



      ],
      child: DismissableKeyboard(
        widget: GetMaterialApp(
          title: 'Azure Reborn',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: seperator(),
        ),
      ),
    );
  }
}
  Widget seperator(){
   if (Preferences.getInstance().contain(SharedPreferenceKey.JWT_auth) && Preferences.getInstance().contain(SharedPreferenceKey.TOKEN)) {
     if(Preferences.getInstance().contain(SharedPreferenceKey.ProcessorKey)){
       return const HomeBody();
     }else{
       return const SplashScreen();
     }
  } else {
     return const SignInPage();
   }

}

class DismissableKeyboard extends StatelessWidget {
  final Widget widget;

  const DismissableKeyboard({
    Key? key,
    required this.widget
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode focusScopeNode = FocusScope.of(context);

          if (!focusScopeNode.hasPrimaryFocus && focusScopeNode.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: widget
    );
  }
}


