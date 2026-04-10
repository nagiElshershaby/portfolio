import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../business_logic/theme_viewmodel.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_strings.dart';
import '../../core/widgets/section_title.dart';
import '../widgets/social_icon_button.dart';
import 'projects_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeVM = context.watch<ThemeViewModel>();

    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final isMobile = w < AppDimensions.mobileBreakpoint;
        final isTablet =
            w >= AppDimensions.mobileBreakpoint && w < AppDimensions.tabletBreakpoint;
        final isDesktop = w >= AppDimensions.tabletBreakpoint;

        final hPad = isMobile
            ? AppDimensions.mobilePadding
            : isTablet
                ? AppDimensions.tabletPadding
                : AppDimensions.desktopPadding;

        final titleFs = isMobile
            ? AppDimensions.titleMobile
            : isTablet
                ? AppDimensions.titleTablet
                : AppDimensions.titleDesktop;

        final subtitleFs = isMobile
            ? AppDimensions.subtitleMobile
            : isTablet
                ? AppDimensions.subtitleTablet
                : AppDimensions.subtitleDesktop;

        final bodyFs =
            isMobile ? AppDimensions.bodyMobile : AppDimensions.bodyDesktop;
        final secFs = isMobile
            ? AppDimensions.sectionTitleMobile
            : AppDimensions.sectionTitleDesktop;

        return Scaffold(
          body: KeyboardListener(
            focusNode: FocusNode()..requestFocus(),
            onKeyEvent: (event) {
              if (event is KeyDownEvent &&
                  event.logicalKey == LogicalKeyboardKey.arrowRight) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProjectsScreen()),
                );
              }
            },
            child: Stack(
              children: [
                Container(
                  color: Theme.of(context).colorScheme.surface,
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(
                      scrollbars: isDesktop,
                      overscroll: false,
                    ),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                          horizontal: hPad, vertical: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _AppBar(themeVM: themeVM)
                              .animate()
                              .fadeIn(duration: 400.ms),
                          const SizedBox(height: 40),
                          _HeroSection(
                            titleFontSize: titleFs,
                            subtitleFontSize: subtitleFs,
                          )
                              .animate()
                              .fadeIn(duration: 700.ms)
                              .slideY(
                                begin: 0.08,
                                end: 0,
                                duration: 700.ms,
                                curve: Curves.easeOut,
                              ),
                          const SizedBox(height: 60),
                          if (isDesktop)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: _LeftColumn(
                                    bodyFs: bodyFs,
                                    secFs: secFs,
                                  )
                                      .animate()
                                      .fadeIn(
                                        delay: 300.ms,
                                        duration: 700.ms,
                                      )
                                      .slideY(
                                        begin: 0.08,
                                        end: 0,
                                        delay: 300.ms,
                                        duration: 700.ms,
                                        curve: Curves.easeOut,
                                      ),
                                ),
                                const SizedBox(width: 48),
                                Expanded(
                                  flex: 4,
                                  child: _RightColumn(
                                    bodyFs: bodyFs,
                                    secFs: secFs,
                                  )
                                      .animate()
                                      .fadeIn(
                                        delay: 500.ms,
                                        duration: 700.ms,
                                      )
                                      .slideY(
                                        begin: 0.08,
                                        end: 0,
                                        delay: 500.ms,
                                        duration: 700.ms,
                                        curve: Curves.easeOut,
                                      ),
                                ),
                              ],
                            )
                          else
                            Column(
                              children: [
                                _LeftColumn(bodyFs: bodyFs, secFs: secFs)
                                    .animate()
                                    .fadeIn(delay: 300.ms, duration: 700.ms)
                                    .slideY(
                                      begin: 0.08,
                                      end: 0,
                                      delay: 300.ms,
                                      duration: 700.ms,
                                      curve: Curves.easeOut,
                                    ),
                                const SizedBox(height: 48),
                                _RightColumn(bodyFs: bodyFs, secFs: secFs)
                                    .animate()
                                    .fadeIn(delay: 500.ms, duration: 700.ms)
                                    .slideY(
                                      begin: 0.08,
                                      end: 0,
                                      delay: 500.ms,
                                      duration: 700.ms,
                                      curve: Curves.easeOut,
                                    ),
                              ],
                            ),
                          const SizedBox(height: 150),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: isDesktop ? 40 : 20,
                  right: isDesktop ? 40 : 20,
                  child: _ProjectsNavigation(isMobile: !isDesktop)
                      .animate()
                      .fadeIn(delay: 700.ms, duration: 600.ms)
                      .slideY(
                        begin: 0.2,
                        end: 0,
                        delay: 700.ms,
                        duration: 600.ms,
                        curve: Curves.easeOut,
                      ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// App Bar
// ─────────────────────────────────────────────────────────────────────────────
class _AppBar extends StatelessWidget {
  final ThemeViewModel themeVM;
  const _AppBar({required this.themeVM});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Row(
      children: [
        const Spacer(),
        Container(
          decoration: BoxDecoration(
            color: cs.surfaceContainerHighest.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(30),
          ),
          child: IconButton(
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Icon(
                themeVM.themeMode == ThemeMode.dark
                    ? Icons.light_mode
                    : Icons.dark_mode,
                key: ValueKey(themeVM.themeMode),
                color: cs.onSurface,
              ),
            ),
            onPressed: themeVM.toggleTheme,
            tooltip: 'Toggle theme',
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Hero
// ─────────────────────────────────────────────────────────────────────────────
class _HeroSection extends StatelessWidget {
  final double titleFontSize;
  final double subtitleFontSize;
  const _HeroSection(
      {required this.titleFontSize, required this.subtitleFontSize});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
      final isRow = c.maxWidth > 700;
      if (isRow) {
        return Row(children: [
          const _ProfileAvatar(radius: 100),
          const SizedBox(width: 48),
          Expanded(
              child: _HeroText(
                  titleFontSize: titleFontSize,
                  subtitleFontSize: subtitleFontSize)),
        ]);
      }
      return Column(children: [
        const _ProfileAvatar(radius: 80),
        const SizedBox(height: 24),
        _HeroText(
            titleFontSize: titleFontSize, subtitleFontSize: subtitleFontSize),
      ]);
    });
  }
}

class _ProfileAvatar extends StatelessWidget {
  final double radius;
  const _ProfileAvatar({required this.radius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Theme.of(context).colorScheme.inverseSurface,
      child: ClipOval(
        child: Image.asset(
          'assets/images/profile/profile.jpeg',
          width: radius * 2,
          height: radius * 2,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Icon(
            Icons.person,
            size: radius,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}

class _HeroText extends StatelessWidget {
  final double titleFontSize;
  final double subtitleFontSize;
  const _HeroText(
      {required this.titleFontSize, required this.subtitleFontSize});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.greeting,
          style: GoogleFonts.raleway(
            fontSize: subtitleFontSize * 0.75,
            fontWeight: FontWeight.w300,
            color: cs.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          AppStrings.name,
          style: GoogleFonts.raleway(
            fontSize: titleFontSize,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
            color: cs.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          AppStrings.jobTitle,
          style: GoogleFonts.raleway(
            fontSize: subtitleFontSize,
            fontWeight: FontWeight.w400,
            color: cs.primary,
          ),
        ),
        const SizedBox(height: 24),
        const Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            SocialIconButton(
              icon: FontAwesomeIcons.googlePlay,
              url: AppStrings.googlePlayUrl,
              label: 'Google Play',
            ),
            SocialIconButton(
              icon: FontAwesomeIcons.github,
              url: AppStrings.githubUrl,
              label: 'GitHub',
            ),
            SocialIconButton(
              icon: Icons.mail_outline,
              url: AppStrings.emailUrl,
              label: 'Email',
            ),
            SocialIconButton(
              icon: FontAwesomeIcons.linkedin,
              url: AppStrings.linkedinUrl,
              label: 'LinkedIn',
            ),
          ],
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Left column
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
            child: Text(
              AppStrings.aboutText,
              style: GoogleFonts.raleway(
                fontSize: bodyFs,
                height: 1.6,
                color: cs.onSurface,
              ),
            ),
          ),
        ),
        const SizedBox(height: 40),
        SectionTitle(title: 'Education', fontSize: secFs),
        const SizedBox(height: 16),
        _InfoCard(
          title: AppStrings.educationDegree,
          subtitle: AppStrings.educationInstitution,
          date: AppStrings.educationDate,
          bodyFs: bodyFs,
        ),
        const SizedBox(height: 32),
        SectionTitle(title: 'Graduation Project', fontSize: secFs),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.gradProjectTitle,
                  style: GoogleFonts.raleway(
                    fontSize: bodyFs + 2,
                    fontWeight: FontWeight.w600,
                    color: cs.primary,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  AppStrings.gradProjectDescription,
                  style: GoogleFonts.raleway(
                    fontSize: bodyFs,
                    height: 1.6,
                    color: cs.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 32),
        SectionTitle(title: 'Languages', fontSize: secFs),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: AppStrings.languages
              .map((l) => _LanguageChip(label: l))
              .toList(),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Right column
// ─────────────────────────────────────────────────────────────────────────────
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
        _ExperienceTile(
          title: 'Mid Level Flutter Developer',
          company: 'HarmoniQ Innovation Technology',
          date: 'June 2025 - Present',
          bodyFs: bodyFs,
        ),
        _ExperienceTile(
          title: 'Junior Flutter Developer',
          company: 'Tuwaiq',
          date: 'March 2024 - June 2025',
          bodyFs: bodyFs,
        ),
        _ExperienceTile(
          title: 'Flutter Instructor',
          company: 'Microsoft Student Partner',
          date: 'April 2023 - July 2023',
          bodyFs: bodyFs,
        ),
        const SizedBox(height: 40),
        SectionTitle(title: 'Skills', fontSize: secFs),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children:
                  AppStrings.skills.map((s) => _SkillChip(label: s)).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Projects navigation button
// ─────────────────────────────────────────────────────────────────────────────
class _ProjectsNavigation extends StatelessWidget {
  final bool isMobile;
  const _ProjectsNavigation({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ProjectsScreen()),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 32,
            vertical: isMobile ? 10 : 14,
          ),
          decoration: BoxDecoration(
            color: cs.primary.withValues(alpha: 0.85),
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: cs.primary.withValues(alpha: 0.35),
                blurRadius: 20,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'View Projects',
                style: GoogleFonts.raleway(
                  fontSize: isMobile ? 18 : 22,
                  fontWeight: FontWeight.w600,
                  color: cs.onPrimary,
                ),
              ),
              const SizedBox(width: 16),
              Icon(
                Icons.arrow_forward,
                color: cs.onPrimary,
                size: isMobile ? 24 : 28,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Reusable screen-level components
// ─────────────────────────────────────────────────────────────────────────────
class _InfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final double bodyFs;

  const _InfoCard({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.bodyFs,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.raleway(
              fontSize: bodyFs + 2,
              fontWeight: FontWeight.w600,
              color: cs.onSurface,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: GoogleFonts.raleway(
              fontSize: bodyFs,
              color: cs.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            date,
            style: GoogleFonts.raleway(
              fontSize: bodyFs - 2,
              color: cs.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _ExperienceTile extends StatelessWidget {
  final String title;
  final String company;
  final String date;
  final double bodyFs;

  const _ExperienceTile({
    required this.title,
    required this.company,
    required this.date,
    required this.bodyFs,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 4),
            width: 10,
            height: 10,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: cs.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.raleway(
                    fontSize: bodyFs + 1,
                    fontWeight: FontWeight.w600,
                    color: cs.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  company,
                  style: GoogleFonts.raleway(
                    fontSize: bodyFs,
                    color: cs.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: GoogleFonts.raleway(
                    fontSize: bodyFs - 2,
                    color: cs.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;
  const _SkillChip({required this.label});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: BoxDecoration(
        color: cs.primary,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        label,
        style: GoogleFonts.raleway(
          fontSize: 14,
          color: cs.onPrimary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _LanguageChip extends StatelessWidget {
  final String label;
  const _LanguageChip({required this.label});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: cs.outline.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: GoogleFonts.raleway(
          fontSize: 14,
          color: cs.onSurfaceVariant,
        ),
      ),
    );
  }
}
