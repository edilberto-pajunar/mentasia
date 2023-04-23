import 'package:mentasia/views/chat-screen/conversation_screen.dart';
import 'package:mentasia/views/home.dart';
import 'package:mentasia/views/auth-screen/login_screen.dart';
import 'package:mentasia/views/auth-screen/signup_screen.dart';
import 'package:mentasia/views/settings/personal_account_screen.dart';
import 'package:mentasia/views/settings/terms_of_service_screen.dart';
import 'package:mentasia/views/settings/about_us_screen.dart';
import 'package:mentasia/views/settings/help_feedback_screen.dart';
import 'package:mentasia/views/settings/mentasia_works_screen.dart';
import 'package:mentasia/views/hello_screen.dart';
import 'package:mentasia/views/splash_screen.dart';

import '../views/auth-screen/wrapper.dart';

getRoutes() {
  return {
    SplashScreen.route: (context) => SplashScreen(),
    HelloScreen.route: (context) => HelloScreen(),
    Home.route: (context) => Home(),
    LoginScreen.route: (context) => LoginScreen(),
    SignupScreen.route: (context) => SignupScreen(),
    Wrapper.route: (context) => Wrapper(),
    PersonalAccountScreen.route: (context) => PersonalAccountScreen(),
    MentasiaWorksScreen.route: (context) => MentasiaWorksScreen(),
    AboutUsScreen.route: (context) => AboutUsScreen(),
    HelpFeedbackScreen.route: (context) => HelpFeedbackScreen(),
    TermsOfServiceScreen.route: (context) => TermsOfServiceScreen(),
    ConversationScreen.route: (context) => ConversationScreen(),
  };
}
