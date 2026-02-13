import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/data/project/project.dart';
import 'package:portfolio/ui/pages/home_page.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  late final PageController _pageController;
  int _currentPage = 0;

  // Precache all project images when the page is first built
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });

    // Precache images after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _precacheProjectImages(context);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _precacheProjectImages(BuildContext context) {
    final projects = _buildProjectList();
    for (final project in projects) {
      // Precache background image
      if (project.backgroundUrl != null) {
        precacheImage(AssetImage(project.backgroundUrl!), context);
      }
      // Precache all screenshot images
      if (project.imagesUrls != null) {
        for (final url in project.imagesUrls!) {
          precacheImage(AssetImage(url), context);
        }
      }
    }
  }

  void _handleKeyEvent(KeyEvent event, BuildContext context, List<Project> projects) {
    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
        if (_currentPage == projects.length - 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomePage()),
          );
        } else {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
        if (_currentPage == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const HomePage()),
          );
        } else {
          _pageController.previousPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final projects = _buildProjectList();

    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final bool isMobile = screenWidth < 600;
        final bool isTablet = screenWidth >= 600 && screenWidth < 900;
        final bool isDesktop = screenWidth >= 900;

        return Scaffold(
          body: KeyboardListener(
            focusNode: FocusNode()..requestFocus(),
            onKeyEvent: (event) => _handleKeyEvent(event, context, projects),
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    final project = projects[index];
                    return _ProjectPage(
                      project: project,
                      index: index,
                      totalProjects: projects.length,
                      isMobile: isMobile,
                      isTablet: isTablet,
                      isDesktop: isDesktop,
                      screenWidth: screenWidth,
                      pageController: _pageController,
                    );
                  },
                ),
                // Desktop page indicator
                if (isDesktop)
                  Positioned(
                    bottom: 32,
                    right: 32,
                    child: _PageIndicator(
                      currentPage: _currentPage,
                      totalPages: projects.length,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  // -------------------------------------------------------------------------
  //  Project data (unchanged, only kept active projects)
  // -------------------------------------------------------------------------
  List<Project> _buildProjectList() {
    Project magdouHealth = Project(
      name: 'Magdou Health',
      type: "Developed at HarmoniQ Innovation Technology\nTrusted by tens of facilities and hundreds of technetians in the US",
      description: 'Magdou Health app is a new innovative way to schedule on-demand radiology services for technologists. The app will be used by the health care facilities to order on-demand healthcare technologists to do their radiology exams. The technologist will be able to accept and complete the order from the app.',
      imagesUrls: [
        "assets/images/magdouHealth/magdouHealth_1.jpeg",
        "assets/images/magdouHealth/magdouHealth_2.jpeg",
        "assets/images/magdouHealth/magdouHealth_3.jpeg",
        "assets/images/magdouHealth/magdouHealth_4.jpeg",
        "assets/images/magdouHealth/magdouHealth_5.jpeg",
        "assets/images/magdouHealth/magdouHealth_6.jpeg",
        "assets/images/magdouHealth/magdouHealth_7.jpeg",
        "assets/images/magdouHealth/magdouHealth_8.jpg",
        "assets/images/magdouHealth/magdouHealth_9.jpg",
        "assets/images/magdouHealth/magdouHealth_10.jpg",
        "assets/images/magdouHealth/magdouHealth_11.jpg",
        "assets/images/magdouHealth/magdouHealth_12.jpg",
        "assets/images/magdouHealth/magdouHealth_13.jpeg",
      ],
      googlePlay: 'https://play.google.com/store/apps/details?id=com.emam.magdouhealth',
      appStore: "https://apps.apple.com/eg/app/magdou-health/id1627827916",
      lastUpdate: '2026',
      features: [
        "Secure login and access control",
        "Browse your orders",
        "Live tracking and Routing",
        "Submit and track leave requests",
        "Built on top of Odoo backend",
        "View your schedule",
        "Never miss an order: push notifications, SMS and calls",
      ],
      status: "Live",
    );

    Project crewCoreApp = Project(
      name: 'Crew Core',
      type: "Developed at HarmoniQ Innovation Technology\nHR management system for enterprises built on Odoo",
      description: 'Crew Core is your all-in-one workplace management app designed to make HR and daily operations easier. With a simple and secure login, employees can clock in and out with location tracking, submit leave requests, log timesheets, manage expenses, and send approval requests—all in one place.',
      imagesUrls: [
        "assets/images/crewcore/crewcore_1.png",
        "assets/images/crewcore/crewcore_2.png",
        "assets/images/crewcore/crewcore_6.png",
        "assets/images/crewcore/crewcore_7.png",
        "assets/images/crewcore/crewcore_3.png",
        "assets/images/crewcore/crewcore_4.png",
        "assets/images/crewcore/crewcore_5.png",
      ],
      googlePlay: 'https://play.google.com/store/apps/details?id=com.crew_core.app',
      appStore: "https://apps.apple.com/eg/app/crew-core/id6751550943",
      lastUpdate: '2026',
      features: [
        "Secure login and access control",
        "Login with Google integration and Biometrics",
        "Clock-in/out with time and location records",
        "Submit and track leave requests",
        "Add and manage expenses with receipts, vendors, and tax details",
        "Create approval requests",
        "Log work hours and timesheets with dates, time, and attachments",
        "Track your monthly payroll",
      ],
      status: "Live",
    );

    Project ahadithApp = Project(
      name: 'أحاديث',
      type: "Personal Project – Islamic Knowledge & Information retrieval System",
      description: 'A comprehensive Android app that brings the treasure of Prophetic traditions (Ahadith) to your fingertips. With a massive collection of narrations sourced from HadeethEnc.com API, Ahadith offers an extensive range of categories, each filled with profound sayings. Delve into the world of Hadeeths, explore interpretations, word meanings, authenticity ratings, and references.',
      backgroundUrl: 'assets/images/bg/ahadith_bg.png',
      imagesUrls: [
        "assets/images/ahadith/ahadith.jpg",
        "assets/images/ahadith/ahadith1.jpg",
        "assets/images/ahadith/ahadith3.jpg",
        "assets/images/ahadith/ahadith5.jpg",
      ],
      googlePlay: 'https://play.google.com/store/apps/details?id=com.prof_nagi.ahadith',
      github: 'https://github.com/nagiElshershaby/Ahadith',
      lastUpdate: '2024',
      features: [
        "Implements an Inverted Index IR algorithm for efficient search and ranking.",
        "Allows users to search Hadith by keywords.",
        "Ranks results based on relevance using TF-IDF.",
        "State management using Bloc & provider",
        "Network requests with Dio",
        "Offline support via flutter_offline",
        "Responsive UI with flutter_screenutil",
        "Local storage using Hive and Hive Flutter",
        "Custom fonts with Google Fonts",
        "Native splash screen configured via flutter_native_splash",
        "Local notifications using flutter_local_notifications",
        "Screenshot capture and sharing via screenshot & share_plus",
        "Dependency management with Provider",
      ],
      status: "Live",
    );

    Project rozeMoon = Project(
      name: "Roze Moon",
      type: "Developed at Tuwaiq – E-commerce Application",
      description: '🌸 Welcome to Roze Moon – Your Gateway to Beautiful Flowers! 🌸\nDiscover a world of floral elegance with Roze Moon, your ultimate destination for ordering fresh flowers effortlessly. Whether it’s a special occasion or just a gesture to brighten someone’s day, we’ve got you covered with stunning bouquets, tailored arrangements, and seamless ordering options.',
      backgroundUrl: 'assets/images/bg/rozemoon_bg.png',
      imagesUrls: [
        "assets/images/rozemoon/rozemoon_fg.png",
        "assets/images/rozemoon/rozemoon_fg1.png",
        "assets/images/rozemoon/rozemoon_fg2.png",
        "assets/images/rozemoon/rozemoon_fg3.png",
      ],
      googlePlay: 'https://play.google.com/store/apps/details?id=com.rozemoon.app',
      appStore: 'https://apps.apple.com/eg/app/roze-moon/id6739536345',
      lastUpdate: '2025',
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
        "Secure local storage for sensitive data",
      ],
      status: "Live - Ongoing",
    );

    Project changingRoom = Project(
      name: 'The Closet',
      type: "Personal Project – Virtual Dressing Room & Outfit Visualization",
      description: 'The Closet is a personal concept project for a fashion app that helps users to organize their clothes and plan their outfits.',
      github: 'https://github.com/nagiElshershaby/Changing-Room/tree/master',
      backgroundUrl: 'assets/images/bg/closet_bg.png',
      imagesUrls: [
        "assets/images/the_closet/the_closet.jpg",
        "assets/images/the_closet/the_closet1.jpg",
        "assets/images/the_closet/the_closet2.jpg",
        "assets/images/the_closet/the_closet3.jpg",
      ],
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
        "Responsive UI with flutter_screenutil",
      ],
      status: "In Development",
    );

    Project zahraFlowers = Project(
      name: "Zahra Flowers",
      type: "Freelance Project – Shopify Template Customization",
      description: "Freelance assignment to customize a Shopify-based FluxStore template by integrating GraphQL collections and refining the UI. The work involved a workaround to bypass access code verification due to a missing/incorrect access code, which ultimately made the app unsuitable for publication in the app stores.",
      backgroundUrl: 'assets/images/bg/zahra_bg.png',
      imagesUrls: [
        "assets/images/zahra/zahra.jpg",
        "assets/images/zahra/zahra2.jpg",
        "assets/images/zahra/zahra4.jpg",
        "assets/images/zahra/zahra6.jpg",
      ],
      features: [
        "Integrated GraphQL collections with Shopify",
        "Customized UI based on client requirements",
        "Implemented a workaround for access code verification",
        "Adapted FluxStore template for enhanced functionality",
      ],
      lastUpdate: "2024",
      status: "Not Published",
      notes: "A friend commissioned this project. Initially, the assignment seemed straightforward—edit and complete a Shopify template app. However, I discovered that the provided access code was non-functional. I located the section of the code that verified the access code and implemented a workaround. Although this solution met the client's requirements, it was not a viable approach for store publication. Consequently, the app was not uploaded to any public stores, and the code remains private.",
    );

    return [
      magdouHealth,
      crewCoreApp,
      rozeMoon,
      zahraFlowers,
      ahadithApp,
      changingRoom,
    ];
  }
}

