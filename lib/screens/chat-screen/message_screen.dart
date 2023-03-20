import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mentasia/constants/global_variables.dart';

class MessagesScreen extends StatefulWidget {
  final List messages;
  final ScrollController scrollController;

  const MessagesScreen({
    super.key,
    required this.messages,
    required this.scrollController,
  });

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.now();
    double width = MediaQuery.of(context).size.width;

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      controller: widget.scrollController,
      itemBuilder: (context, index) {
        return Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: widget.messages[index]['isUserMessage']
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    padding:
                        EdgeInsets.symmetric(vertical: 14, horizontal: 14.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(
                            widget.messages[index]['isUserMessage'] ? 0 : 20),
                        topLeft: Radius.circular(
                            widget.messages[index]['isUserMessage'] ? 20 : 0),
                      ),
                      color: widget.messages[index]['isUserMessage']
                          ? tPrimaryColor
                          : tBlackColor.withOpacity(0.3),
                    ),
                    constraints: BoxConstraints(maxWidth: width * 2 / 3),
                    child: Text(
                      widget.messages[index]['message'],
                      style: TextStyle(
                        color: widget.messages[index]['isUserMessage']
                            ? tWhiteColor
                            : tWhiteColor,
                      ),
                    ),
                  ),
                ],
              ),
              _DateLabel(
                label: DateFormat.yMd().format(time),
                alignment: widget.messages[index]['isUserMessage']
                    ? Alignment.bottomRight
                    : Alignment.bottomLeft,
              ),
            ],
          ),
        );
      },
      itemCount: widget.messages.length,
      separatorBuilder: ((context, index) {
        return Padding(
          padding: EdgeInsets.only(top: 5),
        );
      }),
    );
  }
}

class _DateLabel extends StatelessWidget {
  final String label;
  final Alignment alignment;

  const _DateLabel({super.key, required this.label, required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
