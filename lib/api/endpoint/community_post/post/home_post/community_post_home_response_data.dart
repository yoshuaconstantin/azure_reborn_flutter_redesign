import 'community_post_home_response_data_comment.dart';

class CommunityPostHomeResponseData {
  final int id;
  final bool own_post;
  final String nickname;
  final String post_message;
  final String nation;
  final String image_url;
  final String created_date;
  final bool is_edited;
  final bool is_liked;
  final int like_count;
  final int comment_count;
  final List<CommunityPostHomeResponseDataComment> comment;

  CommunityPostHomeResponseData(
      {
        required this.id,
        required this.own_post,
        required this.nickname,
        required this.post_message,
        required this.nation,
        required this.image_url,
        required this.created_date,
        required this.is_edited,
        required this.is_liked,
        required this.like_count,
        required this.comment_count,
        required this.comment
      });

  factory CommunityPostHomeResponseData.fromJson(Map<String, dynamic> json) {
    List<CommunityPostHomeResponseDataComment> Comments = [];

    if (json['comments'] != null) {
      json['comments'].forEach((v) {
        Comments.add(CommunityPostHomeResponseDataComment.fromJson(v));
      });
    }

    return CommunityPostHomeResponseData(
      id: json['id'],
      own_post: json['own_post'] ?? false,
      nickname: json['nickname'],
      post_message: json['post_message'],
      nation: json['nation'],
      image_url: json['image_url'],
      created_date: json['created_date'],
      is_edited: json['is_edited'],
      is_liked: json['is_liked'] ?? false,
      like_count: json['like_count'],
      comment_count: json['comment_count'],
      comment: Comments,
    );
  }
}