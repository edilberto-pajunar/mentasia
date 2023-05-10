import 'package:flutter/material.dart';
import 'package:mentasia/widgets/submit_card.dart';

import '../../../../widgets/reusable_form.dart';
import '../../../core/config/global_variables.dart';

class HelpFeedbackScreen extends StatefulWidget {
  static String route = "helpFeedbackScreen";
  const HelpFeedbackScreen({super.key});

  @override
  State<HelpFeedbackScreen> createState() => _HelpFeedbackScreenState();
}

class _HelpFeedbackScreenState extends State<HelpFeedbackScreen> {
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
              minWidth: constraints.maxWidth,
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // Help and Feedback
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 40.0),
                      child: Center(
                        child: Text(
                          "Help and Feedback",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    // Name
                    const Text("Email:"),
                    const SizedBox(
                      height: 10,
                    ),

                    ReusableForm(
                      labelText: "Input email here",
                      controller: _emailController,
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    // Email

                    const SizedBox(
                      height: 30,
                    ),

                    // Message
                    const Text("Message:"),
                    const SizedBox(
                      height: 10,
                    ),

                    ReusableForm(
                      labelText: "Input feedback here",
                      controller: _messageController,
                      maxLines: 10,
                    ),
                    Expanded(
                      child: SizedBox.shrink(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SubmitCard(
                        buttonText: "Submit",
                        onTap: () => Navigator.pop(context),
                        colorButton: tPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
