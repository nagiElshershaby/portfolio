import '../models/project.dart';

/// Static local data source — single source of truth for all project data.
class ProjectLocalDatasource {
  const ProjectLocalDatasource();

  List<Project> getProjects() {
    return const [
      Project(
        name: 'Magdou Health',
        type:
            'Developed at HarmoniQ Innovation Technology\nTrusted by tens of facilities and hundreds of technicians in the US',
        description:
            'Magdou Health app is a new innovative way to schedule on-demand radiology services for technologists. The app will be used by the health care facilities to order on-demand healthcare technologists to do their radiology exams. The technologist will be able to accept and complete the order from the app.',
        imagesUrls: [
          'assets/images/magdouHealth/magdouHealth_1.jpeg',
          'assets/images/magdouHealth/magdouHealth_2.jpeg',
          'assets/images/magdouHealth/magdouHealth_3.jpeg',
          'assets/images/magdouHealth/magdouHealth_4.jpeg',
          'assets/images/magdouHealth/magdouHealth_5.jpeg',
          'assets/images/magdouHealth/magdouHealth_6.jpeg',
          'assets/images/magdouHealth/magdouHealth_7.jpeg',
          'assets/images/magdouHealth/magdouHealth_8.jpg',
          'assets/images/magdouHealth/magdouHealth_9.jpg',
          'assets/images/magdouHealth/magdouHealth_10.jpg',
          'assets/images/magdouHealth/magdouHealth_11.jpg',
          'assets/images/magdouHealth/magdouHealth_12.jpg',
          'assets/images/magdouHealth/magdouHealth_13.jpeg',
        ],
        googlePlay:
            'https://play.google.com/store/apps/details?id=com.emam.magdouhealth',
        appStore: 'https://apps.apple.com/eg/app/magdou-health/id1627827916',
        lastUpdate: '2026',
        features: [
          'Secure login and access control',
          'Browse your orders',
          'Live tracking and Routing',
          'Submit and track leave requests',
          'Built on top of Odoo backend',
          'View your schedule',
          'Never miss an order: push notifications, SMS and calls',
        ],
        status: 'Live',
      ),
      Project(
        name: 'Crew Core',
        type:
            'Developed at HarmoniQ Innovation Technology\nHR management system for enterprises built on Odoo',
        description:
            'Crew Core is your all-in-one workplace management app designed to make HR and daily operations easier. With a simple and secure login, employees can clock in and out with location tracking, submit leave requests, log timesheets, manage expenses, and send approval requests—all in one place.',
        imagesUrls: [
          'assets/images/crewcore/crewcore_1.png',
          'assets/images/crewcore/crewcore_2.png',
          'assets/images/crewcore/crewcore_6.png',
          'assets/images/crewcore/crewcore_7.png',
          'assets/images/crewcore/crewcore_3.png',
          'assets/images/crewcore/crewcore_4.png',
          'assets/images/crewcore/crewcore_5.png',
        ],
        googlePlay:
            'https://play.google.com/store/apps/details?id=com.crew_core.app',
        appStore: 'https://apps.apple.com/eg/app/crew-core/id6751550943',
        lastUpdate: '2026',
        features: [
          'Secure login and access control',
          'Login with Google integration and Biometrics',
          'Clock-in/out with time and location records',
          'Submit and track leave requests',
          'Add and manage expenses with receipts, vendors, and tax details',
          'Create approval requests',
          'Log work hours and timesheets with dates, time, and attachments',
          'Track your monthly payroll',
        ],
        status: 'Live',
      ),
      Project(
        name: 'Roze Moon',
        type: 'Developed at Tuwaiq – E-commerce Application',
        description:
            '🌸 Welcome to Roze Moon – Your Gateway to Beautiful Flowers! 🌸\nDiscover a world of floral elegance with Roze Moon, your ultimate destination for ordering fresh flowers effortlessly. Whether it\'s a special occasion or just a gesture to brighten someone\'s day, we\'ve got you covered with stunning bouquets, tailored arrangements, and seamless ordering options.',
        backgroundUrl: 'assets/images/bg/rozemoon_bg.png',
        imagesUrls: [
          'assets/images/rozemoon/rozemoon_fg.png',
          'assets/images/rozemoon/rozemoon_fg1.png',
          'assets/images/rozemoon/rozemoon_fg2.png',
          'assets/images/rozemoon/rozemoon_fg3.png',
        ],
        googlePlay:
            'https://play.google.com/store/apps/details?id=com.rozemoon.app',
        appStore: 'https://apps.apple.com/eg/app/roze-moon/id6739536345',
        lastUpdate: '2025',
        features: [
          'Order flowers instantly or pre-order',
          'Cart management & checkout',
          'Multi-payment support (Amazon Payment, Wallet, etc.)',
          'Push notifications (Firebase, Twilio WhatsApp, Email)',
          'Multi-language support (easy_localization)',
          'User authentication with secure storage',
          'Maps integration for address selection',
          'Infinite scroll for product listing',
          'Skeleton loaders for better user experience',
          'In-app web views for additional content',
          'Image picking and file uploads',
          'Upgrades and version checking',
          'Secure local storage for sensitive data',
        ],
        status: 'Live - Ongoing',
      ),
      Project(
        name: 'Zahra Flowers',
        type: 'Freelance Project – Shopify Template Customization',
        description:
            'Freelance assignment to customize a Shopify-based FluxStore template by integrating GraphQL collections and refining the UI. The work involved a workaround to bypass access code verification due to a missing/incorrect access code, which ultimately made the app unsuitable for publication in the app stores.',
        backgroundUrl: 'assets/images/bg/zahra_bg.png',
        imagesUrls: [
          'assets/images/zahra/zahra.jpg',
          'assets/images/zahra/zahra2.jpg',
          'assets/images/zahra/zahra4.jpg',
          'assets/images/zahra/zahra6.jpg',
        ],
        features: [
          'Integrated GraphQL collections with Shopify',
          'Customized UI based on client requirements',
          'Implemented a workaround for access code verification',
          'Adapted FluxStore template for enhanced functionality',
        ],
        lastUpdate: '2024',
        status: 'Not Published',
        notes:
            'A friend commissioned this project. Initially, the assignment seemed straightforward—edit and complete a Shopify template app. However, I discovered that the provided access code was non-functional. I located the section of the code that verified the access code and implemented a workaround. Although this solution met the client\'s requirements, it was not a viable approach for store publication. Consequently, the app was not uploaded to any public stores, and the code remains private.',
      ),
      Project(
        name: 'أحاديث',
        type: 'Personal Project – Islamic Knowledge & Information retrieval System',
        description:
            'A comprehensive Android app that brings the treasure of Prophetic traditions (Ahadith) to your fingertips. With a massive collection of narrations sourced from HadeethEnc.com API, Ahadith offers an extensive range of categories, each filled with profound sayings. Delve into the world of Hadeeths, explore interpretations, word meanings, authenticity ratings, and references.',
        backgroundUrl: 'assets/images/bg/ahadith_bg.png',
        imagesUrls: [
          'assets/images/ahadith/ahadith.jpg',
          'assets/images/ahadith/ahadith1.jpg',
          'assets/images/ahadith/ahadith3.jpg',
          'assets/images/ahadith/ahadith5.jpg',
        ],
        googlePlay:
            'https://play.google.com/store/apps/details?id=com.prof_nagi.ahadith',
        github: 'https://github.com/nagiElshershaby/Ahadith',
        lastUpdate: '2024',
        features: [
          'Implements an Inverted Index IR algorithm for efficient search and ranking.',
          'Allows users to search Hadith by keywords.',
          'Ranks results based on relevance using TF-IDF.',
          'State management using Bloc & provider',
          'Network requests with Dio',
          'Offline support via flutter_offline',
          'Responsive UI with flutter_screenutil',
          'Local storage using Hive and Hive Flutter',
          'Custom fonts with Google Fonts',
          'Native splash screen configured via flutter_native_splash',
          'Local notifications using flutter_local_notifications',
          'Screenshot capture and sharing via screenshot & share_plus',
          'Dependency management with Provider',
        ],
        status: 'Live',
      ),
      Project(
        name: 'The Closet',
        type: 'Personal Project – The Concept That Turned Into Fits',
        description:
            'The Closet is a personal concept project for a fashion app that helps users to organize their clothes and plan their outfits.',
        github:
            'https://github.com/nagiElshershaby/Changing-Room/tree/master',
        backgroundUrl: 'assets/images/bg/closet_bg.png',
        imagesUrls: [
          'assets/images/the_closet/the_closet.jpg',
          'assets/images/the_closet/the_closet1.jpg',
          'assets/images/the_closet/the_closet2.jpg',
          'assets/images/the_closet/the_closet3.jpg',
        ],
        lastUpdate: '2023',
        features: [
          'Image selection using image_picker',
          'Camera integration for capturing photos',
          'Path management with path_provider',
          'Image cropping using image_cropper and native_image_cropper',
          'HTTP networking with the http package',
          'Screenshot functionality',
          'Permission handling via permission_handler',
          'Local storage with Hive and Hive Flutter',
          'State management using Provider',
          'Responsive UI with flutter_screenutil',
        ],
        status: 'Concept Only - Evolved into Fits App',
      ),
      Project(
        name: 'Fits',
        type: 'Personal Project – Wardrobe Management & Outfit Tracking',
        description:
            'A personal style archive that helps you stop forgetting outfits you love. '
            'Log every look with its original capture date, organize with tags, and rediscover '
            'past outfits through smart filters. The Studio feature lets you drag, layer, scale, '
            'and crop pieces from different photos onto a free-form canvas to prototype new '
            'combinations — all offline, with no account required.',
        imagesUrls: [
          'assets/images/fits/fits1.jpeg',
          'assets/images/fits/fits2.jpeg',
          'assets/images/fits/fits3.jpeg',
          'assets/images/fits/fits4.jpeg',
          'assets/images/fits/fits5.jpeg',
          'assets/images/fits/fits6.jpeg',
          'assets/images/fits/fits7.jpeg',
          'assets/images/fits/fits8.jpeg',
          'assets/images/fits/fits9.jpeg',
          'assets/images/fits/fits10.jpeg',
          'assets/images/fits/fits11.jpeg',
          'assets/images/fits/fits12.jpeg',
        ],
        googlePlay:
            'https://play.google.com/store/apps/details?id=com.prof_nagi.fits',
        github: 'https://github.com/nagiElshershaby/Fits',
        lastUpdate: '2025',
        features: [
          'Feature-First Clean Architecture with abstract repository interfaces for easy future sync (e.g. Google Drive)',
          'Mix & Match Studio: free-form canvas with draggable, scalable, rotatable, and croppable layers',
          'Drag-to-reorder layer panel with live square thumbnails showing z-order',
          'EXIF metadata extraction to preserve original photo capture dates on import',
          'Multi-image gallery import with per-image crop flow',
          'Season filters with Any Year toggle — matches date windows across your entire history',
          'On This Day filter — surfaces every outfit worn on today\'s date in any past year',
          'Bulk selection mode: long-press to select, then delete, tag, or send to Studio',
          'Interactive pinch-to-zoom in outfit detail view',
          'Dark mode with system-aware theming via Forui',
          'Local persistence using SQLite via sqflite',
          'State management with Provider & ChangeNotifier',
          'Native image cropping via image_cropper (UCrop on Android)',
          'R8 release optimisation with custom ProGuard rules',
        ],
        status: 'Live',
      ),
    ];
  }
}