// -------------------------------------------------------------------------
//  Individual project page – matches Home Page styling exactly
// -------------------------------------------------------------------------
class _ProjectPage extends StatelessWidget {
  final Project project;
  final int index;
  final int totalProjects;
  final bool isMobile;
  final bool isTablet;
  final bool isDesktop;
  final double screenWidth;
  final PageController pageController;

  const _ProjectPage({
    required this.project,
    required this.index,
    required this.totalProjects,
    required this.isMobile,
    required this.isTablet,
    required this.isDesktop,
    required this.screenWidth,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    // Same dynamic padding as Home Page
    final horizontalPadding = isMobile ? 24.0 : (isTablet ? 40.0 : 64.0);
    final bodyFontSize = isMobile ? 14.0 : 16.0;
    final sectionTitleSize = isMobile ? 22.0 : 28.0;

    return Stack(
      children: [
        // Background image with overlay
        if (project.backgroundUrl != null)
          Positioned.fill(
            child: Image.asset(
              project.backgroundUrl!,
              fit: BoxFit.cover,
            ),
          ),
        // Semi-transparent overlay – same as Home Page (surface with 0.92 opacity)
        Container(
          color: colorScheme.surface.withValues(alpha:0.92),
        ),
        // Main scrollable content
        SafeArea(
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: 32,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ----- PROJECT HEADER (index badge, name, store buttons) -----
                  _ProjectHeader(
                    project: project,
                    index: index,
                    isMobile: isMobile,
                  ),
                  const SizedBox(height: 32),

                  // ----- IMAGE GALLERY (with precaching and placeholder) -----
                  if (project.imagesUrls != null && project.imagesUrls!.isNotEmpty)
                    _ImageGallery(
                      imageUrls: project.imagesUrls!,
                      isMobile: isMobile,
                    ),
                  const SizedBox(height: 32),

                  // ----- DESCRIPTION CARD (exact same style as Home Page's About card) -----
                  _SectionCard(
                    title: 'Description',
                    child: Text(
                      project.description ?? '',
                      style: GoogleFonts.raleway(
                        fontSize: bodyFontSize,
                        height: 1.6,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // ----- FEATURES (chips, using primary color – matches Home Page skill chips) -----
                  if (project.features != null && project.features!.isNotEmpty) ...[
                    _SectionTitle('Key Features', fontSize: sectionTitleSize),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: project.features!
                          .map((feature) => _FeatureChip(label: feature))
                          .toList(),
                    ),
                    const SizedBox(height: 24),
                  ],

                  // ----- DEPENDENCIES / PUBSPEC (outlined chips – matches Home Page language chips) -----
                  if (project.pubspec != null && project.pubspec!.isNotEmpty) ...[
                    _SectionTitle('Dependencies', fontSize: sectionTitleSize),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: project.pubspec!
                          .map((dep) => _DependencyChip(label: dep))
                          .toList(),
                    ),
                    const SizedBox(height: 24),
                  ],

                  // ----- NOTES (styled like Home Page's InfoCard) -----
                  if (project.notes != null && project.notes!.isNotEmpty) ...[
                    _SectionTitle('Notes', fontSize: sectionTitleSize),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: colorScheme.outline.withValues(alpha: 0.2),
                        ),
                      ),
                      child: Text(
                        project.notes!,
                        style: GoogleFonts.raleway(
                          fontSize: bodyFontSize,
                          fontStyle: FontStyle.italic,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],

                  // Bottom spacing
                  SizedBox(height: isMobile ? 80 : 60),
                ],
              ),
            ),
          ),
        ),

        // ----- NAVIGATION (mobile: bottom bar, desktop: side arrows) -----
        if (isMobile)
          _MobileNavigation(
            index: index,
            totalProjects: totalProjects,
            pageController: pageController,
          )
        else
          _DesktopNavigation(
            index: index,
            totalProjects: totalProjects,
            pageController: pageController,
          ),
      ],
    );
  }
}

