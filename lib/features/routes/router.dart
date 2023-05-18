import 'package:mentasia/features/presentation/chat/screens/conversation_screen.dart';
import 'package:mentasia/features/presentation/drawer/screens/articles.dart';
import 'package:mentasia/features/presentation/auth/login/screens/login.dart';
import 'package:mentasia/features/presentation/auth/signup/screens/signup.dart';
import 'package:mentasia/features/presentation/drawer/screens/personal_account.dart';
import 'package:mentasia/features/presentation/drawer/screens/tos.dart';
import 'package:mentasia/features/presentation/drawer/screens/about_us.dart';
import 'package:mentasia/features/presentation/drawer/screens/feedback.dart';
import 'package:mentasia/features/presentation/drawer/screens/mentasia_work.dart';
import 'package:mentasia/features/presentation/splash/screens/hello.dart';
import 'package:mentasia/features/presentation/splash/screens/splash.dart';

import '../presentation/auth/wrapper.dart';

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
