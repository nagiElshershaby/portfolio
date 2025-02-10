import 'package:NagiElshershaby/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/project/project.dart';

class ProjectsPage extends StatelessWidget {
  ProjectsPage({super.key});


  final PageController pageController = PageController();

  void _handleKeyEvent(KeyEvent event, BuildContext context, List<Project> projects, int index) {
    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
        // Move to the next page
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
      } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
        // Move to the previous page
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
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    Project rozeMoon = Project(
      name: "Roze Moon",
      type: "Developed at Tuwaiq – E-commerce Application",
      description:
          '🌸 Welcome to Roze Moon – Your Gateway to Beautiful Flowers! 🌸\nDiscover a world of floral elegance with Roze Moon, your ultimate destination for ordering fresh flowers effortlessly. Whether it’s a special occasion or just a gesture to brighten someone’s day, we’ve got you covered with stunning bouquets, tailored arrangements, and seamless ordering options.',
      backgroundUrl: 'assets/images/bg/rozemoon_bg.png',
      googlePlay:
          'https://play.google.com/store/apps/details?id=com.rozemoon.app',
      appStore: 'https://apps.apple.com/eg/app/roze-moon/id6739536345',
      iconUrl:
          'https://play-lh.googleusercontent.com/eVZIFAMQazrVN2VybzAEgHOd8FJKjqiekLv26u7PvFBpQcK5TrVsJNXP97dJ8s4wDByr=w240-h480-rw',
      lastUpdate: '2025',
      imagesUrls: [
        "assets/screenshots/home.png",
        "assets/screenshots/cart.png",
        "assets/screenshots/orders.png"
      ],
      features: [
        "Order flowers instantly or pre-order",
        "Cart management & checkout",
        "Multi-payment support (Amazon Payment, Wallet, etc.)",
        "Push notifications (Firebase, Twilio WhatsApp, Email)",
        "Multi-language support (easy_localization)",
        "User authentication with secure storage",
        "Maps integration for address selection",
        "Infinite scroll for product listing",
        "Skeleton loaders for better user experience",
        "In-app web views for additional content",
        "Image picking and file uploads",
        "Upgrades and version checking",
        "Secure local storage for sensitive data"
      ],
      pubspec: [
        "flutter_screenutil",
        "auto_route",
        "bloc",
        "cached_network_image",
        "carousel_slider",
        "easy_localization",
        "easy_stepper",
        "equatable",
        "flutter",
        "flutter_bloc",
        "flutter_layout_grid",
        "flutter_localizations",
        "flutter_otp_text_field",
        "flutter_rating_bar",
        "flutter_secure_storage",
        "flutter_svg",
        "font_awesome_flutter",
        "formz",
        "get_it",
        "google_fonts",
        "iconsax_plus",
        "infinite_scroll_pagination",
        "intl",
        "like_button",
        "package_info_plus",
        "photo_view",
        "shared_preferences",
        "url_launcher",
        "skeletonizer",
        "file_picker",
        "phone_form_field",
        "firebase_messaging",
        "change_app_package_name",
        "firebase_core",
        "logger",
        "flutter_native_splash",
        "flutter_staggered_grid_view",
        "timeago",
        "connectivity_plus",
        "flutter_map",
        "latlong2",
        "geolocator",
        "path_provider",
        "flutter_cache_manager",
        "json_annotation",
        "mockito",
        "bloc_test",
        "lyrebird",
        "flutter_inappwebview",
        "http",
        "in_app_update",
        "arb_generator",
        "image_picker",
        "upgrader"
      ],
      status: "Live - Ongoing",
    );
    Project zahraFlowers = Project(
        name: "Zahra Flowers",
        type: "Freelance Project – Shopify Template Customization",
        description:
            "Freelance assignment to customize a Shopify-based FluxStore template by integrating GraphQL collections and refining the UI. The work involved a workaround to bypass access code verification due to a missing/incorrect access code, which ultimately made the app unsuitable for publication in the app stores.",
        backgroundUrl: 'assets/images/bg/zahra_bg.png',
        features: [
          "Integrated GraphQL collections with Shopify",
          "Customized UI based on client requirements",
          "Implemented a workaround for access code verification",
          "Adapted FluxStore template for enhanced functionality"
        ],
        lastUpdate: "2024",
        status: "Not Published",
        notes:
            "A friend commissioned this project. Initially, the assignment seemed straightforward—edit and complete a Shopify template app. However, I discovered that the provided access code was non-functional. I located the section of the code that verified the access code and implemented a workaround. Although this solution met the client's requirements, it was not a viable approach for store publication. Consequently, the app was not uploaded to any public stores, and the code remains private.");
    Project ahadithApp = Project(
        name: 'أحاديث',
        type:
            "Personal Project – Islamic Knowledge & Information retrieval System",
        description:
            'A comprehensive Android app that brings the treasure of Prophetic traditions (Ahadith) to your fingertips. With a massive collection of narrations sourced from HadeethEnc.com API, Ahadith offers an extensive range of categories, each filled with profound sayings. Delve into the world of Hadeeths, explore interpretations, word meanings, authenticity ratings, and references.',
        backgroundUrl: 'assets/images/bg/ahadith_bg.png',
        googlePlay:
            'https://play.google.com/store/apps/details?id=com.prof_nagi.ahadith',
        github: 'https://github.com/nagiElshershaby/Ahadith',
        iconUrl:
            'https://play-lh.googleusercontent.com/u-GuFuhZtA1T2Gvsto2H5ahn4g6t2zCGrUBeb3Gs3sFWIbuRqmDPv_j3Y9tMeCPPqw=w240-h480-rw',
        lastUpdate: '2024',
        features: [
          "Implements an Inverted Index IR algorithm for efficient search and ranking.",
          "Allows users to search Hadith by keywords.",
          "Ranks results based on relevance using TF-IDF."
              "State management using Bloc & provider",
          "Network requests with Dio",
          "Offline support via flutter_offline",
          "Responsive UI with flutter_screenutil",
          "Local storage using Hive and Hive Flutter",
          "Custom fonts with Google Fonts",
          "Native splash screen configured via flutter_native_splash",
          "Local notifications using flutter_local_notifications",
          "Screenshot capture and sharing via screenshot & share_plus",
          "Dependency management with Provider"
        ],
        pubspec: [
          // Dependencies
          "flutter",
          "cupertino_icons",
          "bloc",
          "flutter_bloc",
          "dio",
          "flutter_offline",
          "flutter_screenutil",
          "provider",
          "hive",
          "hive_flutter",
          "google_fonts",
          "screenshot",
          "share_plus",
          "path_provider",
          "hijri",
          "flutter_translate",
          "flutter_native_splash",
          "flutter_native_timezone_updated_gradle",
          "flutter_local_notifications",
          // Dev Dependencies
          "flutter_test",
          "hive_generator",
          "build_runner",
          "flutter_lints"
        ],
        status: "Live" // Or "In Development" if applicable
        );
    Project lamha = Project(
        name: 'لمحــة',
        type: "Freelance Project – Islamic Knowledge & Faith App",
        iconUrl: "https://play-lh.googleusercontent.com/6KWtaVHL5UxWNilAnghox_K5blFgF7vH7Lt5_SRPlelNSWmQzRefgFlbAwkzNHM-vQ=w240-h480",
        description:
            'A daily dose of knowledge and faith.\n Lamha is a simple freelancing project that I developed for a client, it contains a collection of scientific miracles in many fields, With a Quranic verse or a noble Prophet’s hadith.',
        backgroundUrl: 'assets/images/bg/lamha_bg.png',
        googlePlay:
            'https://play.google.com/store/apps/details?id=com.prof_nagi.lam7ah',
        github:
            'https://github.com/nagiElshershaby/mogezat_app/tree/master', // Private project; source code not publicly available
        features: [
          "Local notifications with flutter_local_notifications",
          "State management using Provider",
          "Local storage with Hive & Hive Flutter",
          "Responsive UI with flutter_screenutil",
          "Screenshot capture & sharing using esys_flutter_share_plus",
          "Timezone handling with flutter_native_timezone_updated_gradle",
          "Custom app icons and native splash screen configuration"
        ],
        pubspec: [
          // Dependencies
          "flutter",
          "cupertino_icons",
          "flutter_local_notifications",
          "provider",
          "hive_flutter",
          "hive",
          "screenshot",
          "path_provider",
          "flutter_native_timezone_updated_gradle",
          "flutter_screenutil",
          "esys_flutter_share_plus",
          // Dev Dependencies
          "flutter_test",
          "flutter_native_splash",
          "flutter_launcher_icons",
          "flutter_lints"
        ],
        lastUpdate: "2023",
        status: "Live");
    Project azkarPrayers = Project(
      name: "أذكار",
      type: "Freelance Project – Islamic Remembrance & Supplication App",
      iconUrl: "https://play-lh.googleusercontent.com/56RUS8o5dkktygR7x_1fY2giZ8z_S9Y-1qIg9E3Rc_H6lE_FoENAFzJ99ZpjWhed1x0=w240-h480",
      description:
          'Make yourself a daily remembrance of what our Master Muhammad, may God bless him and grant him peace, recommended\nAzkar is a very simple app that meant a lot to its users\nIt contains a collection of Azkar that the user can read, and it also contains a counter for each Azkar to help the user to keep track of the number of times he/she read it.',
      backgroundUrl: 'assets/images/bg/azkar_bg.png',
      googlePlay:
          'https://play.google.com/store/apps/details?id=com.prof_nagi.azkar',
      github: 'https://github.com/nagiElshershaby/azkar_prayers',
      lastUpdate: '2023',
      status: 'Live',
      // Private project; code not publicly available
      features: [
        "Animated counter using animated_flip_counter",
        "Local storage with Hive and Hive Flutter",
        "State management via Provider",
        "Native splash screen configuration using flutter_native_splash",
        "App renaming support with the rename package"
      ],
      pubspec: [
        // Dependencies
        "flutter",
        "cupertino_icons",
        "animated_flip_counter",
        "hive",
        "hive_flutter",
        "provider",
        "flutter_native_splash",
        "rename",
        // Dev Dependencies
        "flutter_launcher_icons",
        "flutter_test",
        "flutter_lints"
      ],
    );
    Project changingRoom = Project(
        name: 'The Closet',
        type: "Personal Project – Virtual Dressing Room & Outfit Visualization",
        description:
            'The Closet is a personal concept project for a fashion app that helps users to organize their clothes and plan their outfits.',
        github: 'https://github.com/nagiElshershaby/Changing-Room/tree/master',
        backgroundUrl: 'assets/images/bg/closet_bg.png',
        lastUpdate: '2023',
        features: [
          "Image selection using image_picker",
          "Camera integration for capturing photos",
          "Path management with path_provider",
          "Image cropping using image_cropper and native_image_cropper",
          "HTTP networking with the http package",
          "Screenshot functionality",
          "Permission handling via permission_handler",
          "Local storage with Hive and Hive Flutter",
          "State management using Provider",
          "Responsive UI with flutter_screenutil"
        ],
        pubspec: [
          // Dependencies
          "flutter",
          "cupertino_icons",
          "image_picker",
          "camera",
          "path_provider",
          "image_cropper",
          "native_image_cropper",
          "http",
          "screenshot",
          "permission_handler",
          "hive",
          "hive_flutter",
          "provider",
          "flutter_screenutil",
          // Dev Dependencies
          "flutter_test",
          "flutter_lints"
        ],
        status: "In Development" // Change to "Live" if published
        );
    Project illVent = Project(
      name: 'Ill-Vent',
      type: "Startup Project – Emergency Services Platform",
      description:
          'Ill-Vent is a startup project that I worked on with a team of developers, designers, and business developers. It is a platform for emergency services that connects users with the nearest available ambulance, police, or fire department.',
      backgroundUrl: 'assets/images/bg/ill-vent_bg.png',
      github: 'https://github.com/nagiElshershaby/illVent',
      lastUpdate: '2023',
      status: 'completed',
      features: [
        "Animated splash screen using animated_splash_screen",
        "Image selection via image_picker",
        "Local file system access with path_provider",
        "Custom curved navigation bar using curved_navigation_bar",
        "QR code generation with qr_flutter",
        "Location lookup via geocoding",
      ],
      pubspec: [
        // Dependencies
        "flutter",
        "animated_splash_screen",
        "image_picker",
        "path_provider",
        "curved_navigation_bar",
        "cupertino_icons",
        "qr_flutter",
        "geocoding",
        // Dev Dependencies
        "flutter_test",
        "flutter_lints"
      ], // Update as needed
    );
    Project otherModules = Project(
        name: "Other Modules",
        type: "Various Mini Projects – Learning & Experimentation in Flutter",
        description:
            "A collection of various Flutter modules, including games, chat apps, authentication, notifications, and more.",
        backgroundUrl: 'assets/images/bg/others_bg.png',
        github: "https://github.com/nagiElshershaby", // Root GitHub link
        features: [
          "Snake game built using Flutter and game loops",
          "A simple notes app with CRUD functionality",
          "Image cropping functionality for Flutter apps",
          "Local notifications with scheduled reminders",
          "Expense tracking with a money management module",
          "Real-time chat functionality using Firebase and WebSockets",
          "RxDart-based state management experiments",
          "Cat explorer app fetching data from an API",
          "Location tracking and dynamic theme toggling",
          "Phone authentication using Firebase"
        ],
        pubspec: [
          // Core Flutter dependencies
          "flutter",
          "cupertino_icons",

          // Game development (for snake_game_using_flutter)
          "flame",
          // Game engine for Flutter
          "flutter_bloc",
          // Possible state management for game logic

          // NotesApp (basic CRUD storage)
          // Money tracking (money_spent)
          "hive",
          "hive_flutter",
          "path_provider",

          // Image cropping module (Image_cropper_example)
          "image_cropper",
          "image_picker",

          // Local notifications module
          "flutter_local_notifications",

          // Chat app (flutter_chat_app)
          "firebase_core",
          "firebase_auth",
          "cloud_firestore",
          "cached_network_image",

          // RxDart experiments (Rx_dart_test)
          "rxdart",
          "provider",

          // Cat explorer app (cats_explorer_app)
          "http",

          // Location tracking & theme toggling (Location-Tracker-and-Theme-Toggle-Flutter-App)
          "location",
          "geolocator",
          "shared_preferences",

          // Phone authentication (Flutter-Phone-Authentication-Module)

          // Dev dependencies
          "flutter_test",
          "flutter_lints"
        ],
        lastUpdate: "2022", // Update with the actual last update date
        status: "In Development");

