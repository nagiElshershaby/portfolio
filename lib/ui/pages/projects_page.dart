import 'package:flutter/material.dart';
import 'package:protofolio/data/project/project.dart';
import 'package:protofolio/ui/pages/home_page.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Project> projects = [
      // Roze Moon
      Project(
        name: 'Roze Moon',
        description:
            '🌸 Welcome to Roze Moon – Your Gateway to Beautiful Flowers! 🌸\nDiscover a world of floral elegance with Roze Moon, your ultimate destination for ordering fresh flowers effortlessly. Whether it’s a special occasion or just a gesture to brighten someone’s day, we’ve got you covered with stunning bouquets, tailored arrangements, and seamless ordering options.',
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
            'https://play.google.com/store/apps/details?id=com.rozemoon.app',
        appStore: 'https://apps.apple.com/eg/app/roze-moon/id6739536345',
        features: {
          'Feature1': '💐 Browse a Variety of Flowers',
          'Feature2': '🛒 Order or Pre-Order with Ease',
          'Feature3': '📍 Select Your Delivery Address with Precision',
          'Feature4': '📱 Stay Updated with WhatsApp Notifications',
          'Feature5': '💌 Personalize Your Gifting',
        },
        iconUrl:
            'https://play-lh.googleusercontent.com/eVZIFAMQazrVN2VybzAEgHOd8FJKjqiekLv26u7PvFBpQcK5TrVsJNXP97dJ8s4wDByr=w240-h480-rw',
      ),
      // Ahadith
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
      // Azkar
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
      // Lamha
      Project(
        name: 'لمحــة',
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
      // Zahra Flowers
      Project(
        name: 'Zahra Flowers',
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
      // The Closet
      Project(
        name: 'The Closet',
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
      // Ill-Vent
      Project(
        name: 'Ill-Vent',
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
      // Other Modules
      Project(
        name: 'Other Modules',
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
                        width: 1920,
                        height: 1080,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(projects[index].backgroundUrl!),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),

                  /// the black line
                  Positioned(
                    left: 200,
                    child: Container(
                      color: const Color(0xff4F4F4F),
                      width: 3,
                      height: MediaQuery.of(context).size.height,
                    ),
                  ),

                  /// the index number
                  Positioned(
                    left: 199,
                    top: 100,
                    child: Container(
                      color: const Color(0xffFFFFFF),
                      width: 50,
                      height: 100,
                      child: Row(
                        children: [
                          Text(
                            "0${index + 1}",
                            style: const TextStyle(
                              color: Color(0xff4F4F4F),
                              fontSize: 32,
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
                    left: 199,
                    top: 200,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          color: const Color(0xffFFFFFF),
                          // width: 370,
                          height: 104,
                          child: Center(
                            child: Text(
                              projects[index].name!,
                              style: const TextStyle(
                                color: Color(0xff4F4F4F),
                                fontSize: 48,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        if (projects[index].googlePlay != null)
                          GestureDetector(
                            child: Image.asset(
                              "assets/images/icons/google_play.png",
                              height: 46,
                              width: 46,
                            ),
                            onTap: () {
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
                    left: 207,
                    top: 304,
                    child: SizedBox(
                      // color: const Color(0xffFFFFFF),
                      width: 700,
                      height: 600,
                      child: ListView(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            projects[index].description!,
                            style: const TextStyle(
                              color: Color(0xff4F4F4F),
                              fontSize: 16,
                              fontFamily: 'Raleway',
                              // fontWeight: FontWeight.w100,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          /// the project features in a dot list
                          for (var feature in projects[index].features!.entries)
                            RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: '• ',
                                    style: TextStyle(
                                      color: Color(0xff4F4F4F),
                                      fontSize: 16,
                                      fontFamily: 'Raleway',
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '${feature.key}: ',
                                    style: const TextStyle(
                                      color: Color(0xff4F4F4F),
                                      fontSize: 16,
                                      fontFamily: 'Raleway',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text: feature.value,
                                    style: const TextStyle(
                                      color: Color(0xff4F4F4F),
                                      fontSize: 16,
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
                    left: 199,
                    bottom: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          color: const Color(0xffFFFFFF),
                          height: 107,
                          width: 5,
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
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                            child: Image.asset(
                              'assets/images/icons/Vector.png',
                              width: 92,
                              height: 46,
                              cacheWidth: (220 * 0.7)
                                  .toInt(), // Adjust this for optimal size
                              cacheHeight: (560 * 0.7).toInt(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (index == projects.length - 1) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                              );
                            } else {
                              pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          child: Image.asset(
                            'assets/images/icons/Vector.png',
                            width: 92,
                            height: 46,
                            cacheWidth: (220 * 0.7)
                                .toInt(), // Adjust this for optimal size
                            cacheHeight: (560 * 0.7).toInt(),
                          ),
                        ),
                      ],
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
      width: 220,
      height: 490,
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
            right: 800,
            top: -360,
            child: Column(children: [
              screenshot(imagePath: images[0]),
              const SizedBox(height: 20),
              screenshot(imagePath: images[1]),
              const SizedBox(height: 20),
              screenshot(imagePath: images[2]),
            ]),
          ),
          // 2nd column
          Positioned(
            right: 560,
            top: -450,
            child: Column(children: [
              screenshot(imagePath: images[3]),
              const SizedBox(height: 20),
              screenshot(imagePath: images[4]),
              const SizedBox(height: 20),
              screenshot(imagePath: images[5]),
            ]),
          ),
          // 3rd column
          Positioned(
            right: 320,
            top: -330,
            child: Column(children: [
              screenshot(imagePath: images[6]),
              const SizedBox(height: 20),
              screenshot(imagePath: images[7]),
              const SizedBox(height: 20),
              screenshot(imagePath: images[8]),
            ]),
          ),
          // 4th column
          Positioned(
            right: 80,
            top: -400,
            child: Column(children: [
              screenshot(imagePath: images[9]),
              const SizedBox(height: 20),
              screenshot(imagePath: images[10]),
              const SizedBox(height: 20),
              screenshot(imagePath: images[11]),
            ]),
          ),
          // 5th column
          Positioned(
            right: -160,
            top: -400,
            child: Column(children: [
              const SizedBox(height: 400),
              screenshot(imagePath: images[12]),
              const SizedBox(height: 20),
              screenshot(imagePath: images[13]),
              const SizedBox(height: 20),
              screenshot(imagePath: images[14]),
            ]),
          ),
        ],
      ),
    );
  }
}

