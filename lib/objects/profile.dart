import 'post.dart';
import 'image.dart';

class Profile {
  final String name;
  final Image profilePicture;
  final int age;
  final int postCount;
  final int followers;
  final int following;
  List<Post> posts;
  final String username;
  final int id;

  Profile(this.name, this.age, this.postCount, this.followers, this.following,
      this.posts, this.username, this.id, this.profilePicture);
}
