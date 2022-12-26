class ZramSettingModel {
  int size;
  int power;
  int cachePower;
  String algorithm;
  int minfree;
  int dirtyRatio;
  int backgroundRatio;

  ZramSettingModel(
      {
      required this.size,
      required this.power,
      required this.cachePower,
      required this.algorithm,
      required this.minfree,
      required this.dirtyRatio,
      required this.backgroundRatio
      });
}