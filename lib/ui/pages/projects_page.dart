// import 'package:flutter/material.dart';
// import 'package:protofolio/data/project/project.dart';
// import 'package:protofolio/ui/pages/home_page.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class ProjectsPage extends StatelessWidget {
//   const ProjectsPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     List<Project> projects = [
//       // Roze Moon
//       Project(
//         name: 'Roze Moon',
//         description:
//             '🌸 Welcome to Roze Moon – Your Gateway to Beautiful Flowers! 🌸\nDiscover a world of floral elegance with Roze Moon, your ultimate destination for ordering fresh flowers effortlessly. Whether it’s a special occasion or just a gesture to brighten someone’s day, we’ve got you covered with stunning bouquets, tailored arrangements, and seamless ordering options.',
//         backgroundUrl: 'assets/images/bg/rozemoon_bg.png',
//         googlePlay:
//             'https://play.google.com/store/apps/details?id=com.rozemoon.app',
//         appStore: 'https://apps.apple.com/eg/app/roze-moon/id6739536345',
//         features: {
//           'Type': 'Developed at Tuwaiq',
//           'Feature1': '💐 Browse a Variety of Flowers',
//           'Feature2': '🛒 Order or Pre-Order with Ease',
//           'Feature3': '📍 Select Your Delivery Address with Precision',
//           'Feature4': '📱 Stay Updated with WhatsApp Notifications',
//           'Feature5': '💌 Personalize Your Gifting',
//           'hive':
//           'Local database for storing favorites, and whole collections of Ahadith',
//           'google_fonts': 'Custom fonts for the app',
//           'screenshot':
//           'Taking screenshots of the app and cutting it to share it',
//           'share_plus': 'Sharing the app and the Ahadith with friends',
//           'path_provider': 'Getting the path of the screenshots',
//           'hijri': 'Converting Gregorian dates to Hijri dates',
//           'flutter_native_splash': 'Custom splash screen',
//           'flutter_native_timezone_updated_gradle':
//           'Getting the device timezone',
//           'flutter_local_notifications':
//           'Local notifications for daily reminders',
//           'flutter_launcher_icons': 'Custom app icons',
//         },
//         iconUrl:
//             'https://play-lh.googleusercontent.com/eVZIFAMQazrVN2VybzAEgHOd8FJKjqiekLv26u7PvFBpQcK5TrVsJNXP97dJ8s4wDByr=w240-h480-rw',
//       ),
//       // Zahra Flowers
//       Project(
//         name: 'Zahra Flowers',
//         description: 'A Flux Store template that worked with Shopify that i was asked to edit and connect its graphQl collections',
//         backgroundUrl: 'assets/images/bg/zahra_bg.png',
//         features: {
//           'Type': 'Freelancing',
//           'Bloc': 'State management for complex tasks',
//           'Dio': 'HTTP client for making API calls to HadeethEnc.com',
//           'flutter_offline': 'Check internet connection',
//           'flutter_screenutil': 'Responsive UI',
//           'provider':
//           'used it for state management along side the Bloc in the Favorites',
//           'hive':
//           'Local database for storing favorites, and whole collections of Ahadith',
//           'google_fonts': 'Custom fonts for the app',
//           'screenshot':
//           'Taking screenshots of the app and cutting it to share it',
//           'share_plus': 'Sharing the app and the Ahadith with friends',
//           'path_provider': 'Getting the path of the screenshots',
//           'hijri': 'Converting Gregorian dates to Hijri dates',
//           'flutter_native_splash': 'Custom splash screen',
//           'flutter_native_timezone_updated_gradle':
//           'Getting the device timezone',
//           'flutter_local_notifications':
//           'Local notifications for daily reminders',
//           'flutter_launcher_icons': 'Custom app icons',
//         },
//       ),
//       // Ahadith
//       Project(
//         name: 'Ahadith',
//         description:
//             'an Android application that provides a comprehensive collection of Prophetic hadiths for users looking for guidance and a deeper understanding of Islamic teachings. Hadiths Sustained by HadeethEnc.com API, the app offers a wide range of diverse categories, each category filled with deep conversations.',
//         backgroundUrl: 'assets/images/bg/ahadith_bg.png',
//         googlePlay:
//             'https://play.google.com/store/apps/details?id=com.prof_nagi.ahadith',
//         github: 'https://github.com/nagiElshershaby/Ahadith',
//         features: {
//           'Type': 'Personal Project',
//           'Bloc': 'State management for complex tasks',
//           'Dio': 'HTTP client for making API calls to HadeethEnc.com',
//           'flutter_offline': 'Check internet connection',
//           'flutter_screenutil': 'Responsive UI',
//           'provider':
//               'used it for state management along side the Bloc in the Favorites',
//           'hive':
//               'Local database for storing favorites, and whole collections of Ahadith',
//           'google_fonts': 'Custom fonts for the app',
//           'screenshot':
//               'Taking screenshots of the app and cutting it to share it',
//           'share_plus': 'Sharing the app and the Ahadith with friends',
//           'path_provider': 'Getting the path of the screenshots',
//           'hijri': 'Converting Gregorian dates to Hijri dates',
//           'flutter_native_splash': 'Custom splash screen',
//           'flutter_native_timezone_updated_gradle':
//               'Getting the device timezone',
//           'flutter_local_notifications':
//               'Local notifications for daily reminders',
//           'flutter_launcher_icons': 'Custom app icons',
//         },
//         iconUrl:
//             'https://play-lh.googleusercontent.com/u-GuFuhZtA1T2Gvsto2H5ahn4g6t2zCGrUBeb3Gs3sFWIbuRqmDPv_j3Y9tMeCPPqw=w240-h480-rw',
//       ),
//       // Lamha
//       Project(
//         name: 'لمحــة',
//         description: 'A daily dose of knowledge and faith.\n Lamha is a simple freelancing project that I developed for a client, it contains a collection of scientific miracles in many fields, With a Quranic verse or a noble Prophet’s hadith.',
//         backgroundUrl: 'assets/images/bg/lamha_bg.png',
//         googlePlay:
//             'https://play.google.com/store/apps/details?id=com.prof_nagi.lam7ah',
//         github: '',
//         features: {
//           'Type': 'Freelancing',
//           'Bloc': 'State management for complex tasks',
//           'Dio': 'HTTP client for making API calls to HadeethEnc.com',
//           'flutter_offline': 'Check internet connection',
//           'flutter_screenutil': 'Responsive UI',
//           'provider':
//           'used it for state management along side the Bloc in the Favorites',
//           'hive':
//           'Local database for storing favorites, and whole collections of Ahadith',
//           'google_fonts': 'Custom fonts for the app',
//           'screenshot':
//           'Taking screenshots of the app and cutting it to share it',
//           'share_plus': 'Sharing the app and the Ahadith with friends',
//           'path_provider': 'Getting the path of the screenshots',
//           'hijri': 'Converting Gregorian dates to Hijri dates',
//           'flutter_native_splash': 'Custom splash screen',
//           'flutter_native_timezone_updated_gradle':
//           'Getting the device timezone',
//           'flutter_local_notifications':
//           'Local notifications for daily reminders',
//           'flutter_launcher_icons': 'Custom app icons',
//         },
//       ),
//       // Azkar
//       Project(
//         name: "أذكار",
//         description: 'Make yourself a daily remembrance of what our Master Muhammad, may God bless him and grant him peace, recommended\nAzkar is a very simple app that meant a lot to its users\nIt contains a collection of Azkar that the user can read, and it also contains a counter for each Azkar to help the user to keep track of the number of times he/she read it.',
//         backgroundUrl: 'assets/images/bg/azkar_bg.png',
//         googlePlay:
//         'https://play.google.com/store/apps/details?id=com.prof_nagi.azkar',
//         github: '',
//         features: {
//           'Type': 'Freelancing',
//           'Bloc': 'State management for complex tasks',
//           'Dio': 'HTTP client for making API calls to HadeethEnc.com',
//           'flutter_offline': 'Check internet connection',
//           'flutter_screenutil': 'Responsive UI',
//           'provider':
//           'used it for state management along side the Bloc in the Favorites',
//           'hive':
//           'Local database for storing favorites, and whole collections of Ahadith',
//           'google_fonts': 'Custom fonts for the app',
//           'screenshot':
//           'Taking screenshots of the app and cutting it to share it',
//           'share_plus': 'Sharing the app and the Ahadith with friends',
//           'path_provider': 'Getting the path of the screenshots',
//           'hijri': 'Converting Gregorian dates to Hijri dates',
//           'flutter_native_splash': 'Custom splash screen',
//           'flutter_native_timezone_updated_gradle':
//           'Getting the device timezone',
//           'flutter_local_notifications':
//           'Local notifications for daily reminders',
//           'flutter_launcher_icons': 'Custom app icons',
//         },
//       ),
//       // The Closet
//       Project(
//         name: 'The Closet',
//         description: 'The Closet is a personal concept project for a fashion app that helps users to organize their clothes and plan their outfits.',
//         github: '',
//         features: {
//           'Type': 'Personal Project',
//           'Bloc': 'State management for complex tasks',
//           'Dio': 'HTTP client for making API calls to HadeethEnc.com',
//           'flutter_offline': 'Check internet connection',
//           'flutter_screenutil': 'Responsive UI',
//           'provider':
//           'used it for state management along side the Bloc in the Favorites',
//           'hive':
//           'Local database for storing favorites, and whole collections of Ahadith',
//           'google_fonts': 'Custom fonts for the app',
//           'screenshot':
//           'Taking screenshots of the app and cutting it to share it',
//           'share_plus': 'Sharing the app and the Ahadith with friends',
//           'path_provider': 'Getting the path of the screenshots',
//           'hijri': 'Converting Gregorian dates to Hijri dates',
//           'flutter_native_splash': 'Custom splash screen',
//           'flutter_native_timezone_updated_gradle':
//           'Getting the device timezone',
//           'flutter_local_notifications':
//           'Local notifications for daily reminders',
//           'flutter_launcher_icons': 'Custom app icons',
//         },
//         backgroundUrl: 'assets/images/bg/closet_bg.png',
//       ),
//       // Ill-Vent
//       Project(
//         name: 'Ill-Vent',
//         description: 'Ill-Vent is a startup project that I worked on with a team of developers, designers, and business developers. It is a platform for emergency services that connects users with the nearest available ambulance, police, or fire department.',
//         backgroundUrl: 'assets/images/bg/ill-vent_bg.png',
//         features: {
//           'Type': 'Freelancing',
//           'Bloc': 'State management for complex tasks',
//           'Dio': 'HTTP client for making API calls to HadeethEnc.com',
//           'flutter_offline': 'Check internet connection',
//           'flutter_screenutil': 'Responsive UI',
//           'provider':
//           'used it for state management along side the Bloc in the Favorites',
//           'hive':
//           'Local database for storing favorites, and whole collections of Ahadith',
//           'google_fonts': 'Custom fonts for the app',
//           'screenshot':
//           'Taking screenshots of the app and cutting it to share it',
//           'share_plus': 'Sharing the app and the Ahadith with friends',
//           'path_provider': 'Getting the path of the screenshots',
//           'hijri': 'Converting Gregorian dates to Hijri dates',
//           'flutter_native_splash': 'Custom splash screen',
//           'flutter_native_timezone_updated_gradle':
//           'Getting the device timezone',
//           'flutter_local_notifications':
//           'Local notifications for daily reminders',
//           'flutter_launcher_icons': 'Custom app icons',
//         },
//       ),
//       // Other Modules
//       Project(
//         name: 'Other Modules',
//         description: 'A list of other modules that I worked on, including a chat module, a localized version of Ahadith, and more...',
//         github: '',
//         backgroundUrl: 'assets/images/bg/others_bg.png',
//         features: {
//           'Type': 'Personal Projects',
//           'Bloc': 'State management for complex tasks',
//           'Dio': 'HTTP client for making API calls to HadeethEnc.com',
//           'flutter_offline': 'Check internet connection',
//           'flutter_screenutil': 'Responsive UI',
//           'provider':
//           'used it for state management along side the Bloc in the Favorites',
//           'hive':
//           'Local database for storing favorites, and whole collections of Ahadith',
//           'google_fonts': 'Custom fonts for the app',
//           'screenshot':
//           'Taking screenshots of the app and cutting it to share it',
//           'share_plus': 'Sharing the app and the Ahadith with friends',
//           'path_provider': 'Getting the path of the screenshots',
//           'hijri': 'Converting Gregorian dates to Hijri dates',
//           'flutter_native_splash': 'Custom splash screen',
//           'flutter_native_timezone_updated_gradle':
//           'Getting the device timezone',
//           'flutter_local_notifications':
//           'Local notifications for daily reminders',
//           'flutter_launcher_icons': 'Custom app icons',
//         },
//       ),
//     ];
//     PageController pageController = PageController();
//     return Scaffold(
//       body: PageView.builder(
//         controller: pageController,
//         itemCount: projects.length,
//         scrollDirection: Axis.vertical,
//         itemBuilder: (context, index) {
//           return RepaintBoundary(
//             child: Container(
//               width: double.infinity,
//               height: double.infinity,
//               color: Colors.white,
//               child: Stack(
//                 children: [
//                   /// the background image
//                   if (projects[index].backgroundUrl != null)
//                     Positioned(
//                       left: 0,
//
//                       child: Container(
//                         width: 1920,
//                         height: 1080,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage(projects[index].backgroundUrl!),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       SizedBox(
//                         width: 960,
//                         child: Stack(
//                           children: [
//                             /// the black line
//                             Positioned(
//                               left: 200,
//                               child: Container(
//                                 color: const Color(0xff4F4F4F),
//                                 width: 3,
//                                 height: MediaQuery.of(context).size.height,
//                               ),
//                             ),
//
//                             ListView(
//                               children: [
//                                 const SizedBox(
//                                   height: 100,
//                                 ),
//                                 /// the index number, project name and links
//                                 Container(
//                                   height: 230,
//                                   padding: const EdgeInsets.only(left: 200),
//                                   child: Row(
//                                     children: [
//                                       Container(
//                                         color: const Color(0xffFFFFFF),
//                                         width: 5,
//                                       ),
//                                       Column(
//                                         mainAxisSize: MainAxisSize.min,
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         children: [
//                                           Text(
//                                             "0${index + 1}",
//                                             style: const TextStyle(
//                                               color: Color(0xff4F4F4F),
//                                               fontSize: 32,
//                                               fontFamily: 'Raleway',
//                                               fontWeight: FontWeight.w100,
//                                             ),
//                                           ),
//                                           Row(
//                                             mainAxisSize: MainAxisSize.min,
//                                             children: [
//                                               Text(
//                                                 projects[index].name!,
//                                                 style: const TextStyle(
//                                                   color: Color(0xff4F4F4F),
//                                                   fontSize: 48,
//                                                   fontFamily: 'Raleway',
//                                                   fontWeight: FontWeight.w700,
//                                                 ),
//                                               ),
//                                               const SizedBox(
//                                                 width: 20,
//                                               ),
//                                               if (projects[index].googlePlay != null)
//                                                 GestureDetector(
//                                                   child: Image.asset(
//                                                     "assets/images/icons/google-play.png",
//                                                     height: 28,
//                                                     width: 28,
//                                                   ),
//                                                   onTap: () {
//                                                     if (projects[index].googlePlay != null) {
//                                                       launchUrl(
//                                                           Uri.parse(projects[index].googlePlay!));
//                                                     }
//                                                   },
//                                                 ),
//                                               const SizedBox(
//                                                 width: 20,
//                                               ),
//                                               if (projects[index].appStore != null)
//                                                 GestureDetector(
//                                                   child: Image.asset(
//                                                     "assets/images/icons/app-store.png",
//                                                     height: 28,
//                                                     width: 28,
//                                                   ),
//                                                   onTap: () {
//                                                     if (projects[index].appStore != null) {
//                                                       launchUrl(
//                                                           Uri.parse(projects[index].appStore!));
//                                                     }
//                                                   },
//                                                 ),
//                                               if (projects[index].github != null)
//                                                 IconButton(
//                                                   icon: const Icon(Icons.code),
//                                                   onPressed: () {
//                                                     if (projects[index].github != null) {
//                                                       launchUrl(Uri.parse(projects[index].github!));
//                                                     }
//                                                   },
//                                                 ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//
//                                 /// the project description & features
//                                 Container(
//                                   // color: const Color(0xffFFFFFF),
//                                   padding: const EdgeInsets.only(left: 207, right: 20),
//                                   // width: 900,
//                                   height: 440,
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         projects[index].description!,
//                                         style: const TextStyle(
//                                           color: Color(0xff4F4F4F),
//                                           fontSize: 16,
//                                           fontFamily: 'Raleway',
//                                           // fontWeight: FontWeight.w100,
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 20,
//                                       ),
//
//                                       /// the project features in a dot list
//                                       for (var feature in projects[index].features!.entries)
//                                         RichText(
//                                           text: TextSpan(
//                                             children: [
//                                               const TextSpan(
//                                                 text: '• ',
//                                                 style: TextStyle(
//                                                   color: Color(0xff4F4F4F),
//                                                   fontSize: 16,
//                                                   fontFamily: 'Raleway',
//                                                   fontWeight: FontWeight.w100,
//                                                 ),
//                                               ),
//                                               TextSpan(
//                                                 text: '${feature.key}: ',
//                                                 style: const TextStyle(
//                                                   color: Color(0xff4F4F4F),
//                                                   fontSize: 16,
//                                                   fontFamily: 'Raleway',
//                                                   fontWeight: FontWeight.w700,
//                                                 ),
//                                               ),
//                                               TextSpan(
//                                                 text: feature.value,
//                                                 style: const TextStyle(
//                                                   color: Color(0xff4F4F4F),
//                                                   fontSize: 16,
//                                                   fontFamily: 'Raleway',
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                     ],
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 50,
//                                 ),
//                                 /// the navigation arrows
//                                 Container(
//                                   height: 107,
//                                   padding: const EdgeInsets.only(left: 200),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       Container(
//                                         color: const Color(0xffFFFFFF),
//                                         height: 107,
//                                         width: 5,
//                                       ),
//                                       Transform.rotate(
//                                         angle: 3.14159, // 180 degrees in radians
//                                         child: GestureDetector(
//                                           onTap: () {
//                                             if (index == 0) {
//                                               Navigator.push(
//                                                 context,
//                                                 MaterialPageRoute(
//                                                   builder: (context) => const HomePage(),
//                                                 ),
//                                               );
//                                             } else {
//                                               pageController.previousPage(
//                                                 duration: const Duration(milliseconds: 500),
//                                                 curve: Curves.easeInOut,
//                                               );
//                                             }
//                                           },
//                                           child: Image.asset(
//                                             'assets/images/icons/Vector.png',
//                                             width: 92,
//                                             height: 46,
//                                             cacheWidth: (220 * 0.7)
//                                                 .toInt(), // Adjust this for optimal size
//                                             cacheHeight: (560 * 0.7).toInt(),
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         width: 100,
//                                       ),
//                                       GestureDetector(
//                                         onTap: () {
//                                           if (index == projects.length - 1) {
//                                             Navigator.pushReplacement(
//                                               context,
//                                               MaterialPageRoute(
//                                                 builder: (context) => const HomePage(),
//                                               ),
//                                             );
//                                           } else {
//                                             pageController.nextPage(
//                                               duration: const Duration(milliseconds: 500),
//                                               curve: Curves.easeInOut,
//                                             );
//                                           }
//                                         },
//                                         child: Image.asset(
//                                           'assets/images/icons/Vector.png',
//                                           width: 92,
//                                           height: 46,
//                                           cacheWidth: (220 * 0.7)
//                                               .toInt(), // Adjust this for optimal size
//                                           cacheHeight: (560 * 0.7).toInt(),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//

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
        backgroundUrl: 'assets/images/bg/rozemoon_bg.png',
        googlePlay:
            'https://play.google.com/store/apps/details?id=com.rozemoon.app',
        appStore: 'https://apps.apple.com/eg/app/roze-moon/id6739536345',
        iconUrl:
            'https://play-lh.googleusercontent.com/eVZIFAMQazrVN2VybzAEgHOd8FJKjqiekLv26u7PvFBpQcK5TrVsJNXP97dJ8s4wDByr=w240-h480-rw',
        lastUpdate: '2025',
        status: 'ongoing',
      ),
      // Zahra Flowers
      Project(
        name: 'Zahra Flowers',
        description:
            'A Flux Store template that worked with Shopify that i was asked to edit and connect its graphQl collections',
        backgroundUrl: 'assets/images/bg/zahra_bg.png',
        lastUpdate: '2024',
        status: 'discontinued',
      ),
      // Ahadith
      Project(
        name: 'Ahadith',
        description:
            'an Android application that provides a comprehensive collection of Prophetic hadiths for users looking for guidance and a deeper understanding of Islamic teachings. Hadiths Sustained by HadeethEnc.com API, the app offers a wide range of diverse categories, each category filled with deep conversations.',
        backgroundUrl: 'assets/images/bg/ahadith_bg.png',
        googlePlay:
            'https://play.google.com/store/apps/details?id=com.prof_nagi.ahadith',
        github: 'https://github.com/nagiElshershaby/Ahadith',
        iconUrl:
            'https://play-lh.googleusercontent.com/u-GuFuhZtA1T2Gvsto2H5ahn4g6t2zCGrUBeb3Gs3sFWIbuRqmDPv_j3Y9tMeCPPqw=w240-h480-rw',
        lastUpdate: '2024',
        status: 'completed',
      ),
      // Lamha
      Project(
        name: 'لمحــة',
        description:
            'A daily dose of knowledge and faith.\n Lamha is a simple freelancing project that I developed for a client, it contains a collection of scientific miracles in many fields, With a Quranic verse or a noble Prophet’s hadith.',
        backgroundUrl: 'assets/images/bg/lamha_bg.png',
        googlePlay:
            'https://play.google.com/store/apps/details?id=com.prof_nagi.lam7ah',
        github: 'https://github.com/nagiElshershaby/mogezat_app/tree/master',
        lastUpdate: '2023',
        status: 'completed',
      ),
      // Azkar
      Project(
        name: "أذكار",
        description:
            'Make yourself a daily remembrance of what our Master Muhammad, may God bless him and grant him peace, recommended\nAzkar is a very simple app that meant a lot to its users\nIt contains a collection of Azkar that the user can read, and it also contains a counter for each Azkar to help the user to keep track of the number of times he/she read it.',
        backgroundUrl: 'assets/images/bg/azkar_bg.png',
        googlePlay:
            'https://play.google.com/store/apps/details?id=com.prof_nagi.azkar',
        github: 'https://github.com/nagiElshershaby/azkar_prayers',
        lastUpdate: '2023',
        status: 'completed',
      ),
      // The Closet
      Project(
        name: 'The Closet',
        description:
            'The Closet is a personal concept project for a fashion app that helps users to organize their clothes and plan their outfits.',
        github: 'https://github.com/nagiElshershaby/clothes',
        backgroundUrl: 'assets/images/bg/closet_bg.png',
        lastUpdate: '2023',
        status: 'ongoing',
      ),
      // Ill-Vent
      Project(
        name: 'Ill-Vent',
        description:
            'Ill-Vent is a startup project that I worked on with a team of developers, designers, and business developers. It is a platform for emergency services that connects users with the nearest available ambulance, police, or fire department.',
        backgroundUrl: 'assets/images/bg/ill-vent_bg.png',
        github: 'https://github.com/nagiElshershaby/illVent',
        lastUpdate: '2023',
        status: 'completed',
      ),
      // Other Modules
      Project(
        name: 'Other Modules',
        description:
            'A list of other modules that I worked on, including a chat module, a localized version of Ahadith, and more...',
        github: 'https://github.com/nagiElshershaby?tab=repositories&q=ill&type=&language=&sort=',
        backgroundUrl: 'assets/images/bg/others_bg.png',
      ),
    ];

    PageController pageController = PageController();

    // Determine if the device is mobile by checking screen width.
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    if (isMobile) {
      // Mobile layout: Use a vertical Column with scaled-down widgets and paddings.
      return Scaffold(
        body: PageView.builder(
          controller: pageController,
          itemCount: projects.length,
          itemBuilder: (context, index) {
            final project = projects[index];
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header background image (occupies 30% of screen height)

                      Stack(
                        children: [
                          if (project.backgroundUrl != null)
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.3,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(project.backgroundUrl!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          // Project header: index, name and action icons
                          Column(
                            children: [
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                children: [
                                  const SizedBox(width: 16),
                                  Text(
                                    "0${index + 1}",
                                    style: const TextStyle(
                                      color: Color(0xff4F4F4F),
                                      fontSize: 24, // Reduced size for mobile
                                      fontFamily: 'Raleway',
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    project.name ?? "",
                                    style: const TextStyle(
                                      color: Color(0xff4F4F4F),
                                      fontSize: 32,
                                      fontFamily: 'Raleway',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                children: [
                                  const SizedBox(width: 16),
                                  if (project.googlePlay != null)
                                    GestureDetector(
                                      child: Image.asset(
                                        "assets/images/icons/google-play.png",
                                        height: 28,
                                        width: 28,
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse(project.googlePlay!));
                                      },
                                    ),
                                  const SizedBox(width: 8),
                                  if (project.appStore != null)
                                    GestureDetector(
                                      child: Image.asset(
                                        "assets/images/icons/app-store.png",
                                        height: 28,
                                        width: 28,
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse(project.appStore!));
                                      },
                                    ),
                                  if (project.github != null &&
                                      project.github!.isNotEmpty)
                                    IconButton(
                                      icon: const Icon(Icons.code),
                                      onPressed: () {
                                        launchUrl(Uri.parse(project.github!));
                                      },
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      // Project description
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          project.description ?? "",
                          style: const TextStyle(
                            color: Color(0xff4F4F4F),
                            fontSize: 14,
                            fontFamily: 'Raleway',
                          ),
                        ),
                      ),
                      const SizedBox(height: 70),
                    ],
                  ),
                ),
                // Navigation buttons for mobile
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back_ios_new,color: Colors.white,),
                            onPressed: () {
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
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_forward_ios, color: Colors.white,),
                            onPressed: () {
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      );
    } else {
      // Desktop / Web layout (original code)
      return Scaffold(
        body: PageView.builder(
          controller: pageController,
          itemCount: projects.length,
          itemBuilder: (context, index) {
            final project = projects[index];
            return RepaintBoundary(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
                child: Stack(
                  children: [
                    // Background image positioned on the left
                    if (project.backgroundUrl != null)
                      Positioned(
                        left: 0,
                        child: Container(
                          width: 1920,
                          height: 1080,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(project.backgroundUrl!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 960,
                          child: Stack(
                            children: [
                              // Vertical line for design
                              Positioned(
                                left: 200,
                                child: Container(
                                  color: const Color(0xff4F4F4F),
                                  width: 3,
                                  height: MediaQuery.of(context).size.height,
                                ),
                              ),
                              ListView(
                                children: [
                                  const SizedBox(height: 100),
                                  // Header section with index, name, and icons
                                  Container(
                                    height: 230,
                                    padding: const EdgeInsets.only(left: 200),
                                    child: Row(
                                      children: [
                                        Container(
                                          color: const Color(0xffFFFFFF),
                                          width: 5,
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  project.name ?? "",
                                                  style: const TextStyle(
                                                    color: Color(0xff4F4F4F),
                                                    fontSize: 48,
                                                    fontFamily: 'Raleway',
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                const SizedBox(width: 20),
                                                if (project.googlePlay != null)
                                                  GestureDetector(
                                                    child: Image.asset(
                                                      "assets/images/icons/google-play.png",
                                                      height: 28,
                                                      width: 28,
                                                    ),
                                                    onTap: () {
                                                      launchUrl(Uri.parse(
                                                          project.googlePlay!));
                                                    },
                                                  ),
                                                const SizedBox(width: 20),
                                                if (project.appStore != null)
                                                  GestureDetector(
                                                    child: Image.asset(
                                                      "assets/images/icons/app-store.png",
                                                      height: 28,
                                                      width: 28,
                                                    ),
                                                    onTap: () {
                                                      launchUrl(Uri.parse(
                                                          project.appStore!));
                                                    },
                                                  ),
                                                if (project.github != null &&
                                                    project.github!.isNotEmpty)
                                                  IconButton(
                                                    icon:
                                                        const Icon(Icons.code),
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          project.github!));
                                                    },
                                                  ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Description and features
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 207, right: 20),
                                    height: 440,
                                    child: ListView(

                                      children: [
                                        Text(
                                          project.description ?? "",
                                          style: const TextStyle(
                                            color: Color(0xff4F4F4F),
                                            fontSize: 16,
                                            fontFamily: 'Raleway',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 50),
                                  // Navigation arrows for desktop
                                  Container(
                                    height: 107,
                                    padding: const EdgeInsets.only(left: 200),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          color: const Color(0xffFFFFFF),
                                          height: 107,
                                          width: 5,
                                        ),
                                        Transform.rotate(
                                          angle: 3.14159, // 180° rotation
                                          child: GestureDetector(
                                            onTap: () {
                                              if (index == 0) {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const HomePage(),
                                                  ),
                                                );
                                              } else {
                                                pageController.previousPage(
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.easeInOut,
                                                );
                                              }
                                            },
                                            child: Image.asset(
                                              'assets/images/icons/Vector.png',
                                              width: 92,
                                              height: 46,
                                              cacheWidth: (220 * 0.7).toInt(),
                                              cacheHeight: (560 * 0.7).toInt(),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 100),
                                        GestureDetector(
                                          onTap: () {
                                            if (index == projects.length - 1) {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const HomePage(),
                                                ),
                                              );
                                            } else {
                                              pageController.nextPage(
                                                duration: const Duration(
                                                    milliseconds: 500),
                                                curve: Curves.easeInOut,
                                              );
                                            }
                                          },
                                          child: Image.asset(
                                            'assets/images/icons/Vector.png',
                                            width: 92,
                                            height: 46,
                                            cacheWidth: (220 * 0.7).toInt(),
                                            cacheHeight: (560 * 0.7).toInt(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
  }
}
