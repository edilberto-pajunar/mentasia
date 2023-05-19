import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:mentasia/features/core/config/global_variables.dart';
import 'package:mentasia/features/data/provider/model_theme.dart';
import 'package:mentasia/features/data/services/firestore.dart';
import 'package:mentasia/widgets/buttons/action.dart';
import 'package:mentasia/widgets/chat/date_label.dart';
import 'package:mentasia/widgets/drawer/drawer.dart';
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
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
  }

  void goBottom() {
    SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) {
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
                      shrinkWrap: true,
                      controller: _scrollController,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        final isUser = data[index]["isUserMessage"];
                        final userMessage = data[index]["message"];
                        return Column(
                          children: [
                            // Text(
                            //   "${data[index]["message"]}",
                            // ),
                            Row(
                              mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
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
                                    color: isUser ? tPrimaryColor : tBlackColor.withOpacity(0.3),
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
                              alignment: isUser ? Alignment.bottomRight : Alignment.bottomLeft,
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
              goBottom();
            },
            messageController: _controller,
          ),
        ],
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      if (kDebugMode) {
        print("Message is Empty");
      }
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
