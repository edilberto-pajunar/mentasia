import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'glowing_action_button.dart';

class ActionBar extends StatelessWidget {
  final VoidCallback onPressed;
  final TextEditingController messageController;

  const ActionBar({super.key, required this.onPressed, required this.messageController});

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
                CupertinoIcons.camera_fill,
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
            child: GlowingActionButton(
              color: Colors.greenAccent,
              icon: Icons.send_rounded,
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
