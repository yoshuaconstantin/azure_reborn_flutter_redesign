import 'package:get/get.dart';

class Dimension {

  static double CustomSize(int number){
    double width = screenHeight/(screenHeight/number);

    return width;
  }


  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double width5 = screenHeight/(screenHeight/5);
  static double width10 = screenHeight/(screenHeight/10);
  static double width15 = screenHeight/(screenHeight/15);
  static double width20 = screenHeight/(screenHeight/20);
  static double width25 = screenHeight/(screenHeight/25);
  static double width30 = screenHeight/(screenHeight/30);
  static double width35 = screenHeight/(screenHeight/35);
  static double width40 = screenHeight/(screenHeight/40);


  static double height5 = screenHeight/(screenHeight/5);
  static double height10 = screenHeight/(screenHeight/10);
  static double height15 = screenHeight/(screenHeight/15);
  static double height20 = screenHeight/(screenHeight/20);
  static double height25 = screenHeight/(screenHeight/25);
  static double height30 = screenHeight/(screenHeight/30);
  static double height35 = screenHeight/(screenHeight/35);
  static double height40 = screenHeight/(screenHeight/40);


  static double radius5 = screenHeight/(screenHeight/5);
  static double radius10 = screenHeight/(screenHeight/10);
  static double radius15 = screenHeight/(screenHeight/15);
  static double radius20 = screenHeight/(screenHeight/20);
  static double radius25 = screenHeight/(screenHeight/25);
  static double radius30 = screenHeight/(screenHeight/30);

  static double size4 = screenHeight/(screenHeight/4);
  static double size6 = screenHeight/(screenHeight/6);
  static double size8 = screenHeight/(screenHeight/8);
  static double size10 = screenHeight/(screenHeight/10);
  static double size12 = screenHeight/(screenHeight/12);
  static double size14 = screenHeight/(screenHeight/14);
  static double size16 = screenHeight/(screenHeight/16);
  static double size18 = screenHeight/(screenHeight/18);
  static double size20 = screenHeight/(screenHeight/20);
  static double size24 = screenHeight/(screenHeight/24);
  static double size28 = screenHeight/(screenHeight/28);

}
