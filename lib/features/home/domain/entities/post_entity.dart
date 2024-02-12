class PostEntity {
  final String postId;
  final String userId;
  final String userImageUrl;
  final String username;
  final String userTag;
  final String body;
  final String? imageUrl;
  final int likes;
  final int comments;
  final int shares;
  final int minutesAgo;
  late final String timeAgo;
  final bool isLiked;
  late final bool isSaved;

  PostEntity({
    required this.postId,
    required this.userId,
    required this.userImageUrl,
    required this.username,
    required this.userTag,
    required this.body,
    this.imageUrl,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.minutesAgo,
    required this.isLiked,
    this.isSaved = false,
  }) {
    timeAgo = _calculateTimeAgo();
  }

  String _calculateTimeAgo() {
    if (minutesAgo < 60) {
      return '${minutesAgo}m';
    } else if (minutesAgo < 60 * 24) {
      return '${minutesAgo ~/ 60}h';
    } else {
      return '${minutesAgo ~/ (60 * 24)}d';
    }
  }
}
