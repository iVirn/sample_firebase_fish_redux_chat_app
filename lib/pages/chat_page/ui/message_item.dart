import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  final String text;
  final int maxLines;
  final String sender;
  final String messageDate;
  final bool isIncome;

  MessageItem(
    this.text, {
    this.isIncome = true,
    this.messageDate,
    this.sender,
    this.maxLines = 1,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isIncome ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: <Widget>[
        _meta(
          messageDate: messageDate,
          sender: sender,
        ),
        Container(
          padding: const EdgeInsets.only(
            left: 6,
            right: 6,
          ),
          child: _bubble(
            context: context,
            isIncome: isIncome,
            text: text,
            maxLines: maxLines,
          ),
        ),
      ],
    );
  }
}

Widget _meta({
  String messageDate,
  String sender,
}) =>
    messageDate != null || sender != null
        ? Padding(
            padding: const EdgeInsets.only(
              left: 6,
              right: 6,
              top: 16,
              bottom: 8,
            ),
            child: Text(
              sender != null && messageDate != null
                  ? '$messageDate · $sender'
                  : '${messageDate ?? ''}${sender ?? ''}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14, color: Colors.black38),
            ),
          )
        : Container();

Widget _bubble({
  BuildContext context,
  bool isIncome,
  String text,
  int maxLines,
}) {
  final defaultTextStyle = DefaultTextStyle.of(context);
  return Row(
    mainAxisAlignment:
        isIncome ? MainAxisAlignment.start : MainAxisAlignment.end,
    children: <Widget>[
      Flexible(
        child: Container(
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: isIncome ? Colors.black26 : Colors.blue,
          ),
          child: Text(
            text,
            style: TextStyle(fontSize: 14, color: Colors.black38),
            maxLines: maxLines,
            overflow: maxLines != null
                ? TextOverflow.ellipsis
                : defaultTextStyle.overflow,
          ),
        ),
      ),
    ],
  );
}
