import 'package:flutter/material.dart';

import '../../../models/user.dart';

class PeerItem extends StatelessWidget {
  final Peer peer;
  final Function onTap;

  const PeerItem(
    this.peer, {
    this.onTap,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
            width: 1,
          ),
        ),
        child: InkWell(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  peer.photoUrl,
                  width: 52,
                  height: 52,
                ),
              ),
              Text(
                peer.nickname,
                style:
                    DefaultTextStyle.of(context).style.copyWith(fontSize: 18),
              ),
            ],
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
