import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentasia/widgets/cards/card.dart';

class TermsOfServiceScreen extends StatelessWidget {
  static String route = "termsOfServiceScreen";
  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 40.0),
                  child: Text(
                    "Terms of Service",
                    style: GoogleFonts.barlow(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              CardWidget(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Description of Service",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "The mentasia is a mobile application that provides information and resources on mental health. The App is designed to be used as a tool to support individuals who are seeking mental health resources and support.",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "User Conduct",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "You agree to use the mentasia only for lawful purposes and in a manner that does not infringe the rights of, or restrict or inhibit the use and enjoyment of the App by any third party. You shall not engage in any conduct that is offensive, defamatory or otherwise objectionable when using the App.",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Disclaimer of Warranties",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "The information provided by the mentasia is for general informational purposes only and is not intended as a substitute for professional medical advice, diagnosis or treatment. The App is not a substitute for seeking professional medical advice or treatment from a qualified healthcare provider.",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Limitation of Liability",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "The mentasia and its owners, employees, agents, affiliates, partners or licensors shall not be liable for any direct, indirect, incidental, special or consequential damages resulting from the use of the App or the inability to use the App, or for any errors or omissions in the content of the App.",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Intellectual Property",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "All intellectual property rights related to the mentasia, including but not limited to copyrights, trademarks, and patents, are owned by the owners of the App or their licensors. You agree not to use the App or any of its contents for any commercial purpose without the express written consent of the owners of the App.",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Termination",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "The owners of the mentasia may terminate your access to the App at any time and for any reason without notice..",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Governing Law",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "These Terms and Conditions shall be governed by and construed in accordance with the laws of the jurisdiction in which the owners of the mentasia are located.",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "By using the mentasia, you acknowledge that you have read and agree to be bound by these Terms and Conditions. If you do not agree to these Terms and Conditions, you may not use the App.",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
