import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'ui/message_item.dart';

import 'state.dart';

Widget buildView(
  ChatState state,
  Dispatch dispatch,
  ViewService viewService,
) {
  return Scaffold(
    appBar: AppBar(
      title: Text('ss'),
    ),
    body: SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(viewService.context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                reverse: true,
                padding: const EdgeInsets.only(bottom: 24),
                children: []
                    .map(
                      (message) => Container(
                        margin: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                        ),
                        child: MessageItem(
                          '',
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Container(
              height: 60,
              width: MediaQuery.of(viewService.context).size.width,
              child: ChatTextField(),
            ),
          ],
        ),
      ),
    ),
  );
}

class ChatTextField extends StatefulWidget {
  /// Called whenever text field value changes. Passes text field value as an argument
  final Function(String) onSendMessage;

  const ChatTextField({
    this.onSendMessage,
    Key key,
  }) : super(key: key);

  @override
  _ChatTextFieldState createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  TextEditingController _textEditingController;
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextField(
                style: TextStyle(color: Colors.black, fontSize: 15.0),
                controller: _textEditingController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Type your message...',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                focusNode: _focusNode,
              ),
            ),
          ),

          // Button send message
          Material(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () =>
                    widget.onSendMessage(_textEditingController.text),
                color: Colors.blue,
              ),
            ),
            color: Colors.white,
          ),
        ],
      ),
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
          color: Colors.white),
    );
  }
}
