import 'package:azure_reborn/screen/home_body/home_body.dart';
import 'package:azure_reborn/screen/home_body/home_body_bloc.dart';
import 'package:azure_reborn/screen/splash_screen/splash_screen.dart';
import 'package:azure_reborn/screen/splash_screen/splash_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'additional/constant.dart';
import 'additional/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.getInstance().init();

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
        BlocProvider(create: (_) => HomeBodyBloc(),)

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


