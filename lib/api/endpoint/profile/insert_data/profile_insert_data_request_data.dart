
class ProfileInsertDataRequestData {
  final String nickname;
  final String age;
  final String gender;
  final String nation;
  final String image_url;

  ProfileInsertDataRequestData({
    required this.nickname,
    required this.age,
    required this.gender,
    required this.nation,
    required this.image_url
  });

  Map<String, dynamic> toJson() => <String, dynamic> {
    'nickname': this.nickname,
    'age': this.age,
    'gender': this.gender,
    'nation': this.nation,
    'image_url': this.image_url
  };
}