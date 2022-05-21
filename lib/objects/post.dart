import 'image.dart';
import 'comment.dart';
import 'location.dart';

class Post {
  final String title;
  final String caption;
  final String userName;
  final int postID;
  final Image? image;
  final Location? location;
  final int likeCount;
  List<Comment> comments;

  Post(this.title, this.caption, this.userName, this.postID, this.image,
      this.location, this.likeCount, this.comments);
}
