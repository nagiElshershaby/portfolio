import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../business_logic/project_viewmodel.dart';
import '../../business_logic/theme_viewmodel.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_strings.dart';
import '../../core/widgets/section_title.dart';
import '../../data/models/project.dart';
import '../widgets/social_icon_button.dart';
import '../widgets/store_button.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Root screen
// ─────────────────────────────────────────────────────────────────────────────
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// Anchor key attached to the "Projects" heading — used for smooth scrolling.
  final _projectsKey = GlobalKey();

  void _scrollToProjects() {
    final ctx = _projectsKey.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOut,
      alignment: 0.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeVM  = context.watch<ThemeViewModel>();
    final projects = context.watch<ProjectViewModel>().projects;

    return LayoutBuilder(builder: (context, constraints) {
      final w         = constraints.maxWidth;
      final isMobile  = w < AppDimensions.mobileBreakpoint;
      final isTablet  = w >= AppDimensions.mobileBreakpoint && w < AppDimensions.tabletBreakpoint;
      final isDesktop = w >= AppDimensions.tabletBreakpoint;

      final hPad    = isMobile ? AppDimensions.mobilePadding  : isTablet ? AppDimensions.tabletPadding  : AppDimensions.desktopPadding;
      final titleFs = isMobile ? AppDimensions.titleMobile    : isTablet ? AppDimensions.titleTablet    : AppDimensions.titleDesktop;
      final subFs   = isMobile ? AppDimensions.subtitleMobile : isTablet ? AppDimensions.subtitleTablet : AppDimensions.subtitleDesktop;
      final bodyFs  = isMobile ? AppDimensions.bodyMobile     : AppDimensions.bodyDesktop;
      final secFs   = isMobile ? AppDimensions.sectionTitleMobile : AppDimensions.sectionTitleDesktop;

      return Scaffold(
        body: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            scrollbars: isDesktop,
            overscroll: false,
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // ── App bar ────────────────────────────────────────────────
                _AppBar(themeVM: themeVM)
                    .animate()
                    .fadeIn(duration: 400.ms),

                const SizedBox(height: 40),

                // ── Hero ───────────────────────────────────────────────────
                _HeroSection(titleFs: titleFs, subFs: subFs, onProjectsTap: _scrollToProjects)
                    .animate()
                    .fadeIn(duration: 700.ms)
                    .slideY(begin: 0.08, end: 0, duration: 700.ms, curve: Curves.easeOut),

                const SizedBox(height: 60),

                // ── Bio columns ────────────────────────────────────────────
                if (isDesktop)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: _LeftColumn(bodyFs: bodyFs, secFs: secFs)
                            .animate()
                            .fadeIn(delay: 300.ms, duration: 700.ms)
                            .slideY(begin: 0.08, end: 0, delay: 300.ms, duration: 700.ms, curve: Curves.easeOut),
                      ),
                      const SizedBox(width: 48),
                      Expanded(
                        flex: 4,
                        child: _RightColumn(bodyFs: bodyFs, secFs: secFs)
                            .animate()
                            .fadeIn(delay: 500.ms, duration: 700.ms)
                            .slideY(begin: 0.08, end: 0, delay: 500.ms, duration: 700.ms, curve: Curves.easeOut),
                      ),
                    ],
                  )
                else
                  Column(children: [
                    _LeftColumn(bodyFs: bodyFs, secFs: secFs)
                        .animate()
                        .fadeIn(delay: 300.ms, duration: 700.ms)
                        .slideY(begin: 0.08, end: 0, delay: 300.ms, duration: 700.ms, curve: Curves.easeOut),
                    const SizedBox(height: 48),
                    _RightColumn(bodyFs: bodyFs, secFs: secFs)
                        .animate()
                        .fadeIn(delay: 500.ms, duration: 700.ms)
                        .slideY(begin: 0.08, end: 0, delay: 500.ms, duration: 700.ms, curve: Curves.easeOut),
                  ]),

                const SizedBox(height: 80),
                const Divider(),
                const SizedBox(height: 48),

                // ── Projects ───────────────────────────────────────────────
                SizedBox(key: _projectsKey, height: 0),
                SectionTitle(title: 'Projects', fontSize: secFs)
                    .animate()
                    .fadeIn(delay: 700.ms, duration: 700.ms),

                const SizedBox(height: 32),

                ...List.generate(projects.length, (i) {
                  final delay = Duration(milliseconds: 800 + i * 120);
                  return Padding(
                    padding: EdgeInsets.only(bottom: i < projects.length - 1 ? 24 : 0),
                    child: _ProjectEntry(
                      project: projects[i],
                      index: i,
                      isMobile: isMobile,
                      bodyFs: bodyFs,
                      secFs: secFs,
                    )
                        .animate()
                        .fadeIn(delay: delay, duration: 600.ms)
                        .slideY(begin: 0.06, end: 0, delay: delay, duration: 600.ms, curve: Curves.easeOut),
                  );
                }),

                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      );
    });
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// App bar
// ─────────────────────────────────────────────────────────────────────────────
class _AppBar extends StatelessWidget {
  final ThemeViewModel themeVM;
  const _AppBar({required this.themeVM});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Row(children: [
      const Spacer(),
      Container(
        decoration: BoxDecoration(
          color: cs.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: cs.outline),
        ),
        child: IconButton(
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Icon(
              themeVM.themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
              key: ValueKey(themeVM.themeMode),
              color: cs.onSurface,
            ),
          ),
          onPressed: themeVM.toggleTheme,
          tooltip: 'Toggle theme',
        ),
      ),
    ]);
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Hero
// ─────────────────────────────────────────────────────────────────────────────
class _HeroSection extends StatelessWidget {
  final double       titleFs;
  final double       subFs;
  final VoidCallback onProjectsTap;
  const _HeroSection({required this.titleFs, required this.subFs, required this.onProjectsTap});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, c) {
      final isRow = c.maxWidth > 700;
      if (isRow) {
        return Row(children: [
          const _ProfileAvatar(radius: 100),
          const SizedBox(width: 48),
          Expanded(child: _HeroText(titleFs: titleFs, subFs: subFs, onProjectsTap: onProjectsTap)),
        ]);
      }
      return Column(children: [
        const _ProfileAvatar(radius: 80),
        const SizedBox(height: 24),
        _HeroText(titleFs: titleFs, subFs: subFs, onProjectsTap: onProjectsTap),
      ]);
    });
  }
}

