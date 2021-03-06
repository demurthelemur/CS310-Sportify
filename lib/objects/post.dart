import 'package:cs310/objects/Location.dart';

class Post {
  final String username;
  final String text;
  final String date;
  final String photo;
  int likes;
  int comments;
  final int id;
  final Location ?location;

  Post({
    this.location,
    required this.username,
    required this.id,
    required this.text,
    required this.date,
    required this.photo,
    required this.likes,
    required this.comments,
  });
}

class Profile {
  int id;
  String username;
  String pp;
  int follower;
  int following;
  int postcount;
  List<Post> posts;

  Profile(
      {required this.id,
      required this.username,
      required this.pp,
      required this.follower,
      required this.following,
      required this.postcount,
      required this.posts});
}

List<Post> posts = [
  Post(
      username: 'egefitness',
      id: 1,
      text: 'Hello bros!',
      date: 'March 31',
      photo: 'assets/egefitness1.jpeg',
      likes: 10,
      comments: 0),
  Post(
      username: 'egefitness',
      id: 2,
      text: '#challenge',
      date: 'March 30',
      photo: 'assets/egefitness2.jpeg',
      likes: 20,
      comments: 5),
];
List<Post> posts2 = [
  Post(
      username: 'serrasadir',
      id: 3,
      text: 'Hi!',
      date: 'Feb 11',
      photo: 'assets/red.jpeg',
      likes: 8,
      comments: 0),
];

List<Post> totalposts = [
    Post(
      username: 'serrasadir',
      id: 3,
      text: 'Hi!',
      date: 'Feb 11',
      photo: 'assets/red.jpeg',
      likes: 8,
      comments: 0),
  Post(
      username: 'egefitness',
      id: 1,
      text: 'Hello bros!',
      date: 'March 31',
      photo: 'assets/egefitness1.jpeg',
      likes: 10,
      comments: 0),
  Post(
      username: 'egefitness',
      id: 2,
      text: '#challenge',
      date: 'March 30',
      photo: 'assets/egefitness2.jpeg',
      likes: 20,
      comments: 5),

];

List<Profile> profiles = [
  Profile(
      id: 12,
      username: 'egefitness',
      pp: 'assets/egefitness1.jpeg',
      follower: 800,
      following: 31,
      postcount: 2,
      posts: posts),
  Profile(
      id: 13,
      username: 'serrasadir',
      pp: 'assets/red.jpeg',
      follower: 350,
      following: 343,
      postcount: 2,
      posts: posts),
];

Profile egefitness = Profile(
    id: 12,
    username: 'egefitness',
    pp: 'assets/egefitness1.jpeg',
    follower: 800,
    following: 31,
    postcount: 2,
    posts: posts);

Profile serrasadir = Profile(
    id: 13,
    username: 'serrasadir',
    pp: 'assets/red.jpeg',
    follower: 350,
    following: 343,
    postcount: 2,
    posts: posts2);