    List<Project> projects = [
      rozeMoon,
      zahraFlowers,
      ahadithApp,
      lamha,
      azkarPrayers,
      changingRoom,
      illVent,
      otherModules,
    ];


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
                if (project.backgroundUrl != null)
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(project.backgroundUrl!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white.withOpacity(0.8),
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      // Project index, name, and icons
                      Row(
                        children: [
                          if (project.iconUrl == null)
                            const SizedBox(width: 16),
                          project.iconUrl != null
                              ? Image.network(
                                  project.iconUrl!,
                                  height: 48,
                                  width: 48,
                                )
                              : Text(
                                  "0${index + 1}",
                                  style: const TextStyle(
                                    color: Color(0xff4F4F4F),
                                    fontSize: 24, // Reduced size for mobile
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                          if (project.iconUrl == null) const SizedBox(width: 8),
                          Text(
                            project.name ?? "",
                            style: const TextStyle(
                              color: Color(0xff4F4F4F),
                              fontSize: 32,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 48, right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // type
                            Text(
                              project.type ?? "",
                              style: const TextStyle(
                                color: Color(0xff4F4F4F),
                                fontSize: 16,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            // Status and last update
                            Text(
                              "${project.status ?? ""} - Last Update: ${project.lastUpdate ?? ""}",
                              style: const TextStyle(
                                color: Color(0xff4F4F4F),
                                fontSize: 16,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w100,
                              ),
                            ),

                            const SizedBox(height: 16),
                            // Project description
                            Text(
                              project.description ?? "",
                              style: const TextStyle(
                                color: Color(0xff4F4F4F),
                                fontSize: 14,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 16),
                            // Features title
                            if (project.features != null &&
                                project.features!.isNotEmpty)
                              const Text(
                                "Features:",
                                style: TextStyle(
                                  color: Color(0xff4F4F4F),
                                  fontSize: 16,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            // Features list
                            if (project.features != null &&
                                project.features!.isNotEmpty)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  for (var feature in project.features!)
                                    Text(
                                      '• $feature',
                                      style: const TextStyle(
                                        color: Color(0xff4F4F4F),
                                        fontSize: 14,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                ],
                              ),
                            if (project.features != null &&
                                project.features!.isNotEmpty)
                              const SizedBox(
                                height: 16,
                              ),
                            // Notes title
                            if (project.notes != null &&
                                project.notes!.isNotEmpty)
                              const Text(
                                "Notes:",
                                style: TextStyle(
                                  color: Color(0xff4F4F4F),
                                  fontSize: 16,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            // Notes content
                            if (project.notes != null &&
                                project.notes!.isNotEmpty)
                              Text(
                                project.notes ?? "",
                                style: const TextStyle(
                                  color: Color(0xff4F4F4F),
                                  fontSize: 14,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            // Pubspec title
                            if (project.pubspec != null &&
                                project.pubspec!.isNotEmpty)
                              const Text(
                                "Pubspec Dependencies:",
                                style: TextStyle(
                                  color: Color(0xff4F4F4F),
                                  fontSize: 16,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            if (project.pubspec != null &&
                                project.pubspec!.isNotEmpty)
                              const SizedBox(
                                height: 8,
                              ),
                            // Pubspec tags
                            if (project.pubspec != null &&
                                project.pubspec!.isNotEmpty)
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: [
                                  for (var dependency in project.pubspec!)
                                    Chip(
                                      label: Text(
                                        dependency,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      elevation: 2,
                                      shadowColor: Colors.black,
                                    ),
                                ],
                              ),
                          ],
                        ),
                      ),

                      // Navigation arrows for mobile
                      SizedBox(
                        height: 80,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(width: 16),
                            Transform.rotate(
                              angle: 3.14159, // 180° rotation
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
                                  width: 92,
                                  height: 46,
                                  cacheWidth: (220 * 0.7).toInt(),
                                  cacheHeight: (560 * 0.7).toInt(),
                                ),
                              ),
                            ),
                            // take the remaining space
                            const Spacer(),

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
                                cacheWidth: (220 * 0.7).toInt(),
                                cacheHeight: (560 * 0.7).toInt(),
                              ),
                            ),
                            const SizedBox(width: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      );
    } else {
      // Desktop / Web layout (original code)
      final double leftPadding = 0.1041 * MediaQuery.of(context).size.width;
      return Scaffold(
        body: KeyboardListener(
          focusNode: FocusNode()..requestFocus(),
          onKeyEvent: (event) {
            _handleKeyEvent(event, context, projects, pageController.page!.round());
          },
          child: PageView.builder(
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
                            height: MediaQuery.of(context).size.height,
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
                                    // Header section with index, name, and icons
                                    Container(
                                      height: 230,
                                      padding:  EdgeInsets.only(left: leftPadding),
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
                                              project.iconUrl==null?Text(
                                                "0${index + 1}",
                                                style: const TextStyle(
                                                  color: Color(0xff4F4F4F),
                                                  fontSize: 32,
                                                  fontFamily: 'Raleway',
                                                  fontWeight: FontWeight.w100,
                                                ),
                                              ):Image.network(
                                                project.iconUrl!,
                                                height: 48,
                                                width: 48,
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
                                              // type
                                              Text(
                                                project.type ?? "",
                                                style: const TextStyle(
                                                  color: Color(0xff4F4F4F),
                                                  fontSize: 20,
                                                  fontFamily: 'Raleway',
                                                  // fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              // Status and last update
                                              Text(
                                                "${project.status ?? ""} - Last Update: ${project.lastUpdate ?? ""}",
                                                style: const TextStyle(
                                                  color: Color(0xff4F4F4F),
                                                  fontSize: 20,
                                                  fontFamily: 'Raleway',
                                                  fontWeight: FontWeight.w100,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Description and features
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: leftPadding + 7, right: 20),
                                      // height: 440,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          // Project description
                                          Text(
                                            project.description ?? "",
                                            style: const TextStyle(
                                              color: Color(0xff4F4F4F),
                                              fontSize: 16,
                                              fontFamily: 'Raleway',
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                          // Features title
                                          if (project.features != null &&
                                              project.features!.isNotEmpty)
                                            const Text(
                                              "Features:",
                                              style: TextStyle(
                                                color: Color(0xff4F4F4F),
                                                fontSize: 26,
                                                fontFamily: 'Raleway',
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          // Features list
                                          if (project.features != null &&
                                              project.features!.isNotEmpty)
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                for (var feature in project.features!)
                                                  Text(
                                                    '• $feature',
                                                    style: const TextStyle(
                                                      color: Color(0xff4F4F4F),
                                                      fontSize: 16,
                                                      fontFamily: 'Raleway',
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          if (project.features != null &&
                                              project.features!.isNotEmpty)
                                            const SizedBox(
                                              height: 16,
                                            ),
                                          // Notes title
                                          if (project.notes != null &&
                                              project.notes!.isNotEmpty)
                                            const Text(
                                              "Notes:",
                                              style: TextStyle(
                                                color: Color(0xff4F4F4F),
                                                fontSize: 26,
                                                fontFamily: 'Raleway',
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          // Notes content
                                          if (project.notes != null &&
                                              project.notes!.isNotEmpty)
                                            Text(
                                              project.notes ?? "",
                                              style: const TextStyle(
                                                color: Color(0xff4F4F4F),
                                                fontSize: 16,
                                                fontFamily: 'Raleway',
                                              ),
                                            ),
                                          // Pubspec title
                                          if (project.pubspec != null &&
                                              project.pubspec!.isNotEmpty)
                                            const Text(
                                              "Pubspec Dependencies:",
                                              style: TextStyle(
                                                color: Color(0xff4F4F4F),
                                                fontSize: 26,
                                                fontFamily: 'Raleway',
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          if (project.pubspec != null &&
                                              project.pubspec!.isNotEmpty)
                                            const SizedBox(
                                              height: 8,
                                            ),
                                          // Pubspec tags
                                          if (project.pubspec != null &&
                                              project.pubspec!.isNotEmpty)
                                            Wrap(
                                              spacing: 8,
                                              runSpacing: 8,
                                              children: [
                                                for (var dependency in project.pubspec!)
                                                  Chip(
                                                    label: Text(
                                                      dependency,
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        fontFamily: 'Raleway',
                                                      ),
                                                    ),
                                                    elevation: 2,
                                                    shadowColor: Colors.black,
                                                  ),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 50),
                                    // Navigation arrows for desktop
                                    Container(
                                      height: 107,
                                      padding: EdgeInsets.only(left: leftPadding),
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
        ),
      );
    }
  }
}
