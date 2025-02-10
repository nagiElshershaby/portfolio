import 'package:flutter/material.dart';
import 'package:protofolio/ui/pages/projects_page.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Define a breakpoint for mobile devices.
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    if (isMobile) {
      // Mobile Layout: A vertical scrollable layout
      return Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section: Name and links
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "HI! I am",
                    style: TextStyle(
                      color: Color(0xff4F4F4F),
                      fontSize: 24, // Reduced size for mobile
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  const Text(
                    "Nagi El-Shershaby",
                    style: TextStyle(
                      color: Color(0xff4F4F4F),
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
                          color: Color(0xff4F4F4F),
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
                        child: Image.asset(
                          'assets/images/icons/google-play.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        icon: const Icon(
                          Icons.code,
                          size: 24,
                          color: Color(0xff4F4F4F),
                        ),
                        onPressed: () {
                          launchUrl(
                              Uri.parse("https://github.com/nagiElshershaby"));
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // About Me & Education Section
              const Text(
                "Passionate about creating meaningful digital experiences that simplify lives and solve real-world problems. As a Flutter developer, I focus on building efficient, user-friendly applications that blend functionality with intuitive design. Driven by a desire to continuously learn and innovate, I thrive in collaborative environments where I can contribute to impactful projects and grow alongside my team.",
                style: TextStyle(
                  color: Color(0xff4F4F4F),
                  fontSize: 14,
                  fontFamily: 'Raleway',
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Education",
                style: TextStyle(
                  color: Color(0xff4F4F4F),
                  fontSize: 20,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Bachelor of Computer Science | FCAI - Cairo University | Egypt",
                style: TextStyle(
                  color: Color(0xff4F4F4F),
                  fontSize: 14,
                  fontFamily: 'Raleway',
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "2020 - 2024",
                style: TextStyle(
                  color: Color(0xff4F4F4F),
                  fontSize: 12,
                  fontFamily: 'Raleway',
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Graduation Project",
                style: TextStyle(
                  color: Color(0xff4F4F4F),
                  fontSize: 20,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "• Built a Flask-based backend system for processing and visualizing complex environmental datasets (NetCDF).\n• Integrated Firebase for storage and database management.\n• Led the project team, managing tasks, communicating with supervisors, and ensuring timely delivery.",
                style: TextStyle(
                  color: Color(0xff4F4F4F),
                  fontSize: 14,
                  fontFamily: 'Raleway',
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Languages",
                style: TextStyle(
                  color: Color(0xff4F4F4F),
                  fontSize: 20,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Arabic, English",
                style: TextStyle(
                  color: Color(0xff4F4F4F),
                  fontSize: 14,
                  fontFamily: 'Raleway',
                ),
              ),
              const SizedBox(height: 30),
              // Navigation Section to Projects Page
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProjectsPage()),
                  );
                },
                child: Row(
                  children: [
                    const Text(
                      "Projects",
                      style: TextStyle(
                        color: Color(0xff4F4F4F),
                        fontSize: 24,
                        fontFamily: 'Raleway',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Image.asset(
                      'assets/images/icons/Vector.png',
                      width: 48,
                      height: 24,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Experience & Skills Section
              const Text(
                "Experience",
                style: TextStyle(
                  color: Color(0xff4F4F4F),
                  fontSize: 20,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Flutter Developer | Tuwaiq",
                style: TextStyle(
                  color: Color(0xff4F4F4F),
                  fontSize: 14,
                  fontFamily: 'Raleway',
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "September 2024 - Present",
                style: TextStyle(
                  color: Color(0xff4F4F4F),
                  fontSize: 12,
                  fontFamily: 'Raleway',
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Flutter instructor | Microsoft Student Partner",
                style: TextStyle(
                  color: Color(0xff4F4F4F),
                  fontSize: 14,
                  fontFamily: 'Raleway',
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "April 2023 - July 2023",
                style: TextStyle(
                  color: Color(0xff4F4F4F),
                  fontSize: 12,
                  fontFamily: 'Raleway',
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Skills",
                style: TextStyle(
                  color: Color(0xff4F4F4F),
                  fontSize: 20,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Flutter, Dart, Firebase, Git, GitHub, GitHub projects, Figma\nProvider, Bloc, Dio, Shared Preferences, Hive, REST API, JSON\nCaching, Unit test, localization \nClean architecture",
                style: TextStyle(
                  color: Color(0xff4F4F4F),
                  fontSize: 14,
                  fontFamily: 'Raleway',
                ),
              ),
              const SizedBox(height: 30),
              // Contact Icons Row
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.mail_outline,
                      size: 24,
                      color: Color(0xff4F4F4F),
                    ),
                    onPressed: () {
                      launchUrl(Uri.parse("mailto:nagielshershaby@gmail.com"));
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      launchUrl(Uri.parse(
                          "https://eg.linkedin.com/in/nagi-el-shershaby-85660a231"));
                    },
                    child: Image.asset(
                      'assets/images/icons/linkedin.png',
                      width: 36,
                      height: 36,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      );
    } else {
      // Desktop/Web Layout: The original horizontal layout
      final double leftPadding = 0.1041 * MediaQuery.of(context).size.width;
      return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              // First horizontal page
              SizedBox(
                width: 960,
                child: Stack(
                  children: [
                    // Black vertical line for design
                    Positioned(
                      left: leftPadding,
                      child: Container(
                        color: const Color(0xff4F4F4F),
                        width: 3,
                        height: MediaQuery.of(context).size.height,
                      ),
                    ),
                    ListView(
                      children: [
                        const SizedBox(height: 100),
                        // Header: Name and links
                        Container(
                          color: const Color(0xffFFFFFF),
                          height: 230,
                          padding: EdgeInsets.only(left: leftPadding),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "HI! I am",
                                style: TextStyle(
                                  color: Color(0xff4F4F4F),
                                  fontSize: 32,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                              const Text(
                                "Nagi El-Shershaby",
                                style: TextStyle(
                                  color: Color(0xff4F4F4F),
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
                                      color: Color(0xff4F4F4F),
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
                                    child: Image.asset(
                                      'assets/images/icons/google-play.png',
                                      width: 28,
                                      height: 28,
                                      cacheWidth: (225 * 0.7).toInt(),
                                      cacheHeight: (225 * 0.7).toInt(),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  IconButton(
                                    icon: const Icon(Icons.code),
                                    onPressed: () {
                                      launchUrl(Uri.parse(
                                          "https://github.com/nagiElshershaby"));
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // About me, education, graduation project & languages
                        Container(
                          width: 900,
                          padding: EdgeInsets.only(left: leftPadding+7, right: 20),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Passionate about creating meaningful digital experiences that simplify lives and solve real-world problems. As a Flutter developer, I focus on building efficient, user-friendly applications that blend functionality with intuitive design. Driven by a desire to continuously learn and innovate, I thrive in collaborative environments where I can contribute to impactful projects and grow alongside my team.",
                                style: TextStyle(
                                  color: Color(0xff4F4F4F),
                                  fontSize: 16,
                                  fontFamily: 'Raleway',
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Education",
                                style: TextStyle(
                                  color: Color(0xff4F4F4F),
                                  fontSize: 26,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Bachelor of Computer Science | FCAI - Cairo University | Egypt",
                                style: TextStyle(
                                  color: Color(0xff4F4F4F),
                                  fontSize: 16,
                                  fontFamily: 'Raleway',
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "2020 - 2024",
                                style: TextStyle(
                                  color: Color(0xff4F4F4F),
                                  fontSize: 14,
                                  fontFamily: 'Raleway',
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Graduation Project",
                                style: TextStyle(
                                  color: Color(0xff4F4F4F),
                                  fontSize: 26,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "• Built a Flask-based backend system for processing and visualizing complex environmental datasets (NetCDF).\n• Integrated Firebase for storage and database management.\n• Led the project team, managing tasks, communicating with supervisors, and ensuring timely delivery.",
                                style: TextStyle(
                                  color: Color(0xff4F4F4F),
                                  fontSize: 16,
                                  fontFamily: 'Raleway',
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Languages",
                                style: TextStyle(
                                  color: Color(0xff4F4F4F),
                                  fontSize: 26,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Arabic, English",
                                style: TextStyle(
                                  color: Color(0xff4F4F4F),
                                  fontSize: 16,
                                  fontFamily: 'Raleway',
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Navigation arrow to Projects page
                        Container(
                          color: const Color(0xffFFFFFF),
                          height: 107,
                          padding: EdgeInsets.only(left: leftPadding),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ProjectsPage()),
                              );
                            },
                            child: Row(
                              children: [
                                const Text(
                                  "Projects",
                                  style: TextStyle(
                                    color: Color(0xff4F4F4F),
                                    fontSize: 32,
                                    fontFamily: 'Raleway',
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Image.asset(
                                  'assets/images/icons/Vector.png',
                                  width: 92,
                                  height: 46,
                                  cacheWidth: (220 * 0.7).toInt(),
                                  cacheHeight: (560 * 0.7).toInt(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Second horizontal page
              SizedBox(
                width: 960,
                child: Container(
                  color: const Color(0x104F4F4F),
                  padding: const EdgeInsets.only(left: 20),
                  child: ListView(
                    children: [
                      const SizedBox(height: 450),
                      const Text(
                        "Experience",
                        style: TextStyle(
                          color: Color(0xff4F4F4F),
                          fontSize: 26,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Flutter Developer | Tuwaiq",
                        style: TextStyle(
                          color: Color(0xff4F4F4F),
                          fontSize: 16,
                          fontFamily: 'Raleway',
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "September 2024 - Present",
                        style: TextStyle(
                          color: Color(0xff4F4F4F),
                          fontSize: 14,
                          fontFamily: 'Raleway',
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Flutter instructor | Microsoft Student Partner",
                        style: TextStyle(
                          color: Color(0xff4F4F4F),
                          fontSize: 16,
                          fontFamily: 'Raleway',
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "April 2023 - July 2023",
                        style: TextStyle(
                          color: Color(0xff4F4F4F),
                          fontSize: 14,
                          fontFamily: 'Raleway',
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Skills",
                        style: TextStyle(
                          color: Color(0xff4F4F4F),
                          fontSize: 26,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Flutter, Dart, Firebase, Git, GitHub, GitHub projects, Figma\nProvider, Bloc, Dio, Shared Preferences, Hive, REST API, JSON\nCaching, Unit test, localization \nClean architecture",
                        style: TextStyle(
                          color: Color(0xff4F4F4F),
                          fontSize: 16,
                          fontFamily: 'Raleway',
                        ),
                      ),
                      const SizedBox(height: 70),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.mail_outline),
                            onPressed: () {
                              launchUrl(Uri.parse("mailto:nagielshershaby@gmail.com"));
                            },
                          ),
                          GestureDetector(
                            onTap: () {
                              launchUrl(Uri.parse(
                                  "https://eg.linkedin.com/in/nagi-el-shershaby-85660a231"));
                            },
                            child: Image.asset(
                              'assets/images/icons/linkedin.png',
                              width: 46,
                              height: 46,
                              cacheWidth: (220 * 0.7).toInt(),
                              cacheHeight: (560 * 0.7).toInt(),
                            ),
                          ),
                          const SizedBox(width: 200)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}

