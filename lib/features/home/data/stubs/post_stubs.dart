import '../../../../core/utils/stub.dart';
import '../../domain/entities/post_entity.dart';

final List<PostEntity> postStubs = [
  PostEntity(
    postId: '1',
    userId: '1',
    userImageUrl: StubUtils.getRandomAvatar(),
    username: 'John Doe',
    userTag: 'johndoe',
    body: 'This is a post body',
    imageUrl: 'https://i.pravatar.cc/150?img=2',
    likes: 10,
    comments: 5,
    shares: 2,
    minutesAgo: 10,
    isLiked: true,
    isSaved: false,
  ),
];
