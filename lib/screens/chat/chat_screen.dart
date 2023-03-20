import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mentasia/api/helpers.dart';
import 'package:mentasia/screens/chat-screen/conversation_screen.dart';
import 'package:mentasia/utils/avatar.dart';

import '../../models/message_data.dart';
import '../../models/story_data.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            // child: _Stories(),
            ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final Faker faker = Faker();
              final date = Helpers.randomDate();
              return _MessageTitle(
                messageData: MessageData(
                  senderName: faker.person.name(),
                  message: faker.lorem.sentence(),
                  messageDate: date,
                  dateMessage: Jiffy(date).fromNow(),
                  profilePicture: Helpers.randomPictureUrl(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _MessageTitle extends StatelessWidget {
  final MessageData messageData;
  const _MessageTitle({super.key, required this.messageData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ConversationScreen.route);
      },
      child: Container(
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.2,
          ),
        )),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Avatar.medium(
                  url: messageData.profilePicture,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        messageData.senderName,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          letterSpacing: 0.2,
                          wordSpacing: 1.5,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      child: Text(
                        messageData.message,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      messageData.dateMessage.toUpperCase(),
                      style: TextStyle(
                        fontSize: 11,
                        letterSpacing: -0.2,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          "1",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[200],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class _Stories extends StatelessWidget {
//   const _Stories({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 0,
//       color: Colors.blueGrey.shade200,
//       child: SizedBox(
//         height: 134,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding:
//                   const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 16.0),
//               child: Text(
//                 "Stories",
//                 style: TextStyle(
//                   fontWeight: FontWeight.w900,
//                   fontSize: 15,
//                   color: Colors.grey[600],
//                 ),
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (context, index) {
//                   final faker = Faker();
//                   return SizedBox(
//                     width: 60,
//                     child: StoryCard(
//                       storyData: StoryData(
//                         name: faker.person.name(),
//                         url: Helpers.randomPictureUrl(),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class StoryCard extends StatelessWidget {
//   final StoryData storyData;
//   const StoryCard({super.key, required this.storyData});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Avatar.medium(url: storyData.url),
//         Expanded(
//           child: Padding(
//             padding: EdgeInsets.only(top: 16.0),
//             child: Text(
//               storyData.name,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(
//                 fontSize: 11,
//                 letterSpacing: 0.3,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
