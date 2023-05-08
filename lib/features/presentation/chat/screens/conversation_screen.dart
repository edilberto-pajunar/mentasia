import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mentasia/features/core/config/global_variables.dart';
import 'package:mentasia/features/data/provider/model_theme.dart';
import 'package:mentasia/features/data/services/firestore.dart';
import 'package:mentasia/features/presentation/chat/widgets/date_label.dart';
import 'package:mentasia/features/presentation/drawer/widgets/drawer_widget.dart';
import 'package:provider/provider.dart';

class ConversationScreen extends StatefulWidget {
  static String route = "ConversationScreen";

  const ConversationScreen({
    super.key,
  });

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  bool isLoading = false;

  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final IconData _iconLight = Icons.wb_sunny;
  final IconData _iconDark = Icons.nights_stay;
  final DateTime time = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      _scrollController.jumpTo(
        _scrollController.position.maxScrollExtent,
      );
    });
  }

  List<Map<String, dynamic>> messages = [];

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
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
          StreamBuilder(
            stream: FirestoreService().readMessage(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  final data = snapshot.data!.docs;
                  return Flexible(
                    child: ListView.separated(
                      controller: _scrollController,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final isUser = data[index]["isUserMessage"];
                        final userMessage = data[index]["message"];
                        return Column(
                          children: [
                            // Text(
                            //   "${data[index]["message"]}",
                            // ),
                            Row(
                              mainAxisAlignment: isUser
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                              children: [
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: width * 2 / 3,
                                  ),
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(14),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(
                                        isUser ? 0 : 20,
                                      ),
                                      topLeft: Radius.circular(isUser ? 20 : 0),
                                    ),
                                    color: isUser
                                        ? tPrimaryColor
                                        : tBlackColor.withOpacity(0.3),
                                  ),
                                  child: Text(
                                    "$userMessage",
                                    style: TextStyle(
                                      color: tWhiteColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            DateLabel(
                              label: DateFormat.yMd().format(time),
                              alignment: isUser
                                  ? Alignment.bottomRight
                                  : Alignment.bottomLeft,
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(top: 5),
                        );
                      },
                      itemCount: data.length,
                    ),
                  );
                } else {
                  return Flexible(
                    child: Center(
                      child: Text("Hi! Let us have a chat my friend"),
                    ),
                  );
                }
              } else {
                return Flexible(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: tPrimaryColor,
                    ),
                  ),
                );
              }
            },
          ),
          ActionBar(
            onPressed: () {
              sendMessage(_controller.text);
              _controller.clear();
              FocusScope.of(context).unfocus();
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
          Message(
            text: DialogText(
              text: [text],
            ),
          ),
          true,
        );
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
        queryInput: QueryInput(
          text: TextInput(
            text: text,
            languageCode: "en",
          ),
        ),
      );
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    FirestoreService().sendMessage(
      message.text!.text![0],
      isUserMessage,
    );
    messages.add({
      'message': message.text?.text![0],
      'isUserMessage': isUserMessage,
    });
  }
}

class ActionBar extends StatelessWidget {
  final VoidCallback onPressed;
  final TextEditingController messageController;
  final _focusNode = FocusNode();

  ActionBar({
    super.key,
    required this.onPressed,
    required this.messageController,
  });

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
          Consumer<ModelTheme>(
            builder: (context, value, child) => Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: TextField(
                  focusNode: _focusNode,
                  controller: messageController,
                  decoration: InputDecoration(
                    hintText: "Type something...",
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    fontSize: 14,
                    color: value.isDark ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.0, right: 24.0),
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
