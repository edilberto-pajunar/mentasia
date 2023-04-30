import 'package:flutter/material.dart';
import 'package:mentasia/features/core/config/global_variables.dart';

class HelpFeedbackScreen extends StatefulWidget {
  static String route = "helpFeedbackScreen";
  const HelpFeedbackScreen({super.key});

  @override
  State<HelpFeedbackScreen> createState() => _HelpFeedbackScreenState();
}

class _HelpFeedbackScreenState extends State<HelpFeedbackScreen> {
  final _textController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // Help and Feedback
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 40.0),
                child: Center(
                  child: Text(
                    "Help and Feedback",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // Name
              const Text("Name:"),
              const SizedBox(
                height: 10,
              ),

              TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Input name here",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              // Email
              const Text("Email:"),
              const SizedBox(
                height: 10,
              ),

              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Input email here",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.green),
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              // Message
              const Text("Message:"),
              const SizedBox(
                height: 10,
              ),

              Form(
                child: TextField(
                  controller: _messageController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Input message or feedback here",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
