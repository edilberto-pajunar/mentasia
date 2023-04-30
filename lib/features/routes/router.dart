import 'package:mentasia/features/presentation/chat/screens/conversation_screen.dart';
import 'package:mentasia/features/presentation/login/screens/login_screen.dart';
import 'package:mentasia/features/presentation/signup/screens/signup_screen.dart';
import 'package:mentasia/features/presentation/drawer/screens/personal_account_screen.dart';
import 'package:mentasia/features/presentation/drawer/screens/terms_of_service_screen.dart';
import 'package:mentasia/features/presentation/drawer/screens/about_us_screen.dart';
import 'package:mentasia/features/presentation/drawer/screens/help_feedback_screen.dart';
import 'package:mentasia/features/presentation/drawer/screens/mentasia_works_screen.dart';
import 'package:mentasia/features/presentation/splash/screens/hello_screen.dart';
import 'package:mentasia/features/presentation/splash/screens/splash_screen.dart';

import '../presentation/splash/screens/wrapper.dart';

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
  };
}
