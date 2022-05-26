import 'package:flutter/material.dart';
import 'post.dart';

class HomePostCard extends StatelessWidget {
  final Post post;
  final VoidCallback increament;
  HomePostCard({Key? key, required this.post, required this.increament})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(
                post.username,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ]),
            Text(
              post.text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              width: 50,
              height: 200,
              margin: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(post.photo),
                    fit: BoxFit.fill,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 181, 180, 193),
                      blurRadius: 6.0,
                    )
                  ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(post.date,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    )),
                const Spacer(),
                TextButton.icon(
                  onPressed: increament,
                  icon: const Icon(
                    Icons.thumb_up,
                    size: 14.0,
                    color: Colors.green,
                  ),
                  label: Text(post.likes.toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      )),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.comment,
                  size: 14.0,
                  color: Colors.blue,
                ),
                Text(post.comments.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    )),
                const SizedBox(width: 8),
              ],
            )
          ],
        ),
      ),
    );
  }
}
