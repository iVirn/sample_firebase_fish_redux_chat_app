import 'package:cloud_firestore/cloud_firestore.dart';

class Peer {
  final String nickname;
  final String photoUrl;
  final String id;

  const Peer(this.nickname, this.photoUrl, this.id);

  factory Peer.fromDocument(DocumentSnapshot document) => Peer(
        document['nickname'],
        document['photoUrl'],
        document['id'],
      );
}
