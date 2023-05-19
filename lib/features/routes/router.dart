import 'package:mentasia/features/views/chat/conversation.dart';
import 'package:mentasia/features/views/drawer/about_us.dart';
import 'package:mentasia/features/views/drawer/articles.dart';
import 'package:mentasia/features/views/drawer/feedback.dart';
import 'package:mentasia/features/views/drawer/mentasia_work.dart';
import 'package:mentasia/features/views/drawer/personal_account.dart';
import 'package:mentasia/features/views/auth/login/login.dart';
import 'package:mentasia/features/views/auth/signup/signup.dart';
import 'package:mentasia/features/views/drawer/tos.dart';
import 'package:mentasia/features/views/splash/hello.dart';
import 'package:mentasia/features/views/splash/splash.dart';

import '../views/auth/wrapper.dart';

getRoutes() {
  return {
    SplashScreen.route: (context) => SplashScreen(),
    HelloScreen.route: (context) => HelloScreen(),
    LoginScreen.route: (context) => LoginScreen(),
    SignupScreen.route: (context) => SignupScreen(),
    Wrapper.route: (context) => Wrapper(),
    PersonalAccountScreen.route: (context) => PersonalAccountScreen(),
    MentasiaWorksScreen.route: (context) => MentasiaWorksScreen(),
    AboutUsScreen.route: (context) => AboutUsScreen(),
    HelpFeedbackScreen.route: (context) => HelpFeedbackScreen(),
    TermsOfServiceScreen.route: (context) => TermsOfServiceScreen(),
    ConversationScreen.route: (context) => ConversationScreen(),
    Articles.route: (context) => Articles(),
  };
}
