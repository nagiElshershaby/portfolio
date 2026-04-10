import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../business_logic/project_viewmodel.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/widgets/section_title.dart';
import '../../data/models/project.dart';
import '../widgets/nav_button.dart';
import '../widgets/store_button.dart';
import 'home_screen.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() => _currentPage = _pageController.page?.round() ?? 0);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => _precache());
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _precache() {
    final projects = context.read<ProjectViewModel>().projects;
    for (final p in projects) {
      if (p.backgroundUrl != null) {
        precacheImage(AssetImage(p.backgroundUrl!), context);
      }
      for (final url in p.imagesUrls ?? []) {
        precacheImage(AssetImage(url), context);
      }
    }
  }

  void _handleKey(
      KeyEvent event, BuildContext ctx, List<Project> projects) {
    if (event is! KeyDownEvent) return;
    if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
      if (_currentPage == projects.length - 1) {
        Navigator.pushReplacement(
          ctx,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
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
          ctx,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      } else {
        _pageController.previousPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final projects = context.watch<ProjectViewModel>().projects;

    return LayoutBuilder(builder: (context, constraints) {
      final w = constraints.maxWidth;
      final isMobile = w < AppDimensions.mobileBreakpoint;
      final isTablet =
          w >= AppDimensions.mobileBreakpoint && w < AppDimensions.tabletBreakpoint;
      final isDesktop = w >= AppDimensions.tabletBreakpoint;

      return Scaffold(
        body: KeyboardListener(
          focusNode: FocusNode()..requestFocus(),
          onKeyEvent: (e) => _handleKey(e, context, projects),
          child: Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                itemCount: projects.length,
                itemBuilder: (ctx, i) => _ProjectPage(
                  project: projects[i],
                  index: i,
                  totalProjects: projects.length,
                  isMobile: isMobile,
                  isTablet: isTablet,
                  isDesktop: isDesktop,
                  pageController: _pageController,
                ),
              ),
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
    });
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Individual project page
// ─────────────────────────────────────────────────────────────────────────────
class _ProjectPage extends StatelessWidget {
  final Project project;
  final int index;
  final int totalProjects;
  final bool isMobile;
  final bool isTablet;
  final bool isDesktop;
  final PageController pageController;

  const _ProjectPage({
    required this.project,
    required this.index,
    required this.totalProjects,
    required this.isMobile,
    required this.isTablet,
    required this.isDesktop,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final hPad = isMobile
        ? AppDimensions.mobilePadding
        : isTablet
            ? AppDimensions.tabletPadding
            : AppDimensions.desktopPadding;
    final bodyFs =
        isMobile ? AppDimensions.bodyMobile : AppDimensions.bodyDesktop;
    final secFs = isMobile
        ? AppDimensions.sectionTitleMobile
        : AppDimensions.sectionTitleDesktop;

    // Resolve background: explicit backgroundUrl takes priority, then first screenshot.
    final bgUrl =
        project.backgroundUrl ?? project.imagesUrls?.firstOrNull;

    return Stack(
      children: [
        // ── Cinematic background ──────────────────────────────────────────
        if (bgUrl != null) ...[
          Positioned.fill(
            child: Image.asset(bgUrl, fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 22, sigmaY: 22),
              child: Container(
                color: isDark
                    ? Colors.black.withValues(alpha: 0.72)
                    : cs.surface.withValues(alpha: 0.88),
              ),
            ),
          ),
        ] else
          Positioned.fill(child: Container(color: cs.surface)),

        // ── Scrollable content ────────────────────────────────────────────
        SafeArea(
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              padding:
                  EdgeInsets.symmetric(horizontal: hPad, vertical: 32),
              child: Column(
                key: ValueKey(index),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ProjectHeader(
                    project: project,
                    index: index,
                    isMobile: isMobile,
                  ),
                  const SizedBox(height: 32),
                  if (project.imagesUrls?.isNotEmpty == true)
                    _ImageGallery(
                      imageUrls: project.imagesUrls!,
                      isMobile: isMobile,
                    ),
                  const SizedBox(height: 32),
                  _SectionCard(
                    title: 'Description',
                    child: Text(
                      project.description ?? '',
                      style: GoogleFonts.raleway(
                        fontSize: bodyFs,
                        height: 1.6,
                        color: cs.onSurface,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  if (project.features?.isNotEmpty == true) ...[
                    SectionTitle(title: 'Key Features', fontSize: secFs),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: project.features!
                          .map((f) => _FeatureChip(label: f))
                          .toList(),
                    ),
                    const SizedBox(height: 24),
                  ],
                  if (project.pubspec?.isNotEmpty == true) ...[
                    SectionTitle(title: 'Dependencies', fontSize: secFs),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: project.pubspec!
                          .map((d) => _DependencyChip(label: d))
                          .toList(),
                    ),
                    const SizedBox(height: 24),
                  ],
                  if (project.notes?.isNotEmpty == true) ...[
                    SectionTitle(title: 'Notes', fontSize: secFs),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: cs.surfaceContainerHighest
                            .withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: cs.outline.withValues(alpha: 0.2),
                        ),
                      ),
                      child: Text(
                        project.notes!,
                        style: GoogleFonts.raleway(
                          fontSize: bodyFs,
                          fontStyle: FontStyle.italic,
                          color: cs.onSurfaceVariant,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                  SizedBox(height: isMobile ? 80 : 60),
                ],
              )
                  .animate()
                  .fadeIn(duration: 350.ms)
                  .slideX(begin: 0.03, end: 0, duration: 350.ms),
            ),
          ),
        ),

        // ── Navigation overlays ───────────────────────────────────────────
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

// ─────────────────────────────────────────────────────────────────────────────
// Project header
// ─────────────────────────────────────────────────────────────────────────────
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
    final cs = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 12 : 16,
            vertical: isMobile ? 6 : 8,
          ),
          decoration: BoxDecoration(
            color: cs.primary,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            '0${index + 1}',
            style: GoogleFonts.raleway(
              fontSize: isMobile ? 18 : 22,
              fontWeight: FontWeight.w600,
              color: cs.onPrimary,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          project.name ?? '',
          style: GoogleFonts.raleway(
            fontSize: isMobile ? 32 : 48,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
            color: cs.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          project.type ?? '',
          style: GoogleFonts.raleway(
            fontSize: isMobile ? 16 : 18,
            fontWeight: FontWeight.w500,
            color: cs.primary,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: [
            _StatusBadge(
              status: project.status,
              isMobile: isMobile,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color:
                    cs.surfaceContainerHighest.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Last update: ${project.lastUpdate ?? ''}',
                style: GoogleFonts.raleway(
                  fontSize: isMobile ? 13 : 14,
                  color: cs.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            if (project.googlePlay != null)
              StoreButton(
                icon: FontAwesomeIcons.googlePlay,
                label: 'Google Play',
                url: project.googlePlay!,
                isMobile: isMobile,
              ),
            if (project.appStore != null)
              StoreButton(
                icon: FontAwesomeIcons.appStore,
                label: 'App Store',
                url: project.appStore!,
                isMobile: isMobile,
              ),
            if (project.github?.isNotEmpty == true)
              StoreButton(
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
}

class _StatusBadge extends StatelessWidget {
  final String? status;
  final bool isMobile;
  const _StatusBadge({this.status, required this.isMobile});

  Color _color(String? s) {
    if (s == null) return Colors.grey;
    if (s.contains('Live')) return Colors.green;
    if (s.contains('Development')) return Colors.orange;
    if (s.contains('Published')) return Colors.red;
    return Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    final c = _color(status);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: c.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: c.withValues(alpha: 0.3)),
      ),
      child: Text(
        status ?? '',
        style: GoogleFonts.raleway(
          fontSize: isMobile ? 13 : 14,
          fontWeight: FontWeight.w600,
          color: c,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Image gallery
// ─────────────────────────────────────────────────────────────────────────────
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
            itemBuilder: (ctx, i) => _ProjectImage(
              imageUrl: imageUrls[i],
              width: isMobile ? 200 : 230,
              height: isMobile ? 300 : 380,
            ),
          ),
        ),
      ],
    );
  }
}

class _ProjectImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  const _ProjectImage(
      {required this.imageUrl, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageUrl,
      fit: BoxFit.contain,
      frameBuilder: (ctx, child, frame, sync) {
        if (sync) return child;
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: frame == null
              ? Container(
                  width: width,
                  height: height,
                  color: Theme.of(context)
                      .colorScheme
                      .surfaceContainerHighest,
                  child: const Center(
                      child: CircularProgressIndicator(strokeWidth: 2)),
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

// ─────────────────────────────────────────────────────────────────────────────
// Section card
// ─────────────────────────────────────────────────────────────────────────────
class _SectionCard extends StatelessWidget {
  final String title;
  final Widget child;
  const _SectionCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
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
                color: cs.primary,
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

// ─────────────────────────────────────────────────────────────────────────────
// Chips
// ─────────────────────────────────────────────────────────────────────────────
class _FeatureChip extends StatelessWidget {
  final String label;
  const _FeatureChip({required this.label});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: cs.primary,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        label,
        style: GoogleFonts.raleway(
            fontSize: 14, color: cs.onPrimary, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class _DependencyChip extends StatelessWidget {
  final String label;
  const _DependencyChip({required this.label});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: cs.outline.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: GoogleFonts.raleway(
            fontSize: 13, color: cs.onSurfaceVariant),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Navigation
// ─────────────────────────────────────────────────────────────────────────────
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
    final cs = Theme.of(context).colorScheme;
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavButton(
              icon: Icons.arrow_back_ios,
              onTap: () {
                if (index == 0) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()));
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
                        ? cs.primary
                        : cs.outline.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
            NavButton(
              icon: Icons.arrow_forward_ios,
              onTap: () {
                if (index == totalProjects - 1) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()));
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
            child: NavButton(
              icon: Icons.arrow_back_ios,
              isDesktop: true,
              onTap: () {
                if (index == 0) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()));
                } else {
                  pageController.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: NavButton(
              icon: Icons.arrow_forward_ios,
              isDesktop: true,
              onTap: () {
                if (index == totalProjects - 1) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()));
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
    );
  }
}

class _PageIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  const _PageIndicator({required this.currentPage, required this.totalPages});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: cs.outline.withValues(alpha: 0.1)),
        boxShadow: [
          BoxShadow(
            color: cs.shadow.withValues(alpha: 0.1),
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
              color: cs.primary,
            ),
          ),
          Text(
            ' / $totalPages',
            style: GoogleFonts.raleway(
                fontSize: 16, color: cs.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
