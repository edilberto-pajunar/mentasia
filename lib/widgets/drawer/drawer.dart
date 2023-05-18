import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentasia/features/core/config/global_variables.dart';
import 'package:mentasia/features/data/provider/model_theme.dart';
import 'package:mentasia/features/data/provider/profile.dart';
import 'package:mentasia/features/data/services/article.dart';
import 'package:mentasia/features/data/services/auth.dart';
import 'package:mentasia/features/presentation/drawer/screens/about_us.dart';
import 'package:mentasia/features/presentation/drawer/screens/articles.dart';
import 'package:mentasia/features/presentation/drawer/screens/feedback.dart';
import 'package:mentasia/features/presentation/drawer/screens/mentasia_work.dart';
import 'package:mentasia/features/presentation/drawer/screens/personal_account.dart';
import 'package:mentasia/features/presentation/drawer/screens/tos.dart';
import 'package:mentasia/features/presentation/splash/screens/hello.dart';
import 'package:mentasia/widgets/cards/submit.dart';
import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final bool isGuest = FirebaseAuth.instance.currentUser!.isAnonymous;
  final String? accountGuest = FirebaseAuth.instance.currentUser!.uid;
  final String? accountName = FirebaseAuth.instance.currentUser!.email;
  File? image;

  void logout(context) async {
    await Auth().logout();

    Navigator.pushNamed(context, HelloScreen.route);
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File("${directory.path}/$name");

    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<Profile>(context);
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: GestureDetector(
                  onTap: () => profile.pickImage(),
                  child: profile.image != null
                      ? Image.file(profile.image!)
                      : CircleAvatar(
                          radius: 40,
                        ),
                ),
                title: Text(
                  isGuest ? "Guest$accountGuest".substring(0, 11) : accountName.toString(),
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
                onTap: () => Navigator.pushNamed(context, PersonalAccountScreen.route),
              ),
              SettingsButton(
                textLabel: "How Mentasia Works",
                imageString: tLogo,
                onTap: () => Navigator.pushNamed(context, MentasiaWorksScreen.route),
              ),
              SettingsButton(
                textLabel: "About Us",
                imageString: tAboutUs,
                onTap: () => Navigator.pushNamed(context, AboutUsScreen.route),
              ),
              SettingsButton(
                textLabel: "Help and Feedback",
                imageString: tHelp,
                onTap: () => Navigator.pushNamed(context, HelpFeedbackScreen.route),
              ),
              SettingsButton(
                textLabel: "Terms of Service",
                imageString: tTermsandService,
                onTap: () => Navigator.pushNamed(context, TermsOfServiceScreen.route),
              ),
              Consumer<ArticleServices>(
                builder: (context, value, child) => SettingsButton(
                  textLabel: "Articles",
                  imageString: tTermsandService,
                  onTap: () async {
                    if (value.isFetched) {
                      Navigator.pushNamed(context, Articles.route);
                    } else {
                      await value.fetchArticleApi();
                      if (context.mounted) return;
                      Navigator.pushNamed(context, Articles.route);
                    }
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Image.asset(tDOH),
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
  final String imageString;
  final VoidCallback onTap;

  const SettingsButton({
    super.key,
    required this.textLabel,
    required this.imageString,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<ModelTheme>(context).isDark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: darkTheme ? Colors.grey : tSecondaryColor,
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
                color: darkTheme ? Colors.white : Colors.black,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
