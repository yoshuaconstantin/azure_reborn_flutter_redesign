class ProfileHomeResponseData{
  final String nickname;
  final String age;
  final String gender;
  final String nation;
  final String image_url;

  ProfileHomeResponseData(
      {
        required this.nickname,
        required this.age,
        required this.gender,
        required this.nation,
        required this.image_url
      });

  factory ProfileHomeResponseData.fromJson(Map<String, dynamic> json) => ProfileHomeResponseData(
    nickname: json['nickname'] ?? "",
    age: json['age'] ?? "",
    gender: json['gender'] ?? "",
    nation: json['nation'] ?? "",
    image_url: json['image_url'] ?? ""


  );
}