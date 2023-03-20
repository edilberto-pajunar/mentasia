import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentasia/screens/chat-screen/message_screen.dart';
import 'package:mentasia/utils/avatar.dart';

import '../../models/message_data.dart';
import '../../utils/action_bottom.dart';

class ConversationScreen extends StatefulWidget {
  static String route = "ConversationScreen";
  var messageData;

  ConversationScreen({
    super.key,
    this.messageData,
  });

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);

    super.initState();
  }

  List<Map<String, dynamic>> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        title: _AppBarTitle(
          messageData: widget.messageData,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Icon(
              CupertinoIcons.info,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: MessagesScreen(
              scrollController: _scrollController,
              messages: messages,
            ),
          ),
          ActionBar(
            onPressed: () {
              sendMessage(_controller.text);
              _controller.clear();
              _scrollController.animateTo(
                  _scrollController.position.maxScrollExtent,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeOut);
            },
            messageController: _controller,
          ),
        ],
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print("Message is Empty");
    } else {
      setState(() {
        addMessage(
          Message(text: DialogText(text: [text])),
          true,
        );
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(
        text: TextInput(text: text),
      ));
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({
      'message': message.text?.text![0],
      'isUserMessage': isUserMessage,
    });
  }
}

class _AppBarTitle extends StatelessWidget {
  final MessageData messageData;
  const _AppBarTitle({
    super.key,
    required this.messageData,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Avatar.small(url: messageData.profilePicture),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                messageData.senderName,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "Online now",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
