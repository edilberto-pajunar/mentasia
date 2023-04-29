import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsOfServiceScreen extends StatelessWidget {
  static String route = "termsOfServiceScreen";
  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.grey[300],
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  height: 500,
                  child: Text(
                    " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus laoreet justo ut nisl convallis rhoncus. Nunc condimentum, nulla nec maximus dignissim, odio ipsum volutpat enim, vitae luctus purus augue vitae metus. Curabitur viverra tortor condimentum, accumsan tellus a, condimentum dolor. Nullam lacinia quis nisi sit amet venenatis. Vestibulum tincidunt egestas urna quis gravida. Nullam quis diam ligula. In ac orci dui. Nulla sit amet aliquam elit. Vivamus sagittis quam eget libero tristique, non dignissim mi imperdiet. Cras lobortis est dolor, non iaculis eros finibus a. Vestibulum mattis fermentum ultrices.",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
