import 'package:flutter/material.dart';
import 'package:mentasia/controllers/auth.dart';
import 'package:mentasia/screens/hello_screen.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  void logout() async {
    await Auth().logout();
    Navigator.pushNamed(context, HelloScreen.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: logout,
          child: Text("Logout"),
        ),
      ),
    );
  }
}
