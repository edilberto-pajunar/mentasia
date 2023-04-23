import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentasia/views/settings/help_feedback_screen.dart';
import 'package:mentasia/widgets/submit_card.dart';

import '../constants/global_variables.dart';
import '../controllers/auth.dart';
import '../views/hello_screen.dart';
import '../views/settings/about_us_screen.dart';
import '../views/settings/mentasia_works_screen.dart';
import '../views/settings/personal_account_screen.dart';
import '../views/settings/terms_of_service_screen.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final bool isGuest = FirebaseAuth.instance.currentUser!.isAnonymous;
  final String? accountGuest = FirebaseAuth.instance.currentUser!.uid;
  final String? accountName = FirebaseAuth.instance.currentUser!.email;
  void logout(context) async {
    await Auth().logout();

    Navigator.pushNamed(context, HelloScreen.route);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 40,
                ),
                title: Text(
                  isGuest
                      ? "Guest${accountGuest}".substring(0, 11)
                      : "${accountName}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text("Profile"),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Divider(
                  thickness: 1.5,
                ),
              ),
              SettingsButton(
                textLabel: "Personal & Account Information",
                imageString: tPersonalInfo,
                onTap: () =>
                    Navigator.pushNamed(context, PersonalAccountScreen.route),
              ),
              SettingsButton(
                textLabel: "How Mentasia Works",
                imageString: tLogo,
                onTap: () =>
                    Navigator.pushNamed(context, MentasiaWorksScreen.route),
              ),
              SettingsButton(
                textLabel: "About Us",
                imageString: tAboutUs,
                onTap: () => Navigator.pushNamed(context, AboutUsScreen.route),
              ),
              SettingsButton(
                textLabel: "Help and Feedback",
                imageString: tHelp,
                onTap: () =>
                    Navigator.pushNamed(context, HelpFeedbackScreen.route),
              ),
              SettingsButton(
                textLabel: "Terms of Service",
                imageString: tTermsandService,
                onTap: () =>
                    Navigator.pushNamed(context, TermsOfServiceScreen.route),
              ),
              SizedBox(
                height: 10,
              ),
              SubmitCard(
                buttonText: "Logout",
                onTap: () => logout(context),
                colorButton: Colors.red.shade900,
                colorText: Colors.white,
                paddingWidth: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsButton extends StatelessWidget {
  final String textLabel;
  final imageString;
  final VoidCallback onTap;

  SettingsButton({
    super.key,
    required this.textLabel,
    this.imageString,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: tWhiteColor,
            boxShadow: const [
              BoxShadow(
                color: tBlackColor,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Image(
                  image: AssetImage(imageString),
                  width: 20,
                ),
              ),
              Text(
                textLabel,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
