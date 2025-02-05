import 'package:flutter/material.dart';
import 'package:protofolio/data/project/project.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

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
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: const Color(0xff4F4F4F),
              secondary: const Color(0xffFFFFFF),
            ),
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
        backgroundUrl: 'assets/bg/leaf_bg.jpg',
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
        backgroundUrl: 'assets/bg/bage_bg.jpg',
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

                  /// the project name
                  Positioned(
                    left: 200.w,
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
                        IconButton(
                          icon: const Icon(Icons.play_arrow_outlined),
                          onPressed: () {
                            if (projects[index].googlePlay != null) {
                              launchUrl(Uri.parse(projects[index].googlePlay!));
                            }
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.apple),
                          onPressed: () {
                            if (projects[index].appStore != null) {
                              // launchUrl(Uri.parse(projects[index].appStore!));
                            }
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.code),
                          onPressed: () {
                            if (projects[index].github != null) {
                              // launchUrl(Uri.parse(projects[index].github!));
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
                          for (var feature in projects[index].features!.entries)
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
                                  cacheWidth: (220.w * 0.7)
                                      .toInt(), // Adjust this for optimal size
                                  cacheHeight: (560.h * 0.7).toInt(),
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

                  /// the project images
                  scatteredImages(projects[index].imagesUrls!),
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
      height: 560.h,
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
