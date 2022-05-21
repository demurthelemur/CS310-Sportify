class Post {
  String text;
  String date;
  String photo;
  int likes;
  int comments;

  Post({
    required this.text,
    required this.date,
    required this.photo,
    required this.likes,
    required this.comments,
  });
}

class Profile {
  String username;
  String pp;
  int follower;
  int following;
  int postcount;
  List<Post> posts;

  Profile(
      {required this.username,
      required this.pp,
      required this.follower,
      required this.following,
      required this.postcount,
      required this.posts});
}

List<Post> posts = [
  Post(
      text: 'Hello bros!',
      date: 'March 31',
      photo: 'assets/egefitness1.jpeg',
      likes: 10,
      comments: 0),
  Post(
      text: '#challenge',
      date: 'March 30',
      photo: 'assets/egefitness2.jpeg',
      likes: 20,
      comments: 5),
];


List<Profile> profiles = [
  Profile(
    username: 'egefitness',
    pp: 'assets/egefitness1.jpeg',
    follower: 800,
    following: 31,
    postcount: 2,
    posts: posts),

   Profile(
    username: 'serrasadir',
    pp: 'assets/red.jpeg',
    follower: 350,
    following: 343,
    postcount: 2,
    posts: posts),

];

Profile egefitness = Profile(
    username: 'egefitness',
    pp: 'assets/egefitness1.jpeg',
    follower: 800,
    following: 31,
    postcount: 2,
    posts: posts);

Profile serrasadir = Profile(
    username: 'serrasadir',
    pp: 'assets/red.jpeg',
    follower: 350,
    following: 343,
    postcount: 2,
    posts: posts);
