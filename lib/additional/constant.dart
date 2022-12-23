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


  final String thermalZoneGPU ="cat /sys/class/thermal/thermal_zone32/temp | awk '{print \$1/1000}'";

}


enum SharedPreferenceKey {
  ProcessorKey,
  ModeActived,
  TimeElapsed,
  FeatureModeRank,
  FeatureThermalRank,
  FeatureDozeRank
}