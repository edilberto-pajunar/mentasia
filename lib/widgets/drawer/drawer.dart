import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentasia/features/core/config/global_variables.dart';
import 'package:mentasia/features/data/provider/profile.dart';
import 'package:mentasia/features/data/services/article.dart';
import 'package:mentasia/features/data/services/auth.dart';
import 'package:mentasia/features/data/services/firestore.dart';
import 'package:mentasia/features/views/drawer/about_us.dart';
import 'package:mentasia/features/views/drawer/articles.dart';
import 'package:mentasia/features/views/drawer/feedback.dart';
import 'package:mentasia/features/views/drawer/mentasia_work.dart';
import 'package:mentasia/features/views/drawer/personal_account.dart';
import 'package:mentasia/features/views/drawer/tos.dart';
import 'package:mentasia/features/views/splash/hello.dart';
import 'package:mentasia/widgets/buttons/settings.dart';
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
  bool isLoading = false;

  void logout(context) async {
    await AuthServices().logout();

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
    final ProfileServices profileServices = Provider.of<ProfileServices>(context);

    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              StreamBuilder(
                stream: FirestoreService().getProfile(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListTile(
                      leading: GestureDetector(
                        onTap: () => profileServices.pickImage(),
                        child: profileServices.image != null
                            ? Image.file(profileServices.image!)
                            : CircleAvatar(
                                radius: 40,
                              ),
                      ),
                      title: Text(
                        "${snapshot.data!["name"]}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text("Profile"),
                    );
                  }
                  return Text("Error loading data!");
                },
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
                      // ignore: use_build_context_synchronously
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
