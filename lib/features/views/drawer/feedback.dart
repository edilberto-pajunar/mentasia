import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mentasia/widgets/cards/submit.dart';
import 'package:mentasia/widgets/form/reusable.dart';

class HelpFeedbackScreen extends StatefulWidget {
  static String route = "helpFeedbackScreen";
  const HelpFeedbackScreen({super.key});

  @override
  State<HelpFeedbackScreen> createState() => _HelpFeedbackScreenState();
}

class _HelpFeedbackScreenState extends State<HelpFeedbackScreen> {
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();
  final _key = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isLoading
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Center(
                  child: SpinKitCircle(
                    color: Colors.white,
                    size: 50.0,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Submitted",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            )
          : SafeArea(
              child: LayoutBuilder(builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                      minWidth: constraints.maxWidth,
                    ),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Form(
                          key: _key,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // Help and Feedback
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
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
                              const SizedBox(height: 10),

                              ReusableForm(
                                labelText: "Input email here",
                                controller: _emailController,
                              ),

                              const SizedBox(height: 30),

                              const Text("Subject:"),
                              const SizedBox(height: 10),

                              // Email
                              ReusableForm(
                                labelText: "Subject",
                                controller: _subjectController,
                              ),

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
                                padding: const EdgeInsets.all(20),
                                child: SubmitCard(
                                  buttonText: "Submit",
                                  onTap: () {
                                    _key.currentState!.save();

                                    setState(() {
                                      isLoading = true;
                                    });
                                    Future.delayed(
                                      Duration(
                                        seconds: 2,
                                      ),
                                      () {
                                        setState(() {
                                          isLoading = false;
                                        });
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
    );
  }
}