// -------------------------------------------------------------------------
//  Project Header – index badge + name + type + status + store buttons
// -------------------------------------------------------------------------
class _ProjectHeader extends StatelessWidget {
  final Project project;
  final int index;
  final bool isMobile;

  const _ProjectHeader({
    required this.project,
    required this.index,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Index badge (like Home Page's skill chips)
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 12 : 16,
            vertical: isMobile ? 6 : 8,
          ),
          decoration: BoxDecoration(
            color: colorScheme.primary,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            '0${index + 1}',
            style: GoogleFonts.raleway(
              fontSize: isMobile ? 18 : 22,
              fontWeight: FontWeight.w600,
              color: colorScheme.onPrimary,
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Project name
        Text(
          project.name ?? '',
          style: GoogleFonts.raleway(
            fontSize: isMobile ? 32 : 48,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8),

        // Type
        Text(
          project.type ?? '',
          style: GoogleFonts.raleway(
            fontSize: isMobile ? 16 : 18,
            fontWeight: FontWeight.w500,
            color: colorScheme.primary,
          ),
        ),
        const SizedBox(height: 12),

        // Status + Last update (wrapped)
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: _getStatusColor(project.status).withValues(alpha:0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: _getStatusColor(project.status).withValues(alpha:0.3),
                ),
              ),
              child: Text(
                project.status ?? '',
                style: GoogleFonts.raleway(
                  fontSize: isMobile ? 13 : 14,
                  fontWeight: FontWeight.w600,
                  color: _getStatusColor(project.status),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Last update: ${project.lastUpdate ?? ''}',
                style: GoogleFonts.raleway(
                  fontSize: isMobile ? 13 : 14,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        // Store links – exactly same style as Home Page social buttons
        Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            if (project.googlePlay != null)
              _StoreButton(
                icon: FontAwesomeIcons.googlePlay,
                label: 'Google Play',
                url: project.googlePlay!,
                isMobile: isMobile,
              ),
            if (project.appStore != null)
              _StoreButton(
                icon: FontAwesomeIcons.appStore,
                label: 'App Store',
                url: project.appStore!,
                isMobile: isMobile,
              ),
            if (project.github != null && project.github!.isNotEmpty)
              _StoreButton(
                icon: FontAwesomeIcons.github,
                label: 'GitHub',
                url: project.github!,
                isMobile: isMobile,
              ),
          ],
        ),
      ],
    );
  }

  Color _getStatusColor(String? status) {
    if (status == null) return Colors.grey;
    if (status.contains('Live')) return Colors.green;
    if (status.contains('Development')) return Colors.orange;
    if (status.contains('Published')) return Colors.red;
    return Colors.blue;
  }
}

// -------------------------------------------------------------------------
//  Store button – matches Home Page _SocialIconButton exactly
// -------------------------------------------------------------------------
class _StoreButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final String url;
  final bool isMobile;

  const _StoreButton({
    required this.icon,
    required this.label,
    required this.url,
    required this.isMobile,
  });

  @override
  State<_StoreButton> createState() => _StoreButtonState();
}

class _StoreButtonState extends State<_StoreButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () async {
          final uri = Uri.parse(widget.url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: _isHovered ? colorScheme.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: _isHovered ? colorScheme.primary : colorScheme.outline,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                widget.icon,
                size: widget.isMobile ? 16 : 18,
                color: _isHovered ? colorScheme.onPrimary : colorScheme.onSurface,
              ),
              const SizedBox(width: 6),
              Text(
                widget.label,
                style: GoogleFonts.raleway(
                  fontSize: widget.isMobile ? 14 : 15,
                  color: _isHovered ? colorScheme.onPrimary : colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// -------------------------------------------------------------------------
//  Image Gallery – with placeholder and precached assets
// -------------------------------------------------------------------------
class _ImageGallery extends StatelessWidget {
  final List<String> imageUrls;
  final bool isMobile;

  const _ImageGallery({required this.imageUrls, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Screenshots',
          style: GoogleFonts.raleway(
            fontSize: isMobile ? 18 : 20,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: isMobile ? 300 : 380,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: imageUrls.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, i) {
              return _ProjectImage(
                imageUrl: imageUrls[i],
                width: isMobile ? 200 : 230,
                height: isMobile ? 300 : 380,
              );
            },
          ),
        ),
      ],
    );
  }
}

// -------------------------------------------------------------------------
//  Project Image – shows a placeholder while loading, precached already
// -------------------------------------------------------------------------
class _ProjectImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  const _ProjectImage({
    required this.imageUrl,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageUrl,
      fit: BoxFit.contain,
      // Show a subtle shimmer/placeholder while loading
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) return child;
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: frame == null
              ? Container(
                    width: width,
                    height: height,
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  child: const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                )
              : child,
        );
      },
      errorBuilder: (_, __, ___) => Container(
                    width: width,
                    height: height,
        color: Colors.grey[300],
        child: const Icon(Icons.broken_image, color: Colors.grey),
      ),
    );
  }
}

