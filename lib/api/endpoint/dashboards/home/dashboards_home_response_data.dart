class DashboardsHomeResponseData{
  final int profileCount;
  final String profileRank;
  final int thermalCount;
  final String thermalRank;
  final int dozeCount;
  final String dozeRank;

  DashboardsHomeResponseData(
      {
      required this.profileCount,
      required this.profileRank,
      required this.thermalCount,
      required this.thermalRank,
      required this.dozeCount,
      required this.dozeRank
      });

  factory DashboardsHomeResponseData.fromJson(Map<String, dynamic> json) => DashboardsHomeResponseData(
    profileCount: json['profileCount'] ?? 0,
    profileRank: json['profileRank'] ?? "nubie",
    thermalCount: json['thermalCount'] ?? 0,
    thermalRank: json['thermalRank'] ?? "nubie",
    dozeCount: json['dozeCount'] ?? 0,
    dozeRank: json['dozeRank'] ?? "nubie",


  );
}