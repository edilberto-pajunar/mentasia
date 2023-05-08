// To parse this JSON data, do
//
//     final messageData = messageDataFromJson(jsonString);

import 'dart:convert';

MessageData messageDataFromJson(String str) =>
    MessageData.fromJson(json.decode(str));

String messageDataToJson(MessageData data) => json.encode(data.toJson());

class MessageData {
  String message;
  bool isUserMessage;

  MessageData({
    required this.message,
    required this.isUserMessage,
  });

  factory MessageData.fromJson(Map<String, dynamic> json) => MessageData(
        message: json["message"],
        isUserMessage: json["isUserMessage"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "isUserMessage": isUserMessage,
      };
}
