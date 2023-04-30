import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentasia/features/core/config/global_variables.dart';
import 'package:mentasia/widgets/card_widget.dart';

class MentasiaWorksScreen extends StatefulWidget {
  static String route = "mentasiaWorkScreen";
  const MentasiaWorksScreen({super.key});

  @override
  State<MentasiaWorksScreen> createState() => _MentasiaWorksScreenState();
}

class _MentasiaWorksScreenState extends State<MentasiaWorksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(
              height: 50,
            ),
            MentasiaCard(
              title: "Sign in using Google or email or anonymously",
              subtitle: "To optimized your personal experience",
              image: tGmail,
            ),
            MentasiaCard(
              title: "Chat with our chatbot",
              subtitle: "The bot will provide your needs",
              image: tChat,
            ),
            MentasiaCard(
              title: "Compassionate Interlocutor",
              subtitle: "Contact to professionals",
              image: tMind,
            ),
          ],
        ),
      ),
    );
  }
}

class MentasiaCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  const MentasiaCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
        leading: Image.asset(
          image,
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: Color(0xFFA59F9F),
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}
