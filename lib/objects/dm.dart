import 'image.dart';

class DirectMessage {
  final String senderName;
  final String receiverName;
  final int senderID;
  final int receiverID;
  final String message;
  final Image? image;

  DirectMessage(this.senderName, this.receiverName, this.receiverID,
      this.senderID, this.message, this.image);
}
