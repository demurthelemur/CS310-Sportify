import 'package:sportify/objects/image.dart';

import 'image.dart';

class Notification {
  final String title;
  final String message;
  final Image image;
  final int notificationID;

  Notification(this.image, this.title, this.message, this.notificationID);
}
