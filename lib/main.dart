import 'package:azure_reborn/screen/cpu_information_screen/bloc/cpu_information_bloc.dart';
import 'package:azure_reborn/screen/home_body/home_body.dart';
import 'package:azure_reborn/screen/home_body/home_body_bloc.dart';
import 'package:azure_reborn/screen/profile_tuning_screen/bloc/profile_tuning_bloc.dart';
import 'package:azure_reborn/screen/splash_screen/splash_screen.dart';
import 'package:azure_reborn/screen/splash_screen/splash_screen_bloc.dart';
import 'package:azure_reborn/screen/thermal_manager_screen/bloc/thermal_manager_bloc.dart';
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



      ],
      child: GetMaterialApp(
        title: 'Azure Reborn',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: seperator(),
      ),
    );
  }

  Widget seperator(){
   if(Preferences.getInstance().contain(SharedPreferenceKey.ProcessorKey)){
     return const HomeBody();
   }else{
     return const SplashScreen();
   }
  }

}


