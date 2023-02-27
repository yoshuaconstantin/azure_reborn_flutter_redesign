import 'package:azure_reborn/additional/dimension.dart';
import 'package:azure_reborn/screen/thermal_manager_screen/bloc/thermal_manager_bloc.dart';
import 'package:azure_reborn/widget/FlushBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:lottie/lottie.dart';
import 'package:root_access/root_access.dart';

import '../../additional/constant.dart';
import '../../helper/dialogs.dart';
import '../../helper/navigators.dart';
import '../../model/thermal_manger_model/thermal_manager_model.dart';
import '../../widget/text_with_font.dart';

class ThermalManager extends StatefulWidget {
  const ThermalManager({Key? key}) : super(key: key);

  @override
  State<ThermalManager> createState() => _ThermalManagerState();
}


class _ThermalManagerState extends State<ThermalManager> {

  List<ThermalManagerModel> thermalModel = [];

  int? _selectedIndex;
  int? _selectedValue;

  bool _isSucces = false;

  bool isSelectedProfile = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for(int i=0 ; i < ThermalManagerConstant().profile.length;i++){
      thermalModel.add(ThermalManagerModel(profile: ThermalManagerConstant().profile[i], value: ThermalManagerConstant().value[i]));
    }

    RootAccess.requestRootAccess;

