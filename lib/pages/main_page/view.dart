import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'ui/peer_item.dart';

import 'state.dart';

Widget buildView(
  MainState state,
  Dispatch dispatch,
  ViewService viewService,
) =>
    Scaffold(
      appBar: AppBar(
        title: Text('Peers'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            // TODO сделать разлогин
            onPressed: () {},
          )
        ],
      ),
      body: ListView.builder(
        itemCount: state.peers.length,
        itemBuilder: (context, index) => PeerItem(
          state.peers[index],
          onTap: () {},
        ),
      ),
    );