// -------------------------------------------------------------------------
//  Section Title – exactly like Home Page
// -------------------------------------------------------------------------
class _SectionTitle extends StatelessWidget {
  final String title;
  final double fontSize;
  const _SectionTitle(this.title, {required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.raleway(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

// -------------------------------------------------------------------------
//  Section Card – exactly like Home Page's About card
// -------------------------------------------------------------------------
class _SectionCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _SectionCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: colorScheme.outline.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.raleway(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}

// -------------------------------------------------------------------------
//  Feature Chip – matches Home Page's _SkillChip (primary background)
// -------------------------------------------------------------------------
class _FeatureChip extends StatelessWidget {
  final String label;
  const _FeatureChip({required this.label});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        label,
        style: GoogleFonts.raleway(
          fontSize: 14,
          color: colorScheme.onPrimary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

// -------------------------------------------------------------------------
//  Dependency Chip – matches Home Page's _LanguageChip (outlined)
// -------------------------------------------------------------------------
class _DependencyChip extends StatelessWidget {
  final String label;
  const _DependencyChip({required this.label});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: GoogleFonts.raleway(
          fontSize: 13,
          color: colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

// -------------------------------------------------------------------------
//  Mobile Navigation – bottom bar with dots and arrow buttons
// -------------------------------------------------------------------------
class _MobileNavigation extends StatelessWidget {
  final int index;
  final int totalProjects;
  final PageController pageController;

  const _MobileNavigation({
    required this.index,
    required this.totalProjects,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _NavButton(
              icon: Icons.arrow_back_ios,
              onTap: () {
                if (index == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const HomePage()),
                  );
                } else {
                  pageController.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
            Row(
              children: List.generate(totalProjects, (i) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: i == index ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: i == index
                        ? colorScheme.primary
                        : colorScheme.outline.withValues(alpha:0.3),
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
            _NavButton(
              icon: Icons.arrow_forward_ios,
              onTap: () {
                if (index == totalProjects - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const HomePage()),
                  );
                } else {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

// -------------------------------------------------------------------------
//  Desktop Navigation – left/right circular buttons
// -------------------------------------------------------------------------
class _DesktopNavigation extends StatelessWidget {
  final int index;
  final int totalProjects;
  final PageController pageController;

  const _DesktopNavigation({
    required this.index,
    required this.totalProjects,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: _NavButton(
              icon: Icons.arrow_back_ios,
              onTap: () {
                if (index == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const HomePage()),
                  );
                } else {
                  pageController.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                }
              },
              isDesktop: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: _NavButton(
              icon: Icons.arrow_forward_ios,
              onTap: () {
                if (index == totalProjects - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const HomePage()),
                  );
                } else {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                }
              },
              isDesktop: true,
            ),
          ),
        ],
      ),
    );
  }
}

// -------------------------------------------------------------------------
//  Navigation Button – circular, with hover effect (matches Home Page theme toggle)
// -------------------------------------------------------------------------
class _NavButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool isDesktop;

  const _NavButton({
    required this.icon,
    required this.onTap,
    this.isDesktop = false,
  });

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: widget.isDesktop ? 56 : 48,
          height: widget.isDesktop ? 56 : 48,
          decoration: BoxDecoration(
            color: _isHovered
                ? colorScheme.primary
                : colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
            shape: BoxShape.circle,
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: colorScheme.shadow.withValues(alpha: 0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    )
                  ]
                : null,
          ),
          child: Icon(
            widget.icon,
            color: _isHovered ? colorScheme.onPrimary : colorScheme.onSurface,
            size: widget.isDesktop ? 24 : 20,
          ),
        ),
      ),
    );
  }
}

// -------------------------------------------------------------------------
//  Page Indicator – desktop, pill shape
// -------------------------------------------------------------------------
class _PageIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const _PageIndicator({required this.currentPage, required this.totalPages});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.1)),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${currentPage + 1}',
            style: GoogleFonts.raleway(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: colorScheme.primary,
            ),
          ),
          Text(
            ' / $totalPages',
            style: GoogleFonts.raleway(
              fontSize: 16,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
