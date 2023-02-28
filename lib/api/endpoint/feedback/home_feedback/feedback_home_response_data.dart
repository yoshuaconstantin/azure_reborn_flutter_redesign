class feedbackHomeResponseData{
  final String id;
  final String nickname;
  final String comment;
  final String timestamp;
  final String own_feedback;
  final String is_edited;

  feedbackHomeResponseData(
      {
        required this.id,
        required this.nickname,
        required this.comment,
        required this.timestamp,
        required this.own_feedback,
        required this.is_edited
      });

  factory feedbackHomeResponseData.fromJson(Map<String, dynamic> json) => feedbackHomeResponseData(
      id: json['id'],
      nickname: json['nickname'] ?? "",
      comment: json['comment'] ?? "",
      timestamp: json['timestamp'] ?? "",
      own_feedback: json['own_feedback'] ?? "",
      is_edited: json['is_edited'] ?? ""


  );
}