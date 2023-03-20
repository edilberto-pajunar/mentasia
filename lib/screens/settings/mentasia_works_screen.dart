import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MentasiaWorksScreen extends StatefulWidget {
  static String route = "mentasiaWorkScreen";
  const MentasiaWorksScreen({super.key});

  @override
  State<MentasiaWorksScreen> createState() => _MentasiaWorksScreenState();
}

class _MentasiaWorksScreenState extends State<MentasiaWorksScreen> {
  List<Step> getSteps() => [
        Step(
          title: Text("Account"),
          content: Container(),
        ),
        Step(
          title: Text("Address"),
          content: Container(),
        ),
        Step(
          title: Text("Complete"),
          content: Container(),
        ),
      ];

  int currentStep = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "How Mentasia Works",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Stepper(
            type: StepperType.vertical,
            steps: getSteps(),
            currentStep: currentStep,
          ),
        ],
      ),
    );
  }
}

class MentasiaCard extends StatelessWidget {
  final String image;
  final String labelText;

  const MentasiaCard({super.key, required this.image, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.all(5),
        color: Colors.grey[300],
        width: 250,
        height: 120,
        child: Column(
          children: [
            Image(
              image: AssetImage(image),
            ),
            Center(
              child: Text(
                labelText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
