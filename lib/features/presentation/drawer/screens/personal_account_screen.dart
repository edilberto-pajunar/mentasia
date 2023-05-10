import 'package:flutter/material.dart';
import 'package:mentasia/features/data/services/firestore.dart';
import 'package:mentasia/widgets/reusable_form.dart';

import '../../../../widgets/submit_card.dart';
import '../../../core/config/global_variables.dart';

class PersonalAccountScreen extends StatefulWidget {
  static String route = "personalScreen";
  const PersonalAccountScreen({super.key});

  @override
  State<PersonalAccountScreen> createState() => _PersonalAccountScreenState();
}

class _PersonalAccountScreenState extends State<PersonalAccountScreen> {
  final TextEditingController _usernameController = TextEditingController();

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
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Personal & Account Information
                    Center(
                      child: Text(
                        "Personal & Account Information",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    // TextField
                    ReusableForm(
                      controller: _usernameController,
                      labelText: "Username:",
                    ),

                    Expanded(
                      child: SizedBox.shrink(),
                    ),
                    SubmitCard(
                      buttonText: "Save",
                      onTap: () {
                        FirestoreService().updateName(_usernameController.text);
                        Navigator.pop(context);
                      },
                      colorButton: tPrimaryColor,
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
