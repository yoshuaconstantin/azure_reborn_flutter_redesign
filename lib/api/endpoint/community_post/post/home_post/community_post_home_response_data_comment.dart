class CommunityPostHomeResponseDataComment{
  final int id;
  final int post_id;
  final String nickname;
  final String comment_body;
  final String time_comment;
  final String is_edited;
  final String own_comment;

  CommunityPostHomeResponseDataComment(
      {
        required this.id,
        required this.post_id,
        required this.nickname,
        required this.comment_body,
        required this.time_comment,
        required this.is_edited,
        required this.own_comment
      });

  factory CommunityPostHomeResponseDataComment.fromJson(Map<String, dynamic> json) => CommunityPostHomeResponseDataComment(
    id: json['id'],
    post_id: json['post_id'] ,
    nickname: json['nickname'] ,
    comment_body: json['comment_body'] ,
    time_comment: json['time_comment'] ,
    is_edited: json['is_edited'] ,
    own_comment: json['own_comment'] ,
  );
}