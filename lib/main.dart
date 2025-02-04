import 'package:flutter/material.dart';
import 'package:protofolio/data/project/project.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Nagi El-Shershaby',
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData(
            useMaterial3: true,
          ),
          home: child,
        );
      },
      child: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Project> projects = [
      Project(
        name: 'Ahadith',
        description:
            'The startup company has built a gadget for vehicles by which to remotely track and control the vehicle.',
        imagesUrls: ['https://via.placeholder.com/150'],
        googlePlay:
            'https://play.google.com/store/apps/details?id=com.prof_nagi.ahadith',
        github: '',
        features: {
          'Feature 1':
              'Designing the user interface of the app (In two versions of admin and user)',
          'Feature 2':
              'Designing the user interface of the web app (In two versions of admin and user)',
          'Feature 3': 'Designing the user interface of the gadget',
          'Feature 4': 'Designing the user interface of the gadget\'s app',
        },
        iconUrl: 'https://via.placeholder.com/150',
        backgroundUrl: 'assets/bg/bg.jpg',
      ),
      Project(
        name: 'Project 2',
        description: 'Description 2',
        imagesUrls: ['https://via.placeholder.com/150'],
        googlePlay:
            'https://play.google.com/store/apps/details?id=com.example.app',
        appStore:
            'https://play.google.com/store/apps/details?id=com.example.app',
        github: '',
        features: {
          'Feature 1': 'Description 1',
          'Feature 2': 'Description 2',
        },
        iconUrl: 'https://via.placeholder.com/150',
        backgroundUrl: 'assets/bg/leaf_bg.jpg',
      ),
      Project(
        name: 'Project 3',
        description: 'Description 3',
        imagesUrls: ['https://via.placeholder.com/150'],
        googlePlay:
            'https://play.google.com/store/apps/details?id=com.example.app',
        appStore:
            'https://play.google.com/store/apps/details?id=com.example.app',
        github: '',
        features: {
          'Feature 1': 'Description 1',
          'Feature 2': 'Description 2',
        },
        iconUrl: 'https://via.placeholder.com/150',
        backgroundUrl: 'assets/bg/bage_bg.jpg',
      ),
    ];
    PageController pageController = PageController();
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return Container(
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

                /// the index number
                Positioned(
                  left: 200.w,
                  top: 100.h,
                  child: Container(
                    color: const Color(0xffFFFFFF),
                    width: 35.w,
                    height: 100.h,
                    child: Center(
                      child: Text(
                        "01",
                        style: TextStyle(
                          color: const Color(0xff4F4F4F),
                          fontSize: 32.sp,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                  ),
                ),

                /// the project name
                Positioned(
                  left: 200.w,
                  top: 200.h,
                  child: Container(
                    color: const Color(0xffFFFFFF),
                    width: 370.w,
                    height: 104.h,
                    child: Text(
                      "Ahadith",
                      style: TextStyle(
                        color: const Color(0xff4F4F4F),
                        fontSize: 48.sp,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),

                /// the project description & features
                Positioned(
                  left: 207.w,
                  top: 304.h,
                  child: Container(
                    color: const Color(0xffFFFFFF),
                    width: 700.w,
                    height: 400.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "an Android application that provides a comprehensive collection of Prophetic hadiths for users looking for guidance and a deeper understanding of Islamic teachings. Hadiths Sustained by HadeethEnc.com API, the app offers a wide range of diverse categories, each category filled with deep conversations.",
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

                        /// the project features in a dot list
                        for(var feature in projects[index].features!.entries)
                          Text(
                            "• ${feature.key}: ${feature.value}",
                            style: TextStyle(
                              color: const Color(0xff4F4F4F),
                              fontSize: 14.sp,
                              fontFamily: 'Raleway',
                              // fontWeight: FontWeight.w100,
                            ),
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
                    width: 325.w,
                    height: 107.h,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Transform.rotate(
                            angle: 3.14159, // 180 degrees in radians
                            child: GestureDetector(
                              onTap: () {
                                pageController.previousPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              },
                              child: Image.asset(
                                'assets/images/icons/Vector.png',
                                width: 92.w,
                                height: 46.h,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: Image.asset(
                              'assets/images/icons/Vector.png',
                              width: 92.w,
                              height: 46.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
