import 'package:flutter/material.dart';
import 'package:protofolio/data/project/project.dart';
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
            /// the project name and links
            Positioned(
              left: 200.w,
              top: 100.h,
              child: Container(
                color: const Color(0xffFFFFFF),
                // width: 370.w,
                height: 230.h,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                              launchUrl(
                                  Uri.parse("https://github.com/nagiElshershaby"));
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// the project description & features
            Positioned(
              left: 207.w,
              top: 324.h,
              child: Container(
                color: const Color(0xffFFFFFF),
                width: 700.w,
                height: 400.h,
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
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
                  ],
                ),
              ),
            ),

            /// the navigation arrows
            Positioned(
              left: 200.w,
              bottom: 70.h,
              child: Container(
                color: const Color(0xffFFFFFF),
                width: 250.w,
                height: 107.h,
                child: Center(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
