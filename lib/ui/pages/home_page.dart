import 'package:flutter/material.dart';
import 'package:protofolio/ui/pages/projects_page.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            SizedBox(
              width: 960,
              child: Stack(
                children: [
                  /// the black line
                  Positioned(
                    left: 200,
                    child: Container(
                      color: const Color(0xff4F4F4F),
                      width: 3,
                      height: MediaQuery.of(context).size.height,
                    ),
                  ),
                  ListView(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 100,
                      ),

                      /// the name and links
                      Container(
                        color: const Color(0xffFFFFFF),
                        // width: 370,
                        height: 230,
                        padding: const EdgeInsets.only(left: 200),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
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
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  "Flutter Dev",
                                  style: TextStyle(
                                    color: Color(0xff4F4F4F),
                                    fontSize: 32,
                                    fontFamily: 'Raleway',
                                  ),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                IconButton(
                                  icon: const Icon(
                                      Icons.play_arrow_outlined),
                                  onPressed: () {
                                    launchUrl(Uri.parse(
                                        "https://play.google.com/store/apps/developer?id=Prof.+Nagi"));
                                  },
                                ),
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

                      /// the About me & Education & Graduation Project & Languages
                      Container(
                        // color: const Color(0xffFFFFFF),
                        width: 900,
                        padding:
                            const EdgeInsets.only(left: 207, right: 20),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Passionate about creating meaningful digital experiences that simplify lives and solve real-world problems. As a Flutter developer, I focus on building efficient, user-friendly applications that blend functionality with intuitive design. Driven by a desire to continuously learn and innovate, I thrive in collaborative environments where I can contribute to impactful projects and grow alongside my team.",
                              style: TextStyle(
                                color: Color(0xff4F4F4F),
                                fontSize: 16,
                                fontFamily: 'Raleway',
                                // fontWeight: FontWeight.w100,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Education",
                              style: TextStyle(
                                color: Color(0xff4F4F4F),
                                fontSize: 26,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Bachelor of Computer Science | FCAI - Cairo University | Egypt",
                              style: TextStyle(
                                color: Color(0xff4F4F4F),
                                fontSize: 16,
                                fontFamily: 'Raleway',
                                // fontWeight: FontWeight.w100,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "2020 - 2024",
                              style: TextStyle(
                                color: Color(0xff4F4F4F),
                                fontSize: 14,
                                fontFamily: 'Raleway',
                                // fontWeight: FontWeight.w100,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Graduation Project",
                              style: TextStyle(
                                color: Color(0xff4F4F4F),
                                fontSize: 26,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              """• Built a Flask-based backend system for processing 
            and visualizing complex environmental datasets (NetCDF).
        • Integrated Firebase for storage and database management.
        • Led the project team, managing tasks, communicating with supervisors, 
            and ensuring timely delivery.""",
                              style: TextStyle(
                                color: Color(0xff4F4F4F),
                                fontSize: 16,
                                fontFamily: 'Raleway',
                                // fontWeight: FontWeight.w100,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Languages",
                              style: TextStyle(
                                color: Color(0xff4F4F4F),
                                fontSize: 26,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Arabic, English",
                              style: TextStyle(
                                color: Color(0xff4F4F4F),
                                fontSize: 16,
                                fontFamily: 'Raleway',
                                // fontWeight: FontWeight.w100,
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// the navigation arrows
                      Container(
                        color: const Color(0xffFFFFFF),
                        // width: 250,
                        height: 107,
                        padding: const EdgeInsets.only(left: 200),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ProjectsPage(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                "Projects",
                                style: TextStyle(
                                  color: Color(0xff4F4F4F),
                                  fontSize: 32,
                                  fontFamily: 'Raleway',
                                  // fontWeight: FontWeight.w100,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Image.asset(
                                'assets/images/icons/Vector.png',
                                width: 92,
                                height: 46,
                                cacheWidth: (220 * 0.7)
                                    .toInt(), // Adjust this for optimal size
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
            SizedBox(
              width: 960,
              child: Container(
                color: const Color(0x104F4F4F),
                padding: const EdgeInsets.only(left: 20),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 450,
                    ),

                    /// the Experience & Skills
                    const Text(
                      "Experience",
                      style: TextStyle(
                        color: Color(0xff4F4F4F),
                        fontSize: 26,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Flutter Developer | Tuwaiq",
                      style: TextStyle(
                        color: Color(0xff4F4F4F),
                        fontSize: 16,
                        fontFamily: 'Raleway',
                        // fontWeight: FontWeight.w100,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text(
                      "September 2024 - Present",
                      style: TextStyle(
                        color: Color(0xff4F4F4F),
                        fontSize: 14,
                        fontFamily: 'Raleway',
                        // fontWeight: FontWeight.w100,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Flutter instructor | Microsoft Student Partner",
                      style: TextStyle(
                        color: Color(0xff4F4F4F),
                        fontSize: 16,
                        fontFamily: 'Raleway',
                        // fontWeight: FontWeight.w100,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text(
                      "April 2023 - July 2023",
                      style: TextStyle(
                        color: Color(0xff4F4F4F),
                        fontSize: 14,
                        fontFamily: 'Raleway',
                        // fontWeight: FontWeight.w100,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Skills",
                      style: TextStyle(
                        color: Color(0xff4F4F4F),
                        fontSize: 26,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      """Flutter, Dart, Firebase, Git, GitHub, GitHub projects, Figma
                Provider, Bloc, Dio, Shared Preferences, Hive, REST API, JSON
                Caching, Unit test, localization 
                Clean architecture""",
                      style: TextStyle(
                        color: Color(0xff4F4F4F),
                        fontSize: 16,
                        fontFamily: 'Raleway',
                        // fontWeight: FontWeight.w100,
                      ),
                    ),
                    const SizedBox(height: 70),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.mail_outline),
                          onPressed: () {
                            launchUrl(Uri.parse(
                                "mailto:nagielshershaby@gmail.com"));
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
                            cacheWidth: (220 * 0.7)
                                .toInt(), // Adjust this for optimal size
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
