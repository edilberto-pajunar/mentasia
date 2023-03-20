import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentasia/constants/global_variables.dart';
import 'package:mentasia/controllers/auth.dart';
import 'package:mentasia/screens/settings/personal_account_screen.dart';
import 'package:mentasia/screens/settings/terms_of_service_screen.dart';
import 'package:mentasia/screens/settings/about_us_screen.dart';
import 'package:mentasia/screens/settings/help_feedback_screen.dart';
import 'package:mentasia/screens/settings/mentasia_works_screen.dart';
import 'package:mentasia/utils/submit_card.dart';

import '../hello_screen.dart';

class SettingsScreen extends StatefulWidget {
  static String route = "settingsScreen";
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final bool isGuest = FirebaseAuth.instance.currentUser!.isAnonymous;
  final String? accountGuest = FirebaseAuth.instance.currentUser!.uid;
  final String? accountName = FirebaseAuth.instance.currentUser!.email;

  void logout(context) async {
    await Auth().logout();

    Navigator.pushNamed(context, HelloScreen.route);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Account Name
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 3,
                        color: tDarkColor,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image(
                      color: tDarkColor,
                      image: AssetImage(
                        tProfileIcon,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "Account Name: ",
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      isGuest
                          ? "Guest${accountGuest}".substring(0, 11)
                          : "${accountName}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // Account Settings
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
              child: Text(
                "Account Settings",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            SettingsButton(
              textLabel: "Personal & Account Information",
              imageString: tPersonalInfo,
              onTap: () =>
                  Navigator.pushNamed(context, PersonalAccountScreen.route),
            ),

            // Support
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
              child: Text(
                "Support",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
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

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
              child: Text(
                "Legal",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
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
              colorButton: tPrimaryColor,
              colorText: Colors.white,
            ),
          ],
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
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                textLabel,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