class _ProfileAvatar extends StatelessWidget {
  final double radius;
  const _ProfileAvatar({required this.radius});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return CircleAvatar(
      radius: radius,
      backgroundColor: cs.inverseSurface,
      child: ClipOval(
        child: Image.asset(
          'assets/images/profile/profile.jpeg',
          width: radius * 2,
          height: radius * 2,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) =>
              Icon(Icons.person, size: radius, color: cs.onInverseSurface),
        ),
      ),
    );
  }
}

class _HeroText extends StatelessWidget {
  final double       titleFs;
  final double       subFs;
  final VoidCallback onProjectsTap;
  const _HeroText({required this.titleFs, required this.subFs, required this.onProjectsTap});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.greeting,
            style: GoogleFonts.raleway(
                fontSize: subFs * 0.75, fontWeight: FontWeight.w300, color: cs.onSurfaceVariant)),
        const SizedBox(height: 8),
        Text(AppStrings.name,
            style: GoogleFonts.raleway(
                fontSize: titleFs, fontWeight: FontWeight.w700, letterSpacing: -0.5, color: cs.onSurface)),
        const SizedBox(height: 8),
        Text(AppStrings.jobTitle,
            style: GoogleFonts.raleway(
                fontSize: subFs, fontWeight: FontWeight.w400, color: cs.onSurface)),
        const SizedBox(height: 24),
        // Social links + Projects scroll button on the same Wrap row
        Wrap(spacing: 16, runSpacing: 12, children: [
          const SocialIconButton(icon: FontAwesomeIcons.googlePlay, url: AppStrings.googlePlayUrl, label: 'Google Play'),
          const SocialIconButton(icon: FontAwesomeIcons.github,     url: AppStrings.githubUrl,     label: 'GitHub'),
          const SocialIconButton(icon: Icons.mail_outline,          url: AppStrings.emailUrl,      label: 'Email'),
          const SocialIconButton(icon: FontAwesomeIcons.linkedin,   url: AppStrings.linkedinUrl,   label: 'LinkedIn'),
          _ProjectsScrollButton(onTap: onProjectsTap),
        ]),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// "Projects ↓" button — lives in the hero alongside social links
// ─────────────────────────────────────────────────────────────────────────────
class _ProjectsScrollButton extends StatefulWidget {
  final VoidCallback onTap;
  const _ProjectsScrollButton({required this.onTap});

  @override
  State<_ProjectsScrollButton> createState() => _ProjectsScrollButtonState();
}