    context.read<ThermalManagerBloc>().add(refreshData());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ThermalManagerBloc, ThermalManagerState>(
  listener: (context, state) async {
    // TODO: implement listener
    if(state is onSetThermalSuccess){
      setState(() {
        _isSucces = true;
      });

      Future.delayed(Duration(milliseconds: 2000), (){
        setState(() {
          _isSucces = false;
          _selectedIndex = null;
          isSelectedProfile = false;
          _selectedValue = null;
        });
      });

      Future.delayed(Duration(milliseconds: 2000), (){
        context.read<ThermalManagerBloc>().add(refreshData());
      });

    }else if(state is onRefreshSuccess){
      setState(() {
        _selectedIndex = state.index;
      });
    }else if(state is onFailed){
      FlushBarWidget.showFailure(state.message).show(context);
    }else if(state is onCatchError){
      Navigators.errorScreen(context, state.message);
    }
  },
  child: Container(
        padding: EdgeInsets.symmetric(vertical: Dimension.CustomSize(15), horizontal: Dimension.CustomSize(25)),
        width: Dimension.screenWidth,
        height: Dimension.screenHeight,
        color: Color(0xFF162D0D),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: Dimension.CustomSize(24),),
                Container(
                  height: Dimension.screenHeight * 0.12,
                  width: Dimension.screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      ElevatedButton(
                          onPressed: (){
                            HapticFeedback.heavyImpact();
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back, size: 35, color: Color(0xFF162D0D),),
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            backgroundColor: Color(0xFFA1AB9E),
                            fixedSize: Size(Dimension.CustomSize(75), Dimension.CustomSize(75))
                          ),
                      ),
                      Container(
                        height: Dimension.screenHeight,
                        width: Dimension.screenWidth * 0.4,
                        padding: EdgeInsets.all(Dimension.CustomSize(10)),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color(0xFFA1AB9E)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textWithFont(text: "FEATURE RANK",
                              color: Color(0xFF162D0D),
                              fontFamily: "openSansExtraBold",
                              fontSize: 20,
                              fontWeight: FontWeight.w800,),
                            textWithFont(text: "EXPERT",
                              color: Color(0xFF162D0D),
                              fontFamily: "ralewayLight",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,),
                            RoundedProgressBar(
                              percent: 44,
                              height: Dimension.screenHeight * 0.03,
                              style: RoundedProgressBarStyle(
                                colorBorder: Colors.transparent,
                                widthShadow: 0,
                                borderWidth: 0,
                                backgroundProgress: Color(0xFF6E7C78),
                                colorProgress: Color(0xFF2C4C3B),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Dimension.screenHeight * 0.07,),
                Container(
                  width: Dimension.screenWidth * 0.9,
                  child: textWithFont(text: "What thermal Profile that suit you today?",
                    color: Colors.white,
                    fontFamily: "openSansExtraBold",
                    fontSize:30,
                    fontWeight: FontWeight.w900,
                    alignment: TextAlign.center,),
                ),
                SizedBox(height: Dimension.screenHeight *0.05,),
                Container(
                  width: Dimension.screenWidth * 0.9,
                  child: textWithFont(text: "Select 1 thermal profile",
                    color: Colors.white,
                    fontFamily: "ralewayLight",
                    fontSize:20,
                    fontWeight: FontWeight.w500,
                    alignment: TextAlign.center,),
                ),
                SizedBox(height: Dimension.screenHeight *0.04,),
                Container(
                  width: Dimension.screenWidth,
                  height: Dimension.screenHeight * 0.35,
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: (5 / 3),
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            HapticFeedback.lightImpact();
                              if(_selectedIndex == index){
                                setState(() {
                                  _selectedIndex = null;
                                  isSelectedProfile = false;
                                  _selectedValue = null;
                                });
                                context.read<ThermalManagerBloc>().add(refreshData());
                              }else {
                                setState(() {
                                  _selectedIndex = index;
                                  isSelectedProfile = true;
                                  _selectedValue = thermalModel[index].value;
                                });
                              }
                          },
                          child: Container(
                            decoration: BoxDecoration(color: Colors.white.withOpacity( _selectedIndex == index ? 0.8 :0.5), borderRadius: BorderRadius.circular(30)),
                            margin: EdgeInsets.all(Dimension.CustomSize(7)),
                            width: Dimension.screenWidth * 0.1,
                            child: Center(
                              child: textWithFont(text: thermalModel[index].profile,
                                color: _selectedIndex == index ? Color(0xFF162D0D) : Colors.white,
                                fontFamily:  "ralewayLight",
                                fontSize:_selectedIndex == index ? 22 : 20,
                                fontWeight:_selectedIndex == index ? FontWeight.bold : FontWeight.w600,
                                alignment: TextAlign.center,),
                            ),
                          ),
                        );
                      },
                    itemCount: thermalModel.length,
                  ),
                ),
                SizedBox(height: Dimension.screenHeight *0.03,),
                Container(
                  height: Dimension.screenHeight * 0.17,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: Dimension.screenWidth * 0.3,
                        height: Dimension.screenHeight * 0.17,
                        child: Image.asset("assets/image/img_data/poweredbyazure.png"),
                      ),
                      InkWell(
                        onTap: (){
                          if(_selectedValue != null){
                            HapticFeedback.mediumImpact();

                            //set thermal based on user select
                            context.read<ThermalManagerBloc>().add(setThermalSettings(value: _selectedValue!));

                          }else {
                            HapticFeedback.lightImpact();

                            Dialogs.confirmation(
                                buildContext: context,
                                title: "Choosing nothing will set Thermal to dafault",
                                positiveCallback: (){
                                  //setZram Default
                                  context.read<ThermalManagerBloc>().add(setThermalSettings(value: -1));
                                }
                            );
                          }
                        },
                        child: Container(
                          width: Dimension.screenWidth * 0.22,
                          height: Dimension.screenHeight * 0.07,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.transparent,
                              border: Border.all(width: 2, color: isSelectedProfile ? Colors.red : Colors.white, )
                          ),
                          child: Icon(Icons.arrow_forward_outlined, size: 40, color: Colors.white,),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            if(_isSucces)
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: Dimension.screenHeight * 0.13),

                child:
                Lottie.asset(
                    "assets/anim/lottie_json/succes.json",
                    animate: _isSucces,
                    width: Dimension.screenWidth * 0.2,
                    height: Dimension.screenHeight * 0.1
                ),
              ),
            )
          ],
        ),
      ),
),
    );
  }

  void refresh() {
  //add context here to refresh
  }

}
