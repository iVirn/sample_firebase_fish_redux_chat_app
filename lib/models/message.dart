import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Message {
  final String idFrom;
  final String idTo;
  final String timestamp;
  final String text;

  const Message({
    @required this.idFrom,
    @required this.idTo,
    @required this.timestamp,
    @required this.text,
  });

  factory Message.fromDocument(DocumentSnapshot document) => Message(
        idFrom: document['idFrom'],
        idTo: document['idTo'],
        timestamp: document['timestamp'],
        text: document['text'],
      );

  Map<String, String> toJson() => {
        'idFrom': idFrom,
        'idTo': idTo,
        'timestamp': timestamp,
        'text': text,
      };
}
