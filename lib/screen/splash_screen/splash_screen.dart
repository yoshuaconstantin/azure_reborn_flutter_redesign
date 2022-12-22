import 'package:azure_reborn/additional/dimension.dart';
import 'package:azure_reborn/screen/splash_screen/splash_screen_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../additional/app_color.dart';
import '../../additional/constant.dart';
import '../../root_file/root_init/request_root.dart';
import '../../widget/text_with_font.dart';
import '../home_body/home_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashScreenBloc, SplashScreenState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is Loading) {
          } else if (state is GoToMainHome) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeBody(),
                ));
          }else if(state is onSplashCheckRootSuccess){
            if(state.statusRoot){

            }else{

            }
            setState(() {

            });
          }else if(state is Failed){

          }
        },
        child: Container(
            width: Dimension.screenWidth,
            height: Dimension.screenHeight,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [AppColor.seaBlue, AppColor.lightPink], begin: Alignment.centerLeft, end: Alignment.centerRight)),
            child: Container(
              width: Dimension.screenWidth,
              margin: EdgeInsets.only(
                  top: Dimension.screenHeight * 0.2, right: Dimension.screenWidth * 0.06, left: Dimension.screenWidth * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: Dimension.screenHeight * 0.01),
                      child: Image.asset(
                        "assets/image/icons/azurenewlogo_round.png",
                        width: Dimension.screenWidth * 0.22,
                        height: Dimension.screenHeight * 0.14,
                      )),
                  Container(
                    margin: EdgeInsets.only(bottom: Dimension.screenHeight * 0.04),
                    child: textWithFont(text: Constant().azureTextSplashHead, color: Colors.black, fontSize: 50, fontWeight: FontWeight.w900, fontFamily: 'poesten',),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: Dimension.screenHeight * 0.025, right: Dimension.screenWidth * 0.2),
                    child: textWithFont(text: Constant().azureTextSplashBody, color: Colors.black, fontSize: 17, fontWeight: FontWeight.w300, fontFamily: 'ralewayLight',)
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: Dimension.screenHeight * 0.03),
                    child: Text(
                      Constant().azureTextSplashEnd,
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          width: Dimension.screenWidth * 0.3,
                          height: Dimension.screenHeight * 0.18,
                          margin: EdgeInsets.only(right: Dimension.screenWidth * 0.05),
                          child: NeumorphicButton(
                            onPressed: () {
                              context.read<SplashScreenBloc>().add(onButtonPressed(type: 0));
                            },
                            style: NeumorphicStyle(
                                depth: -7,
                                intensity: 1,
                                surfaceIntensity: 0.3,
                                shape: NeumorphicShape.concave,
                                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(30)),
                                lightSource: LightSource.topLeft,
                                shadowLightColor: const Color(0xFF4ac3c1),
                                shadowDarkColor: const Color(0XFF64ffff),
                                color: AppColor.blueazure),
                            child: Column(
                              children: [
                                Image.asset('assets/image/img_data/sd888.png',
                                width: Dimension.screenWidth * 0.15,
                                height: Dimension.screenHeight * 0.07,),
                                SizedBox(height: Dimension.height15,),
                                textWithFont(text: Constant().sd888, color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600, fontFamily: 'ralewayLight',),
                                SizedBox(height: Dimension.height10,),
                                textWithFont(text: Constant().tap, color: Colors.white, fontSize: 14, fontWeight: FontWeight.w300, fontFamily: 'ralewayLight',),


                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: Dimension.screenWidth * 0.3,
                          height: Dimension.screenHeight * 0.18,
                          margin: EdgeInsets.only(left: Dimension.screenWidth * 0.05),
                          child: NeumorphicButton(
                            onPressed: () {
                              context.read<SplashScreenBloc>().add(onButtonPressed(type: 1));
                            },
                            style: NeumorphicStyle(
                                depth: -7,
                                intensity: 1,
                                surfaceIntensity: 0.3,
                                shape: NeumorphicShape.concave,
                                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(30)),
                                lightSource: LightSource.topLeft,
                                shadowLightColor: const Color(0xFFb87bd5),
                                shadowDarkColor: const Color(0XFFf8a7ff),
                                color: Color(0XFFd891fa)),
                            child: Column(
                              children: [
                                Image.asset('assets/image/img_data/sd870.png',
                                  width: Dimension.screenWidth * 0.15,
                                  height: Dimension.screenHeight * 0.07,),
                                SizedBox(height: Dimension.height15,),
                                textWithFont(text: Constant().sd870, color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600, fontFamily: 'ralewayLight',),
                                SizedBox(height: Dimension.height10,),
                                textWithFont(text: Constant().tap, color: Colors.white, fontSize: 14, fontWeight: FontWeight.w300, fontFamily: 'ralewayLight',),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
