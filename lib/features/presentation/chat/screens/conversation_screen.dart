import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentasia/features/data/provider/model_theme.dart';
import 'package:mentasia/features/presentation/chat/screens/message_screen.dart';
import 'package:mentasia/features/presentation/drawer/widgets/drawer_widget.dart';
import 'package:provider/provider.dart';

import '../../../data/models/message_data.dart';

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
  IconData _iconLight = Icons.wb_sunny;
  IconData _iconDark = Icons.nights_stay;

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
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Consumer<ModelTheme>(
              builder: (context, value, child) {
                return IconButton(
                    onPressed: () {
                      value.isDark ? value.isDark = false : value.isDark = true;
                    },
                    icon: Icon(value.isDark ? _iconDark : _iconLight));
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: DrawerWidget(),
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

class ActionBar extends StatelessWidget {
  final VoidCallback onPressed;
  final TextEditingController messageController;

  const ActionBar(
      {super.key, required this.onPressed, required this.messageController});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  width: 2,
                  color: Colors.grey,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(
                CupertinoIcons.add_circled_solid,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: TextField(
                controller: messageController,
                decoration: InputDecoration(
                  hintText: "Type something...",
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.0, right: 24.0),
            // child: GlowingActionButton(
            //   color: Colors.greenAccent,
            //   icon: Icons.send_rounded,
            //   onPressed: onPressed,
            // ),
            child: GestureDetector(
              onTap: onPressed,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.send),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
