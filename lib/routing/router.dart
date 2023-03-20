import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:mentasia/models/message_data.dart';
import 'package:mentasia/screens/chat-screen/conversation_screen.dart';
import 'package:mentasia/screens/home.dart';
import 'package:mentasia/screens/auth_screen/login_screen.dart';
import 'package:mentasia/screens/auth_screen/signup_screen.dart';
import 'package:mentasia/screens/settings/personal_account_screen.dart';
import 'package:mentasia/screens/settings/terms_of_service_screen.dart';
import 'package:mentasia/screens/chat/settings_screen.dart';
import 'package:mentasia/screens/settings/about_us_screen.dart';
import 'package:mentasia/screens/settings/help_feedback_screen.dart';
import 'package:mentasia/screens/settings/mentasia_works_screen.dart';
import 'package:mentasia/screens/hello_screen.dart';
import 'package:mentasia/screens/splash_screen.dart';

import '../screens/auth_screen/wrapper.dart';

getRoutes() {
  return {
    SplashScreen.route: (context) => SplashScreen(),
    HelloScreen.route: (context) => HelloScreen(),
    Home.route: (context) => Home(),
    LoginScreen.route: (context) => LoginScreen(),
    SignupScreen.route: (context) => SignupScreen(),
    Wrapper.route: (context) => Wrapper(),
    SettingsScreen.route: (context) => SettingsScreen(),
    PersonalAccountScreen.route: (context) => PersonalAccountScreen(),
    MentasiaWorksScreen.route: (context) => MentasiaWorksScreen(),
    AboutUsScreen.route: (context) => AboutUsScreen(),
    HelpFeedbackScreen.route: (context) => HelpFeedbackScreen(),
    TermsOfServiceScreen.route: (context) => TermsOfServiceScreen(),
    ConversationScreen.route: (context) => ConversationScreen(),
  };
}
