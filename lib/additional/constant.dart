class Constant {

  final String azureTextSplashHead = "Azure\nMade\nSimpler";
  final String azureTextSplashBody = "Take advantage of all the features and modes to satisfy your needs with Azure";
  final String azureTextSplashEnd = "Select your processor type";

  final String mostUsedMode = "Most used mode\nTake a look!";
  final String currentMode = "Your Current\nActived Mode";

  final String verticalChill ="CHILL";

  final String tap = "Tap to Select";

  final String sd888 ="SD 888";
  final String sd870 ="SD 870";

  //Shell Script
  final String silverCore0 = "cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq | awk '{print \$1/1000000}'";
  final String silverCore1 = "cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq | awk '{print \$1/1000000}'";
  final String silverCore2 = "cat /sys/devices/system/cpu/cpu2/cpufreq/scaling_cur_freq | awk '{print \$1/1000000}'";
  final String silverCore3 = "cat /sys/devices/system/cpu/cpu3/cpufreq/scaling_cur_freq | awk '{print \$1/1000000}'";

  final String goldCore4 ="cat /sys/devices/system/cpu/cpu4/cpufreq/scaling_cur_freq | awk '{print \$1/1000000}'";
  final String goldCore5 ="cat /sys/devices/system/cpu/cpu4/cpufreq/scaling_cur_freq | awk '{print \$1/1000000}'";
  final String goldCore6 ="cat /sys/devices/system/cpu/cpu4/cpufreq/scaling_cur_freq | awk '{print \$1/1000000}'";
  final String goldCore7 ="cat /sys/devices/system/cpu/cpu4/cpufreq/scaling_cur_freq | awk '{print \$1/1000000}'";

  final String primeCore7="cat /sys/devices/system/cpu/cpu7/cpufreq/scaling_cur_freq | awk '{print \$1/1000000}'";

  final String gpuMaxFreq = "cat /sys/class/kgsl/kgsl-3d0/max_gpuclk | awk '{print \$1/1000000}'";
  final String gpuMinFreq = "cat /sys/class/kgsl/kgsl-3d0/min_clock_mhz | awk '{print \$1/1}'";
  final String gpuFreq = "cat /sys/class/kgsl/kgsl-3d0/gpuclk | awk '{print \$1/1000000}'";

  final String memTotal = "cat /proc/meminfo | grep MemTotal | awk '{print \$2}'";
  final String memFree = "cat /proc/meminfo | grep MemAvailable | awk '{print \$2}'";

  final String swapTotal = "cat /proc/meminfo | grep SwapTotal | awk '{print \$2}'";
  final String swapUsed = "cat /proc/meminfo | grep SwapFree | awk '{print \$2}'";

  final String swappiness = "cat /proc/sys/vm/swappiness";
  final String swaptype = "cat /sys/block/zram0/comp_algorithm";


  final String thermalZoneGPU ="cat /sys/class/thermal/thermal_zone32/temp | awk '{print \$1/1000}'";

  final String thermalZoneCpu0 ="cat /sys/class/thermal/thermal_zone45/temp | awk '{print \$1/1000}'";
  final String thermalZoneCpu4 ="cat /sys/class/thermal/thermal_zone49/temp | awk '{print \$1/1000}'";
  final String thermalZoneCpu7 ="cat /sys/class/thermal/thermal_zone52/temp | awk '{print \$1/1000}'";

  final String thermalZoneBatt ="cat /sys/class/thermal/thermal_zone91/temp | awk '{print \$1/1000}'";

  final String thermalSettings ="/sys/devices/virtual/thermal/thermal_message/sconfig'";



}


enum SharedPreferenceKey {
  ProcessorKey,
  ModeActived,
  TimeElapsed,
  FeatureModeRank,
  FeatureThermalRank,
  FeatureDozeRank,
  DailyTimer,
  ChillTimesUsed,
  SmartTimesUsed,
  FastTimesUsed,

}

class QuotesRandom{

List<String> Quotes =
[
  "Don't use FAST AF if you want to have better battery backup, use Chill instead",
  "For daily basis use SMART to get both stable performance and battery backup",
  "Disable Zram help you get better battery backup",
  "Turning down Swappiness get you a little bit of more battery backup",
  "Chill mode is designed for best battery backup, not for hard gaming",
  "Doze mode help you to get better Off Screen Battery Drain",
  "Raise your activeness to get LEGENDS rank on each FEATURES!",
  "This new Remake Azure TW is using Flutter for the code",
  "Don't get lazy, do some work guys.."

];

///QuotesLenght for number of Quotes
int quotesLenght() {
  int quotesLenght1 = Quotes.length;
  return quotesLenght1;
}

///Use next random int go get random String of Quotes. ex - quotes(1); will return String of quotes
String quotes(int number) {
  List Q = Quotes;

  return Q[number];
}}

///List of ProfilesConstant
class ProfilesConstant{

  final String version = "1.0";
  final String revision = "26/7/22";
  final String status = "STABLE";
  final String creator = "r0thBaby";

  final String chillTopText = "Chill like Ice";
  final String smartTopText = "Do you like being smart?";
  final String fastTopText = "You know fast? FAAAASSTT!";


}

class ThermalManagerConstant {

  List<String> profile = ["Dynamic","Extreme","Game","In Call","Camera","Youtube","Restore","Default","Class 0","Game 2","AR / VR","Game 3",];
  List<int> value = [10,2,9,8,12,14,0,-1,11,13,15,16,];

}