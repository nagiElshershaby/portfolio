import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        child: Stack(
          children: [
            /// the black line
            Positioned(
              left: 200.w,
              child: Container(
                color: const Color(0xff4F4F4F),
                width: 3.w,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            /// the social media icons
            Positioned(
              right: 200.w,
              bottom: 70.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.mail_outline),
                    onPressed: () {
                      launchUrl(
                          Uri.parse("mailto:nagielshershaby@gmail.com"));
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      launchUrl(Uri.parse(
                          "https://eg.linkedin.com/in/nagi-el-shershaby-85660a231"));
                    },
                    child: Image.asset(
                      'assets/images/icons/linkedin.png',
                      width: 46.w,
                      height: 46.h,
                      cacheWidth: (220.w * 0.7)
                          .toInt(), // Adjust this for optimal size
                      cacheHeight: (560.h * 0.7).toInt(),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: ListView(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 100.h,
                        ),
                        /// the name and links
                        Container(
                          color: const Color(0xffFFFFFF),
                          // width: 370.w,
                          height: 230.w,
                          padding: EdgeInsets.only(left: 200.w),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "HI! I am",
                                style: TextStyle(
                                  color: const Color(0xff4F4F4F),
                                  fontSize: 32.sp,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                              Text(
                                "Nagi El-Shershaby",
                                style: TextStyle(
                                  color: const Color(0xff4F4F4F),
                                  fontSize: 48.sp,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Flutter Dev",
                                    style: TextStyle(
                                      color: const Color(0xff4F4F4F),
                                      fontSize: 32.sp,
                                      fontFamily: 'Raleway',
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.play_arrow_outlined),
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
                          width: 900.w,
                          padding: EdgeInsets.only(left: 207.w, right: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Passionate about creating meaningful digital experiences that simplify lives and solve real-world problems. As a Flutter developer, I focus on building efficient, user-friendly applications that blend functionality with intuitive design. Driven by a desire to continuously learn and innovate, I thrive in collaborative environments where I can contribute to impactful projects and grow alongside my team.",
                                style: TextStyle(
                                  color: const Color(0xff4F4F4F),
                                  fontSize: 16.sp,
                                  fontFamily: 'Raleway',
                                  // fontWeight: FontWeight.w100,
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                "Education",
                                style: TextStyle(
                                  color: const Color(0xff4F4F4F),
                                  fontSize: 26.sp,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Bachelor of Computer Science | FCAI - Cairo University | Egypt",
                                style: TextStyle(
                                  color: const Color(0xff4F4F4F),
                                  fontSize: 16.sp,
                                  fontFamily: 'Raleway',
                                  // fontWeight: FontWeight.w100,
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                "2020 - 2024",
                                style: TextStyle(
                                  color: const Color(0xff4F4F4F),
                                  fontSize: 14.sp,
                                  fontFamily: 'Raleway',
                                  // fontWeight: FontWeight.w100,
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                "Graduation Project",
                                style: TextStyle(
                                  color: const Color(0xff4F4F4F),
                                  fontSize: 26.sp,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                """• Built a Flask-based backend system for processing 
    and visualizing complex environmental datasets (NetCDF).
• Integrated Firebase for storage and database management.
• Led the project team, managing tasks, communicating with supervisors, 
    and ensuring timely delivery.""",
                                style: TextStyle(
                                  color: const Color(0xff4F4F4F),
                                  fontSize: 16.sp,
                                  fontFamily: 'Raleway',
                                  // fontWeight: FontWeight.w100,
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                "Languages",
                                style: TextStyle(
                                  color: const Color(0xff4F4F4F),
                                  fontSize: 26.sp,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Arabic, English",
                                style: TextStyle(
                                  color: const Color(0xff4F4F4F),
                                  fontSize: 16.sp,
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
                          // width: 250.w,
                          height: 107.h,
                          padding: EdgeInsets.only(left: 200.w),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ProjectsPage(),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Projects",
                                  style: TextStyle(
                                    color: const Color(0xff4F4F4F),
                                    fontSize: 32.sp,
                                    fontFamily: 'Raleway',
                                    // fontWeight: FontWeight.w100,
                                  ),
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                Image.asset(
                                  'assets/images/icons/Vector.png',
                                  width: 92.w,
                                  height: 46.h,
                                  cacheWidth: (220.w * 0.7)
                                      .toInt(), // Adjust this for optimal size
                                  cacheHeight: (560.h * 0.7).toInt(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: const Color(0x104F4F4F),
                      padding: EdgeInsets.only(left: 20.w),
                      child: ListView(
                        children: [
                          SizedBox(
                            height: 450.h,
                          ),
                          /// the Experience & Skills
                          Text(
                            "Experience",
                            style: TextStyle(
                              color: const Color(0xff4F4F4F),
                              fontSize: 26.sp,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            "Flutter Developer | Tuwaiq",
                            style: TextStyle(
                              color: const Color(0xff4F4F4F),
                              fontSize: 16.sp,
                              fontFamily: 'Raleway',
                              // fontWeight: FontWeight.w100,
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            "September 2024 - Present",
                            style: TextStyle(
                              color: const Color(0xff4F4F4F),
                              fontSize: 14.sp,
                              fontFamily: 'Raleway',
                              // fontWeight: FontWeight.w100,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            "Flutter instructor | Microsoft Student Partner",
                            style: TextStyle(
                              color: const Color(0xff4F4F4F),
                              fontSize: 16.sp,
                              fontFamily: 'Raleway',
                              // fontWeight: FontWeight.w100,
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            "April 2023 - July 2023",
                            style: TextStyle(
                              color: const Color(0xff4F4F4F),
                              fontSize: 14.sp,
                              fontFamily: 'Raleway',
                              // fontWeight: FontWeight.w100,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            "Skills",
                            style: TextStyle(
                              color: const Color(0xff4F4F4F),
                              fontSize: 26.sp,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            """Flutter, Dart, Firebase, Git, GitHub, GitHub projects, Figma
Provider, Bloc, Dio, Shared Preferences, Hive, REST API, JSON
Caching, Unit test, localization 
Clean architecture""",
                            style: TextStyle(
                              color: const Color(0xff4F4F4F),
                              fontSize: 16.sp,
                              fontFamily: 'Raleway',
                              // fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
