import 'package:gdsc_social/features/home/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  final String id;
  final String posterId;
  final String posterImageUrl;
  final String posterName;
  final String posterTag;
  final String postBody;
  final String? postImageUrl;
  final List<String> likedBy;
  final List<String> commentedBy;
  final List<String> sharedBy;
  final List<String> savedBy;
  final DateTime createdAt;

  PostModel({
    required this.id,
    required this.posterId,
    required this.posterImageUrl,
    required this.posterName,
    required this.posterTag,
    required this.postBody,
    this.postImageUrl,
    required this.likedBy,
    required this.commentedBy,
    required this.sharedBy,
    required this.savedBy,
    required this.createdAt,
  }) : super(
          postId: id,
          userId: posterId,
          userImageUrl: posterImageUrl,
          username: posterName,
          userTag: posterTag,
          body: postBody,
          imageUrl: postImageUrl,
          likes: likedBy.length,
          comments: commentedBy.length,
          shares: sharedBy.length,
          minutesAgo: DateTime.now().difference(createdAt).inMinutes,
          isLiked: likedBy.contains(posterId),
          isSaved: savedBy.contains(posterId),
        );

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      posterId: json['posterId'],
      posterImageUrl: json['posterImageUrl'],
      posterName: json['posterName'],
      posterTag: json['posterTag'],
      postBody: json['postBody'],
      postImageUrl: json['postImageUrl'],
      likedBy: List<String>.from(json['likedBy']),
      commentedBy: List<String>.from(json['commentedBy']),
      sharedBy: List<String>.from(json['sharedBy']),
      savedBy: List<String>.from(json['savedBy']),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