class _ProjectsScrollButtonState extends State<_ProjectsScrollButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _hovered ? 1.06 : 1.0,
          duration: const Duration(milliseconds: 150),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: _hovered ? cs.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: _hovered ? cs.primary : cs.outline,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Projects',
                  style: GoogleFonts.raleway(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: _hovered ? cs.onPrimary : cs.onSurface,
                  ),
                ),
                const SizedBox(width: 5),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 16,
                  color: _hovered ? cs.onPrimary : cs.onSurface,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Bio columns
// ─────────────────────────────────────────────────────────────────────────────
class _LeftColumn extends StatelessWidget {
  final double bodyFs;
  final double secFs;
  const _LeftColumn({required this.bodyFs, required this.secFs});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: 'About', fontSize: secFs),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(AppStrings.aboutText,
                style: GoogleFonts.raleway(fontSize: bodyFs, height: 1.7, color: cs.onSurface)),
          ),
        ),
        const SizedBox(height: 40),
        SectionTitle(title: 'Education', fontSize: secFs),
        const SizedBox(height: 16),
        _InfoCard(
            title: AppStrings.educationDegree,
            subtitle: AppStrings.educationInstitution,
            date: AppStrings.educationDate,
            bodyFs: bodyFs),
        const SizedBox(height: 32),
        SectionTitle(title: 'Graduation Project', fontSize: secFs),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(AppStrings.gradProjectTitle,
                  style: GoogleFonts.raleway(
                      fontSize: bodyFs + 2, fontWeight: FontWeight.w600, color: cs.onSurface)),
              const SizedBox(height: 12),
              Text(AppStrings.gradProjectDescription,
                  style: GoogleFonts.raleway(fontSize: bodyFs, height: 1.7, color: cs.onSurface)),
            ]),
          ),
        ),
        const SizedBox(height: 32),
        SectionTitle(title: 'Languages', fontSize: secFs),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12, runSpacing: 12,
          children: AppStrings.languages.map((l) => _OutlineChip(label: l)).toList(),
        ),
      ],
    );
  }
}

