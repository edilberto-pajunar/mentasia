import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentasia/features/data/provider/model_theme.dart';
import 'package:provider/provider.dart';

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
