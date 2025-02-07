import 'package:flutter/material.dart';
import 'package:protofolio/data/project/project.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protofolio/ui/pages/home_page.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Project> projects = [
      Project(
        name: 'Ahadith',
        description:
            'an Android application that provides a comprehensive collection of Prophetic hadiths for users looking for guidance and a deeper understanding of Islamic teachings. Hadiths Sustained by HadeethEnc.com API, the app offers a wide range of diverse categories, each category filled with deep conversations.',
        imagesUrls: [
          'assets/images/ahadith/ahadith.jpg',
          'assets/images/ahadith/ahadith1.jpg',
          'assets/images/ahadith/ahadith2.jpg',
          'assets/images/ahadith/ahadith3.jpg',
          'assets/images/ahadith/ahadith4.jpg',
          'assets/images/ahadith/ahadith5.jpg',
          'assets/images/ahadith/ahadith6.jpg',
          'assets/images/ahadith/ahadith7.jpg',
          'assets/images/ahadith/ahadith8.jpg',
          'assets/images/ahadith/ahadith9.jpg',
          'assets/images/ahadith/ahadith10.jpg',
          'assets/images/ahadith/ahadith11.jpg',
          'assets/images/ahadith/ahadith12.jpg',
          'assets/images/ahadith/ahadith13.jpg',
          null,
          null
        ],
        backgroundUrl: 'assets/images/ahadith/ahadith_bg.png',
        googlePlay:
            'https://play.google.com/store/apps/details?id=com.prof_nagi.ahadith',
        github: 'https://github.com/nagiElshershaby/Ahadith',
        features: {
          'Bloc': 'State management for complex tasks',
          'Dio': 'HTTP client for making API calls to HadeethEnc.com',
          'flutter_offline': 'Check internet connection',
          'flutter_screenutil': 'Responsive UI',
          'provider':
              'used it for state management along side the Bloc in the Favorites',
          'hive':
              'Local database for storing favorites, and whole collections of Ahadith',
          'google_fonts': 'Custom fonts for the app',
          'screenshot':
              'Taking screenshots of the app and cutting it to share it',
          'share_plus': 'Sharing the app and the Ahadith with friends',
          'path_provider': 'Getting the path of the screenshots',
          'hijri': 'Converting Gregorian dates to Hijri dates',
          'flutter_native_splash': 'Custom splash screen',
          'flutter_native_timezone_updated_gradle':
              'Getting the device timezone',
          'flutter_local_notifications':
              'Local notifications for daily reminders',
          'flutter_launcher_icons': 'Custom app icons',
        },
        iconUrl:
            'https://play-lh.googleusercontent.com/u-GuFuhZtA1T2Gvsto2H5ahn4g6t2zCGrUBeb3Gs3sFWIbuRqmDPv_j3Y9tMeCPPqw=w240-h480-rw',
      ),
      Project(
        name: "أذكار",
        description: 'Description 2',
        imagesUrls: [
          null,
          null,
          null,
          'assets/images/athkar/athkar1.jpg',
          'assets/images/athkar/athkar.jpg',
          'assets/images/athkar/athkar3.jpg',
          'assets/images/athkar/athkar4.jpg',
          'assets/images/athkar/athkar1.jpg',
          null,
          null,
          'assets/images/athkar/athkar2.jpg',
          null,
          null,
          null,
          null,
          null,
        ],
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
      ),
      Project(
        name: 'Project 3',
        description: 'Description 3',
        imagesUrls: [
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
        ],
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
      ),
    ];
    PageController pageController = PageController();
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return RepaintBoundary(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
              child: Stack(
                children: [
                  /// the background image
                  if (projects[index].backgroundUrl != null)
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 1920.w,
                        height: 1080.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(projects[index].backgroundUrl!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

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
                    left: 199.w,
                    top: 100.h,
                    child: Container(
                      color: const Color(0xffFFFFFF),
                      width: 50.w,
                      height: 100.h,
                      child: Row(
                        children: [
                          Text(
                            "0${index + 1}",
                            style: TextStyle(
                              color: const Color(0xff4F4F4F),
                              fontSize: 32.sp,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// the project name and links
                  Positioned(
                    left: 199.w,
                    top: 200.h,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          color: const Color(0xffFFFFFF),
                          // width: 370.w,
                          height: 104.h,
                          child: Center(
                            child: Text(
                              projects[index].name!,
                              style: TextStyle(
                                color: const Color(0xff4F4F4F),
                                fontSize: 48.sp,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        if (projects[index].googlePlay != null)
                          IconButton(
                            icon: const Icon(Icons.play_arrow_outlined),
                            onPressed: () {
                              if (projects[index].googlePlay != null) {
                                launchUrl(
                                    Uri.parse(projects[index].googlePlay!));
                              }
                            },
                          ),
                        if (projects[index].appStore != null)
                          IconButton(
                            icon: const Icon(Icons.apple),
                            onPressed: () {
                              if (projects[index].appStore != null) {
                                // launchUrl(Uri.parse(projects[index].appStore!));
                              }
                            },
                          ),
                        if (projects[index].github != null)
                          IconButton(
                            icon: const Icon(Icons.code),
                            onPressed: () {
                              if (projects[index].github != null) {
                                launchUrl(Uri.parse(projects[index].github!));
                              }
                            },
                          ),
                      ],
                    ),
                  ),

                  /// the project description & features
                  Positioned(
                    left: 207.w,
                    top: 304.h,
                    child: SizedBox(
                      // color: const Color(0xffFFFFFF),
                      width: 700.w,
                      height: 600.h,
                      child: ListView(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            projects[index].description!,
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
                          for (var feature in projects[index].features!.entries)
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '• ',
                                    style: TextStyle(
                                      color: const Color(0xff4F4F4F),
                                      fontSize: 16.sp,
                                      fontFamily: 'Raleway',
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '${feature.key}: ',
                                    style: TextStyle(
                                      color: const Color(0xff4F4F4F),
                                      fontSize: 16.sp,
                                      fontFamily: 'Raleway',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text: feature.value,
                                    style: TextStyle(
                                      color: const Color(0xff4F4F4F),
                                      fontSize: 16.sp,
                                      fontFamily: 'Raleway',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),

                  /// the project images
                  // scatteredImages(projects[index].imagesUrls!),

                  /// the navigation arrows
                  Positioned(
                    left: 199.w,
                    bottom: 70.h,
                    child: SizedBox(
                      // color: const Color(0xffFFFFFF),
                      width: 275.w,
                      height: 107.h,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              color: const Color(0xffFFFFFF),
                              height: 107.h,
                              width: 5.w,
                            ),
                            Transform.rotate(
                              angle: 3.14159, // 180 degrees in radians
                              child: GestureDetector(
                                onTap: () {
                                  if (index == 0) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const HomePage(),
                                      ),
                                    );
                                  } else {
                                    pageController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                                child: Image.asset(
                                  'assets/images/icons/Vector.png',
                                  width: 92.w,
                                  height: 46.h,
                                  cacheWidth: (220.w * 0.7)
                                      .toInt(), // Adjust this for optimal size
                                  cacheHeight: (560.h * 0.7).toInt(),
                                ),
                              ),
                            ),
                            Expanded(child: Container()),
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
                                cacheWidth: (220.w * 0.7)
                                    .toInt(), // Adjust this for optimal size
                                cacheHeight: (560.h * 0.7).toInt(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget screenshot({String? imagePath}) {
    return Container(
      width: 220.w,
      height: 490.h,
      decoration: BoxDecoration(
        color: const Color(0xffFFFFFF),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: imagePath != null
            ? const [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 4,
                  blurRadius: 4,
                  offset: Offset(4, 4), // changes position of shadow
                ),
              ]
            : null,
        image: (imagePath != null)
            ? DecorationImage(
                image: AssetImage(
                  imagePath,
                ),
                filterQuality: FilterQuality.low,
                fit: BoxFit.fill,
              )
            : null,
      ),
    );
  }

  Widget scatteredImages(List<String?> images) {
    return Transform.rotate(
      angle: 0.4,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // 1st column
          Positioned(
            right: 800.w,
            top: -360.h,
            child: Column(children: [
              screenshot(imagePath: images[0]),
              SizedBox(height: 20.h),
              screenshot(imagePath: images[1]),
              SizedBox(height: 20.h),
              screenshot(imagePath: images[2]),
            ]),
          ),
          // 2nd column
          Positioned(
            right: 560.w,
            top: -450.h,
            child: Column(children: [
              screenshot(imagePath: images[3]),
              SizedBox(height: 20.h),
              screenshot(imagePath: images[4]),
              SizedBox(height: 20.h),
              screenshot(imagePath: images[5]),
            ]),
          ),
          // 3rd column
          Positioned(
            right: 320.w,
            top: -330.h,
            child: Column(children: [
              screenshot(imagePath: images[6]),
              SizedBox(height: 20.h),
              screenshot(imagePath: images[7]),
              SizedBox(height: 20.h),
              screenshot(imagePath: images[8]),
            ]),
          ),
          // 4th column
          Positioned(
            right: 80.w,
            top: -400.h,
            child: Column(children: [
              screenshot(imagePath: images[9]),
              SizedBox(height: 20.h),
              screenshot(imagePath: images[10]),
              SizedBox(height: 20.h),
              screenshot(imagePath: images[11]),
            ]),
          ),
          // 5th column
          Positioned(
            right: -160.w,
            top: -400.h,
            child: Column(children: [
              SizedBox(height: 400.h),
              screenshot(imagePath: images[12]),
              SizedBox(height: 20.h),
              screenshot(imagePath: images[13]),
              SizedBox(height: 20.h),
              screenshot(imagePath: images[14]),
            ]),
          ),
        ],
      ),
    );
  }
}