class _RightColumn extends StatelessWidget {
  final double bodyFs;
  final double secFs;
  const _RightColumn({required this.bodyFs, required this.secFs});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: 'Experience', fontSize: secFs),
        const SizedBox(height: 16),
        _ExperienceTile(title: 'Mid Level Flutter Developer', company: 'HarmoniQ Innovation Technology', date: 'June 2025 - Present',    bodyFs: bodyFs),
        _ExperienceTile(title: 'Junior Flutter Developer',    company: 'Tuwaiq',                        date: 'March 2024 - June 2025',   bodyFs: bodyFs),
        _ExperienceTile(title: 'Flutter Instructor',          company: 'Microsoft Student Partner',     date: 'April 2023 - July 2023',   bodyFs: bodyFs),
        const SizedBox(height: 40),
        SectionTitle(title: 'Skills', fontSize: secFs),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Wrap(
              spacing: 10, runSpacing: 10,
              children: AppStrings.skills.map((s) => _FilledChip(label: s)).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Project entry  (Card with header, screenshots, description, features)
// ─────────────────────────────────────────────────────────────────────────────
class _ProjectEntry extends StatelessWidget {
  final Project project;
  final int     index;
  final bool    isMobile;
  final double  bodyFs;
  final double  secFs;

  const _ProjectEntry({
    required this.project,
    required this.index,
    required this.isMobile,
    required this.bodyFs,
    required this.secFs,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Header ─────────────────────────────────────────────────────────
            _ProjectHeader(project: project, index: index, isMobile: isMobile),

            // Screenshots ─────────────────────────────────────────────────────
            if (project.imagesUrls?.isNotEmpty == true) ...[
              const SizedBox(height: 28),
              _ScreenshotGallery(
                imageUrls: project.imagesUrls!,
                isMobile: isMobile,
              ),
            ],

            // Description ─────────────────────────────────────────────────────
            if (project.description?.isNotEmpty == true) ...[
              const SizedBox(height: 28),
              Text(project.description!,
                  style: GoogleFonts.raleway(
                      fontSize: bodyFs, height: 1.7, color: cs.onSurface)),
            ],

            // Features ─────────────────────────────────────────────────────────
            if (project.features?.isNotEmpty == true) ...[
              const SizedBox(height: 24),
              SectionTitle(title: 'Key Features', fontSize: secFs - 4),
              const SizedBox(height: 12),
              Wrap(
                spacing: 10, runSpacing: 10,
                children: project.features!.map((f) => _FilledChip(label: f)).toList(),
              ),
            ],

            // Notes ───────────────────────────────────────────────────────────
            if (project.notes?.isNotEmpty == true) ...[
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: cs.outline),
                ),
                child: Text(project.notes!,
                    style: GoogleFonts.raleway(
                        fontSize: bodyFs,
                        fontStyle: FontStyle.italic,
                        color: cs.onSurfaceVariant,
                        height: 1.6)),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Project header
// ─────────────────────────────────────────────────────────────────────────────
class _ProjectHeader extends StatelessWidget {
  final Project project;
  final int     index;
  final bool    isMobile;
  const _ProjectHeader({required this.project, required this.index, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // Index + name row
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              '0${index + 1}',
              style: GoogleFonts.raleway(
                  fontSize: isMobile ? 13 : 15,
                  fontWeight: FontWeight.w600,
                  color: cs.onSurfaceVariant,
                  letterSpacing: 1),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                project.name ?? '',
                style: GoogleFonts.raleway(
                    fontSize: isMobile ? 26 : 36,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                    color: cs.onSurface),
              ),
            ),
          ],
        ),

        const SizedBox(height: 6),

        // Type
        if (project.type?.isNotEmpty == true)
          Text(project.type!,
              style: GoogleFonts.raleway(
                  fontSize: isMobile ? 13 : 14,
                  color: cs.onSurfaceVariant,
                  height: 1.5)),

        const SizedBox(height: 12),

        // Status + last update
        Wrap(spacing: 10, runSpacing: 8, children: [
          _StatusBadge(status: project.status, isMobile: isMobile),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: cs.outline),
            ),
            child: Text(
              'Updated ${project.lastUpdate ?? ''}',
              style: GoogleFonts.raleway(
                  fontSize: isMobile ? 12 : 13, color: cs.onSurfaceVariant),
            ),
          ),
        ]),

        const SizedBox(height: 16),

        // Store links
        Wrap(spacing: 12, runSpacing: 10, children: [
          if (project.googlePlay != null)
            StoreButton(icon: FontAwesomeIcons.googlePlay, label: 'Google Play', url: project.googlePlay!, isMobile: isMobile),
          if (project.appStore != null)
            StoreButton(icon: FontAwesomeIcons.appStore,   label: 'App Store',   url: project.appStore!,   isMobile: isMobile),
          if (project.github?.isNotEmpty == true)
            StoreButton(icon: FontAwesomeIcons.github,     label: 'GitHub',      url: project.github!,     isMobile: isMobile),
        ]),
      ],
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String? status;
  final bool    isMobile;
  const _StatusBadge({this.status, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final cs    = Theme.of(context).colorScheme;
    // Live = filled (primary), others = outlined
    final isLive = status?.contains('Live') == true;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: isLive ? cs.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: isLive ? cs.primary : cs.outline),
      ),
      child: Text(
        status ?? '',
        style: GoogleFonts.raleway(
            fontSize: isMobile ? 12 : 13,
            fontWeight: FontWeight.w600,
            color: isLive ? cs.onPrimary : cs.onSurface),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Screenshot gallery  — horizontal scroll; tap any image to open lightbox
// ─────────────────────────────────────────────────────────────────────────────
class _ScreenshotGallery extends StatelessWidget {
  final List<String> imageUrls;
  final bool         isMobile;
  const _ScreenshotGallery({required this.imageUrls, required this.isMobile});

  void _openLightbox(BuildContext context, int initialIndex) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.96),
      builder: (_) => _LightboxDialog(
        imageUrls:    imageUrls,
        initialIndex: initialIndex,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Width tuned to near-portrait aspect ratio so BoxFit.cover only clips ~5 %
    final imgH = isMobile ? 280.0 : 380.0;
    final imgW = isMobile ? 155.0 : 178.0;

    return SizedBox(
      height: imgH,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: imageUrls.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (ctx, i) => GestureDetector(
          onTap: () => _openLightbox(context, i),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: _Thumbnail(
                url: imageUrls[i],
                width: imgW,
                height: imgH,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Thumbnail extends StatefulWidget {
  final String url;
  final double width;
  final double height;
  const _Thumbnail({required this.url, required this.width, required this.height});

  @override
  State<_Thumbnail> createState() => _ThumbnailState();
}

class _ThumbnailState extends State<_Thumbnail> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: AnimatedScale(
        scale:    _hovered ? 1.03 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: Image.asset(
          widget.url,
          width:  widget.width,
          height: widget.height,
          fit:    BoxFit.cover,
          frameBuilder: (ctx, child, frame, sync) {
            if (sync) return child;
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: frame == null
                  ? Container(
                      width: widget.width, height: widget.height,
                      color: Theme.of(context).colorScheme.surfaceContainerHighest,
                      child: const Center(child: CircularProgressIndicator(strokeWidth: 1.5)),
                    )
                  : child,
            );
          },
          errorBuilder: (_, __, ___) => Container(
            width: widget.width, height: widget.height,
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            child: Icon(Icons.broken_image,
                color: Theme.of(context).colorScheme.onSurfaceVariant),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Lightbox — full-screen swipeable gallery with pinch-to-zoom
// ─────────────────────────────────────────────────────────────────────────────
class _LightboxDialog extends StatefulWidget {
  final List<String> imageUrls;
  final int          initialIndex;
  const _LightboxDialog({required this.imageUrls, required this.initialIndex});

  @override
  State<_LightboxDialog> createState() => _LightboxDialogState();
}

class _LightboxDialogState extends State<_LightboxDialog> {
  late final PageController _ctrl;
  late int _current;

  @override
  void initState() {
    super.initState();
    _current = widget.initialIndex;
    _ctrl    = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      backgroundColor: Colors.black,
      child: Stack(
        children: [

          // ── Image carousel ──────────────────────────────────────────────
          PageView.builder(
            controller: _ctrl,
            itemCount: widget.imageUrls.length,
            onPageChanged: (i) => setState(() => _current = i),
            itemBuilder: (ctx, i) => InteractiveViewer(
              maxScale: 5.0,
              child: Center(
                child: Image.asset(
                  widget.imageUrls[i],
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.broken_image, color: Colors.white54, size: 64),
                ),
              ),
            ),
          ),

          // ── Close button ────────────────────────────────────────────────
          Positioned(
            top: 16, right: 16,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white24),
                ),
                child: const Icon(Icons.close, color: Colors.white, size: 22),
              ),
            ),
          ),

          // ── Counter ─────────────────────────────────────────────────────
          if (widget.imageUrls.length > 1)
            Positioned(
              bottom: 24, left: 0, right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: Text(
                    '${_current + 1} / ${widget.imageUrls.length}',
                    style: GoogleFonts.raleway(
                        color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Shared screen-level components
// ─────────────────────────────────────────────────────────────────────────────
class _InfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final double bodyFs;
  const _InfoCard({required this.title, required this.subtitle, required this.date, required this.bodyFs});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: cs.outline),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title,
            style: GoogleFonts.raleway(
                fontSize: bodyFs + 2, fontWeight: FontWeight.w600, color: cs.onSurface)),
        const SizedBox(height: 6),
        Text(subtitle,
            style: GoogleFonts.raleway(fontSize: bodyFs, color: cs.onSurfaceVariant)),
        const SizedBox(height: 4),
        Text(date,
            style: GoogleFonts.raleway(
                fontSize: bodyFs - 2, color: cs.onSurface, fontWeight: FontWeight.w500)),
      ]),
    );
  }
}

class _ExperienceTile extends StatelessWidget {
  final String title;
  final String company;
  final String date;
  final double bodyFs;
  const _ExperienceTile({required this.title, required this.company, required this.date, required this.bodyFs});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          margin: const EdgeInsets.only(top: 5),
          width: 8, height: 8,
          decoration: BoxDecoration(shape: BoxShape.circle, color: cs.onSurface),
        ),
        const SizedBox(width: 16),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title,
              style: GoogleFonts.raleway(
                  fontSize: bodyFs + 1, fontWeight: FontWeight.w600, color: cs.onSurface)),
          const SizedBox(height: 3),
          Text(company,
              style: GoogleFonts.raleway(fontSize: bodyFs, color: cs.onSurfaceVariant)),
          const SizedBox(height: 3),
          Text(date,
              style: GoogleFonts.raleway(
                  fontSize: bodyFs - 2, color: cs.onSurface, fontWeight: FontWeight.w500)),
        ])),
      ]),
    );
  }
}

/// Filled chip — primary background (black/white depending on theme).
class _FilledChip extends StatelessWidget {
  final String label;
  const _FilledChip({required this.label});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: cs.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(label,
          style: GoogleFonts.raleway(
              fontSize: 13, color: cs.onPrimary, fontWeight: FontWeight.w500)),
    );
  }
}

/// Outlined chip — for languages and secondary tags.
class _OutlineChip extends StatelessWidget {
  final String label;
  const _OutlineChip({required this.label});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: cs.outline),
      ),
      child: Text(label,
          style: GoogleFonts.raleway(fontSize: 13, color: cs.onSurfaceVariant)),
    );
  }
}
