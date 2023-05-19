import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentasia/features/core/config/global_variables.dart';
import 'package:mentasia/widgets/cards/card.dart';
import 'package:mentasia/widgets/drawer/settings/members.dart';

class AboutUsScreen extends StatefulWidget {
  static String route = "aboutUsScreen";
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  final List _members = [
    [
      tSerg,
      "Sergio Angelo A. Casareo",
      "Product Manager",
    ],
    [
      tKane,
      "Kane Edward Y. Malapo",
      "UI/UX Designer",
    ],
    [
      tChoi,
      "Edilberto Jr. S. Pajunar",
      "Developer",
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // About Us
                  Center(
                    child: Text(
                      "About Us",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  // Text Description
                  CardWidget(
                    child: Column(
                      children: [
                        Image.asset(
                          tRechaerg,
                          width: 100,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "ReCHAERG is a group of developers formed through a project in their Enterprise Software System Course under Computer Engineering Program at the Polytechnic University of the Philippines. They are formed to create a website that will help people dealing with mental health.",
                        ),
                      ],
                    ),
                  ),

                  // Members
                  Center(
                    child: Text(
                      "Members",
                      style: GoogleFonts.barlow(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 1.45,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _members.length,
                      itemBuilder: (context, index) {
                        return MembersWidget(
                          imagePath: _members[index][0],
                          name: _members[index][1],
                          role: _members[index][2],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // SliverToBoxAdapter(
          //   child: SizedBox(
          //     height: MediaQuery.of(context).size.height,
          //     child: ListView.builder(
          //       itemCount: _members.length,
          //       itemBuilder: (context, index) {
          //         return MembersWidget(
          //           imagePath: _members[index][0],
          //           name: _members[index][1],
          //           role: _members[index][2],
          //         );
          //       },
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
