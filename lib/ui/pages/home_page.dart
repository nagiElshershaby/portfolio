import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/ui/pages/projects_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../providers/theme_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void handleKeyEvents(KeyEvent event, BuildContext context) {
    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
        // Move to the projects page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProjectsPage()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    // Define a breakpoint for mobile devices.
    final bool isMobile = screenWidth < 600;

    if (isMobile) {
      // Mobile Layout: A vertical scrollable layout
      return Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Section: Name and links
                  const SizedBox(height: 20),
                  header(context, 0, 0, isMobile),
                  const SizedBox(height: 20),
                  // About Me & Education Section
                  aboutMeEducationGraduationProjectAndLanguages(isMobile),

                  const SizedBox(height: 30),

                  // Experience & Skills Section
                  experienceAndSkills(0, MainAxisAlignment.start, CrossAxisAlignment.start, isMobile, screenHeight)
                ],
              ),
            ),
            // button to toggle the theme
            toggleThemeButton(themeProvider),
            navigationArrows(context, 16, const Color(0xff4F4F4F), 70,isMobile),
          ],
        ),
      );
    } else {
      // Desktop/Web Layout: The original horizontal layout
      final double leftPadding = 0.1041 * screenWidth;
      return Scaffold(
        body: KeyboardListener(
          onKeyEvent: (event) => handleKeyEvents(event, context),
          focusNode: FocusNode()..requestFocus(),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            // color: Colors.white,
            child: (screenWidth >= 1300)
                ? ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      // First horizontal page
                      SizedBox(
                        width: screenWidth / 2,
                        child: Stack(
                          children: [
                            // Black vertical line for design
                            verticalBlackLine(context, leftPadding),
                            ListView(
                              children: [
                                const SizedBox(height: 100),
                                // Header: Name and links
                                header(context, leftPadding,230, isMobile),
                                // About me, education, graduation project & languages
                                Container(
                                  width: 900,
                                  padding: EdgeInsets.only(
                                      left: leftPadding + 7, right: 20),
                                  child: aboutMeEducationGraduationProjectAndLanguages(isMobile),
                                ),
                                const SizedBox(height: 107),
                              ],
                            ),
                            // button to toggle the theme
                            toggleThemeButton(themeProvider),
                            // navigation arrows
                            navigationArrows(context, leftPadding, Theme.of(context).colorScheme.surface,0,isMobile),
                          ],
                        ),
                      ),
                      // Second horizontal page
                      SizedBox(
                        width: screenWidth / 2,
                        child: Container(
                          color: const Color(0x104F4F4F),
                          padding: const EdgeInsets.only(left: 20),
                          child: experienceAndSkills(leftPadding, MainAxisAlignment.end, CrossAxisAlignment.start, isMobile,screenHeight),
                        ),
                      ),
                    ],
                  )
                : SizedBox(
                    width: screenWidth,
                    child: Stack(
                      children: [
                        // Black vertical line for design
                        verticalBlackLine(context, leftPadding),
                        ListView(
                          children: [
                            const SizedBox(height: 100),
                            // Header: Name and links
                            header(context, leftPadding,230, isMobile),
                            // About me, education, graduation project & languages
                            Container(
                              width: 900,
                              padding: EdgeInsets.only(
                                  left: leftPadding + 7, right: 20),
                              child: aboutMeEducationGraduationProjectAndLanguages(isMobile),
                            ),
                            const SizedBox(height: 107),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: leftPadding + 7, right: 20),
                              child: experienceAndSkills(leftPadding, MainAxisAlignment.start, CrossAxisAlignment.start, isMobile, screenHeight)
                            ),
                          ],
                        ),
                        // button to toggle the theme
                        toggleThemeButton(themeProvider),
                        navigationArrows(context,leftPadding, const Color(0xff4F4F4F),30,isMobile),
                      ],
                    ),
                  ),
          ),
        ),
      );
    }
  }

  Widget aboutMeEducationGraduationProjectAndLanguages(isMobile){
    final double space = isMobile? 8: 10;
    final double headerFontSize = isMobile? 20: 26;
    final double titleFontSize = isMobile? 14: 16;
    final double subtitleFontSize = isMobile? 12: 14;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Passionate about creating meaningful digital experiences that simplify lives and solve real-world problems. As a Flutter developer, I focus on building efficient, user-friendly applications that blend functionality with intuitive design. Driven by a desire to continuously learn and innovate, I thrive in collaborative environments where I can contribute to impactful projects and grow alongside my team.",
          style: TextStyle(
            // color: Color(0xff4F4F4F),
            fontSize: titleFontSize,
            fontFamily: 'Raleway',
          ),
        ),
        const SizedBox(height: 20),
         Text(
          "Education",
          style: TextStyle(
            // color: Color(0xff4F4F4F),
            fontSize: headerFontSize,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: space),
         Text(
          "Bachelor of Computer Science | FCAI - Cairo University | Egypt",
          style: TextStyle(
            // color: Color(0xff4F4F4F),
            fontSize: titleFontSize,
            fontFamily: 'Raleway',
          ),
        ),
        const SizedBox(height: 4),
         Text(
          "2020 - 2024",
          style: TextStyle(
            // color: Color(0xff4F4F4F),
            fontSize: subtitleFontSize,
            fontFamily: 'Raleway',
          ),
        ),
        const SizedBox(height: 20),
         Text(
          "Graduation Project",
          style: TextStyle(
            // color: Color(0xff4F4F4F),
            fontSize: headerFontSize,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: space),
         Text(
          "• Built a Flask-based backend system for processing and visualizing complex environmental datasets (NetCDF).\n• Integrated Firebase for storage and database management.\n• Led the project team, managing tasks, communicating with supervisors, and ensuring timely delivery.",
          style: TextStyle(
            // color: Color(0xff4F4F4F),
            fontSize: titleFontSize,
            fontFamily: 'Raleway',
          ),
        ),
        const SizedBox(height: 20),
         Text(
          "Languages",
          style: TextStyle(
            // color: Color(0xff4F4F4F),
            fontSize: headerFontSize,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: space),
         Text(
          "Arabic, English",
          style: TextStyle(
            // color: Color(0xff4F4F4F),
            fontSize: titleFontSize,
            fontFamily: 'Raleway',
          ),
        ),
      ],
    );
  }
  Widget experienceAndSkills(leftPadding,mainAxisAlignment,crossAxisAlignment, isMobile,screenHeight){
    final double headerFontSize = isMobile? 20: 26;
    final double titleFontSize = isMobile? 14: 16;
    final double subtitleFontSize = isMobile? 12: 14;
    final children = [
      Text(
        "Experience",
        style: TextStyle(
          // color: Color(0xff4F4F4F),
          fontSize: headerFontSize,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w700,
        ),
      ),
      const SizedBox(height: 20),
      Text(
        "Flutter Developer | Tuwaiq",
        style: TextStyle(
          // color: Color(0xff4F4F4F),
          fontSize: titleFontSize,
          fontFamily: 'Raleway',
        ),
      ),
      const SizedBox(height: 4),
      Text(
        "March 2024 - Present",
        style: TextStyle(
          // color: Color(0xff4F4F4F),
          fontSize: subtitleFontSize,
          fontFamily: 'Raleway',
        ),
      ),
      const SizedBox(height: 20),
      Text(
        "Flutter instructor | Microsoft Student Partner",
        style: TextStyle(
          // color: Color(0xff4F4F4F),
          fontSize: titleFontSize,
          fontFamily: 'Raleway',
        ),
      ),
      const SizedBox(height: 4),
      Text(
        "April 2023 - July 2023",
        style: TextStyle(
          // color: Color(0xff4F4F4F),
          fontSize: subtitleFontSize,
          fontFamily: 'Raleway',
        ),
      ),
      const SizedBox(height: 20),
      Text(
        "Skills",
        style: TextStyle(
          // color: Color(0xff4F4F4F),
          fontSize: headerFontSize,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w700,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        "Flutter, Dart, Firebase, Git, GitHub, GitHub projects, Figma\nProvider, Bloc, Dio, Shared Preferences, Hive, REST API, JSON\nCaching, Unit test, localization \nClean architecture",
        style: TextStyle(
          // color: Color(0xff4F4F4F),
          fontSize: titleFontSize,
          fontFamily: 'Raleway',
        ),
      ),
      const SizedBox(height: 70),
    ];
    return isMobile? Column(
      crossAxisAlignment: crossAxisAlignment,
      children: children,
    ) :(screenHeight > 520)
        ? Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      children: children,
    ):ListView(
      children: children,
    );
  }
  Widget header(context, leftPadding,height,isMobile){
    return isMobile? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "HI! I am",
          style: TextStyle(
            // color: Color(0xff4F4F4F),
            fontSize: 24, // Reduced size for mobile
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w100,
          ),
        ),
        const Text(
          "Nagi El-Shershaby",
          style: TextStyle(
            // color: Color(0xff4F4F4F),
            fontSize: 32,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          children: [
            const Text(
              "Flutter Dev",
              style: TextStyle(
                // color: Color(0xff4F4F4F),
                fontSize: 24,
                fontFamily: 'Raleway',
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                launchUrl(Uri.parse(
                    "https://play.google.com/store/apps/developer?id=Prof.+Nagi"));
              },
              child: const FaIcon(FontAwesomeIcons.googlePlay),
            ),
            const SizedBox(width: 10),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.github),
              onPressed: () {
                launchUrl(Uri.parse(
                    "https://github.com/nagiElshershaby"));
              },
            ),
            const SizedBox(width: 10),
            IconButton(
              icon: const Icon(Icons.mail_outline,color: Colors.black,),
              onPressed: () {
                launchUrl(Uri.parse("mailto:nagielshershaby@gmail.com"));
              },
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                launchUrl(Uri.parse(
                    "https://eg.linkedin.com/in/nagi-el-shershaby-85660a231"));
              },
              child: const FaIcon(FontAwesomeIcons.linkedin),
              // Image.asset(
              //   'assets/images/icons/linkedin.png',
              //   width: 46,
              //   height: 46,
              //   cacheWidth: (220 * 0.7).toInt(),
              //   cacheHeight: (560 * 0.7).toInt(),
              // ),
            ),
          ],
        ),
      ],
    ): Container(
      color: Theme.of(context).colorScheme.surface,
      height: height,
      padding: EdgeInsets.only(left: leftPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          const Text(
            "HI! I am",
            style: TextStyle(
              // // color: Color(0xff4F4F4F),
              fontSize: 32,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w100,
            ),
          ),
          const Text(
            "Nagi El-Shershaby",
            style: TextStyle(
              // // color: Color(0xff4F4F4F),
              fontSize: 48,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            children: [
              const Text(
                "Flutter Dev",
                style: TextStyle(
                  // // color: Color(0xff4F4F4F),
                  fontSize: 32,
                  fontFamily: 'Raleway',
                ),
              ),
              const SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  launchUrl(Uri.parse(
                      "https://play.google.com/store/apps/developer?id=Prof.+Nagi"));
                },
                child: const FaIcon(FontAwesomeIcons.googlePlay),
                // Image.asset(
                //   'assets/images/icons/google-play.png',
                //   width: 28,
                //   height: 28,
                //   cacheWidth: (225 * 0.7).toInt(),
                //   cacheHeight: (225 * 0.7).toInt(),
                // ),
              ),
              const SizedBox(width: 10),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.github),
                onPressed: () {
                  launchUrl(Uri.parse(
                      "https://github.com/nagiElshershaby"));
                },
              ),

              const SizedBox(width: 10),
              IconButton(
                icon: const Icon(Icons.mail_outline,color: Colors.black,),
                onPressed: () {
                  launchUrl(Uri.parse("mailto:nagielshershaby@gmail.com"));
                },
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  launchUrl(Uri.parse(
                      "https://eg.linkedin.com/in/nagi-el-shershaby-85660a231"));
                },
                child: const FaIcon(FontAwesomeIcons.linkedin),
                // Image.asset(
                //   'assets/images/icons/linkedin.png',
                //   width: 46,
                //   height: 46,
                //   cacheWidth: (220 * 0.7).toInt(),
                //   cacheHeight: (560 * 0.7).toInt(),
                // ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget navigationArrows(context,leftPadding,color,bottomPosition, isMobile){
    return Positioned(
      bottom: bottomPosition,
      child: Container(
        color: color,
        height: isMobile?null:107,
        padding:isMobile?
        EdgeInsets.all( leftPadding):EdgeInsets.only(left: leftPadding, right: 20),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProjectsPage(),),
            );
          },
          child: Row(
            children: [
              Text(
                "Projects",
                style: TextStyle(
                  color: color == Theme.of(context).colorScheme.surface? Theme.of(context).textTheme.titleLarge?.color: const Color(0xffFFFFFF),
                  fontSize: isMobile?24:32,
                  fontFamily: 'Raleway',
                ),
              ),
              SizedBox(width:isMobile?10: 20),
              Image.asset(
                'assets/images/icons/Vector.png',
                color: color == Theme.of(context).colorScheme.surface? Theme.of(context).textTheme.titleLarge?.color: const Color(0xffFFFFFF),
                width: isMobile? 48:92,
                height: isMobile? 24:46,
                cacheWidth: (220 * 0.7).toInt(),
                cacheHeight: (560 * 0.7).toInt(),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget toggleThemeButton(themeProvider){
    return const SizedBox();
    //   Positioned(
    //   top: 20,
    //   right: 20,
    //   child: IconButton(
    //     icon: themeProvider.themeMode == ThemeMode.dark
    //         ? const Icon(Icons.light_mode)
    //         : const Icon(Icons.dark_mode),
    //     onPressed: themeProvider.toggleTheme,
    //   ),
    // );
  }
  Widget verticalBlackLine(context,leftPadding){
    return Positioned(
      left: leftPadding,
      child: Container(
        // for the color check if the theme is dark or light
        color:Theme.of(context).colorScheme.onSurface,
        width: 3,
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}
