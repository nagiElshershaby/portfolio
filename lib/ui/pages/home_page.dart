import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../providers/theme_provider.dart';
import 'projects_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive breakpoints
        final screenWidth = constraints.maxWidth;
        final bool isMobile = screenWidth < 600;
        final bool isTablet = screenWidth >= 600 && screenWidth < 900;
        final bool isDesktop = screenWidth >= 900;

        // Dynamic padding & font sizes
        final horizontalPadding = isMobile ? 24.0 : (isTablet ? 40.0 : 64.0);
        final titleFontSize = isMobile ? 32.0 : (isTablet ? 40.0 : 48.0);
        final subtitleFontSize = isMobile ? 20.0 : (isTablet ? 24.0 : 28.0);
        final bodyFontSize = isMobile ? 14.0 : 16.0;
        final sectionTitleSize = isMobile ? 22.0 : 28.0;

        return Scaffold(
          body: KeyboardListener(
            onKeyEvent: (event) {
              if (event is KeyDownEvent &&
                  event.logicalKey == LogicalKeyboardKey.arrowRight) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ProjectsPage()),
                );
              }
            },
            focusNode: FocusNode()..requestFocus(),
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
                        horizontal: horizontalPadding,
                        vertical: 32,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ----- APP BAR (theme toggle + placeholder) -----
                          _AppBar(
                              themeProvider:
                                  Provider.of<ThemeProvider>(context)),
                          const SizedBox(height: 40),

                          // ----- HERO SECTION -----
                          _HeroSection(
                            titleFontSize: titleFontSize,
                            subtitleFontSize: subtitleFontSize,
                          ),
                          const SizedBox(height: 60),

                          // ----- MAIN CONTENT GRID (responsive) -----
                          if (isDesktop)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: _LeftColumn(
                                    bodyFontSize: bodyFontSize,
                                    sectionTitleSize: sectionTitleSize,
                                  ),
                                ),
                                const SizedBox(width: 48),
                                Expanded(
                                  flex: 4,
                                  child: _RightColumn(
                                    bodyFontSize: bodyFontSize,
                                    sectionTitleSize: sectionTitleSize,
                                  ),
                                ),
                              ],
                            )
                          else
                            Column(
                              children: [
                                _LeftColumn(
                                  bodyFontSize: bodyFontSize,
                                  sectionTitleSize: sectionTitleSize,
                                ),
                                const SizedBox(height: 48),
                                _RightColumn(
                                  bodyFontSize: bodyFontSize,
                                  sectionTitleSize: sectionTitleSize,
                                ),
                              ],
                            ),
                          const SizedBox(height: 150),
                        ],
                      ),
                    ),
                  ),
                ),
                // ----- FOOTER / NAVIGATION -----
                Positioned(
                  bottom: !isDesktop?20:40,
                  right: !isDesktop?20:40,
                  child: _ProjectsNavigation(
                    isMobile: !isDesktop,
                    screenWidth: screenWidth,
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

// ---------------------------------------------------------------------
//  APP BAR with theme toggle (restored and styled)
// ---------------------------------------------------------------------
class _AppBar extends StatelessWidget {
  final ThemeProvider themeProvider;
  const _AppBar({required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Optional: add a logo or name here
        const Spacer(),
        Container(
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(30),
          ),
          child: IconButton(
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Icon(
                themeProvider.themeMode == ThemeMode.dark
                    ? Icons.light_mode
                    : Icons.dark_mode,
                key: ValueKey(themeProvider.themeMode),
                color: colorScheme.onSurface,
              ),
            ),
            onPressed: themeProvider.toggleTheme,
            tooltip: 'Toggle theme',
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------
//  HERO: profile picture, name, title, social links + resume button
// ---------------------------------------------------------------------
class _HeroSection extends StatelessWidget {
  final double titleFontSize;
  final double subtitleFontSize;

  const _HeroSection({
    required this.titleFontSize,
    required this.subtitleFontSize,
  });

  @override
  Widget build(BuildContext context) {
    // final colorScheme = Theme.of(context).colorScheme;
    return LayoutBuilder(
      builder: (context, constraints) {
        final isRowLayout = constraints.maxWidth > 700;

        if (isRowLayout) {
          return Row(
            children: [
              // Profile image (placeholder)
              const _ProfileAvatar(radius: 100),
              const SizedBox(width: 48),
              // Text + buttons
              Expanded(
                child: _HeroText(
                  titleFontSize: titleFontSize,
                  subtitleFontSize: subtitleFontSize,
                ),
              ),
            ],
          );
        } else {
          return Column(
            children: [
              const _ProfileAvatar(radius: 80),
              const SizedBox(height: 24),
              _HeroText(
                titleFontSize: titleFontSize,
                subtitleFontSize: subtitleFontSize,
              ),
            ],
          );
        }
      },
    );
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
          'assets/images/profile.jpeg',
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
  const _HeroText({
    required this.titleFontSize,
    required this.subtitleFontSize,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'HI! I am',
          style: GoogleFonts.raleway(
            fontSize: subtitleFontSize * 0.75,
            fontWeight: FontWeight.w300,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              'Nagi El-Shershaby',
              style: GoogleFonts.raleway(
                fontSize: titleFontSize,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.5,
                color: colorScheme.onSurface,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Flutter Developer',
          style: GoogleFonts.raleway(
            fontSize: subtitleFontSize,
            fontWeight: FontWeight.w400,
            color: colorScheme.primary,
          ),
        ),
        const SizedBox(height: 24),
        const Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            _SocialIconButton(
              icon: FontAwesomeIcons.googlePlay,
              url: 'https://play.google.com/store/apps/developer?id=Prof.+Nagi',
              label: 'Google Play',
            ),
            _SocialIconButton(
              icon: FontAwesomeIcons.github,
              url: 'https://github.com/nagiElshershaby',
              label: 'GitHub',
            ),
            _SocialIconButton(
              icon: Icons.mail_outline,
              url: 'mailto:nagielshershaby@gmail.com',
              label: 'Email',
            ),
            _SocialIconButton(
              icon: FontAwesomeIcons.linkedin,
              url: 'https://eg.linkedin.com/in/nagi-el-shershaby-85660a231',
              label: 'LinkedIn',
            ),
          ],
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------
//  Social icon button with hover effect (web)
// ---------------------------------------------------------------------
class _SocialIconButton extends StatefulWidget {
  final IconData icon;
  final String url;
  final String label;

  const _SocialIconButton({
    required this.icon,
    required this.url,
    required this.label,
  });

  @override
  State<_SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<_SocialIconButton> {
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
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
              Icon(widget.icon,
                  size: 18,
                  color: _isHovered
                      ? colorScheme.onPrimary
                      : colorScheme.onSurface),
              const SizedBox(width: 6),
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 14,
                  color: _isHovered
                      ? colorScheme.onPrimary
                      : colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------
//  LEFT COLUMN: About, Education, Graduation Project, Languages
// ---------------------------------------------------------------------
class _LeftColumn extends StatelessWidget {
  final double bodyFontSize;
  final double sectionTitleSize;

  const _LeftColumn({
    required this.bodyFontSize,
    required this.sectionTitleSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle(title: 'About', fontSize: sectionTitleSize),
        const SizedBox(height: 16),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color:
                  Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              'Passionate about creating meaningful digital experiences that simplify lives and solve real-world problems. As a Flutter developer, I focus on building efficient, user-friendly applications that blend functionality with intuitive design. Driven by a desire to continuously learn and innovate, I thrive in collaborative environments where I can contribute to impactful projects and grow alongside my team.',
              style: GoogleFonts.raleway(
                fontSize: bodyFontSize,
                height: 1.6,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ),
        const SizedBox(height: 40),
        _SectionTitle(title: 'Education', fontSize: sectionTitleSize),
        const SizedBox(height: 16),
        _InfoCard(
          title: 'Bachelor of Computer Science',
          subtitle: 'FCAI - Cairo University, Egypt',
          date: '2020 - 2024',
          bodyFontSize: bodyFontSize,
        ),
        const SizedBox(height: 32),
        _SectionTitle(title: 'Graduation Project', fontSize: sectionTitleSize),
        const SizedBox(height: 16),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color:
                  Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Environmental Data Processing System',
                  style: GoogleFonts.raleway(
                    fontSize: bodyFontSize + 2,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '• Built a Flask-based backend for processing and visualizing complex NetCDF environmental datasets.\n'
                  '• Integrated Firebase for storage and database management.\n'
                  '• Led the project team, managed tasks, communicated with supervisors, and ensured timely delivery.',
                  style: GoogleFonts.raleway(
                    fontSize: bodyFontSize,
                    height: 1.6,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 32),
        _SectionTitle(title: 'Languages', fontSize: sectionTitleSize),
        const SizedBox(height: 16),
        const Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _LanguageChip(label: 'Arabic (Native)'),
            _LanguageChip(label: 'English (Professional)'),
          ],
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------
//  RIGHT COLUMN: Experience, Skills
// ---------------------------------------------------------------------
class _RightColumn extends StatelessWidget {
  final double bodyFontSize;
  final double sectionTitleSize;

  const _RightColumn({
    required this.bodyFontSize,
    required this.sectionTitleSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle(title: 'Experience', fontSize: sectionTitleSize),
        const SizedBox(height: 16),
        _ExperienceTile(
          title: 'Mid Level Flutter Developer',
          company: 'HarmoniQ Innovation Technology',
          date: 'June 2025 - Present',
          bodyFontSize: bodyFontSize,
        ),
        _ExperienceTile(
          title: 'Junior Flutter Developer',
          company: 'Tuwaiq',
          date: 'March 2024 - June 2025',
          bodyFontSize: bodyFontSize,
        ),
        _ExperienceTile(
          title: 'Flutter Instructor',
          company: 'Microsoft Student Partner',
          date: 'April 2023 - July 2023',
          bodyFontSize: bodyFontSize,
        ),
        const SizedBox(height: 40),
        _SectionTitle(title: 'Skills', fontSize: sectionTitleSize),
        const SizedBox(height: 16),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color:
                  Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(24),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _SkillChip(label: 'Flutter'),
                _SkillChip(label: 'Dart'),
                _SkillChip(label: 'Firebase'),
                _SkillChip(label: 'Git'),
                _SkillChip(label: 'GitHub'),
                _SkillChip(label: 'Figma'),
                _SkillChip(label: 'Provider'),
                _SkillChip(label: 'Bloc'),
                _SkillChip(label: 'Dio'),
                _SkillChip(label: 'Shared Preferences'),
                _SkillChip(label: 'Hive'),
                _SkillChip(label: 'REST API'),
                _SkillChip(label: 'JSON'),
                _SkillChip(label: 'Caching'),
                _SkillChip(label: 'Unit Test'),
                _SkillChip(label: 'Localization'),
                _SkillChip(label: 'Clean Architecture'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------
//  Reusable components
// ---------------------------------------------------------------------
class _SectionTitle extends StatelessWidget {
  final String title;
  final double fontSize;
  const _SectionTitle({required this.title, required this.fontSize});

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

class _InfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final double bodyFontSize;

  const _InfoCard({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.bodyFontSize,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.raleway(
              fontSize: bodyFontSize + 2,
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: GoogleFonts.raleway(
              fontSize: bodyFontSize,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            date,
            style: GoogleFonts.raleway(
              fontSize: bodyFontSize - 2,
              color: colorScheme.primary,
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
  final double bodyFontSize;

  const _ExperienceTile({
    required this.title,
    required this.company,
    required this.date,
    required this.bodyFontSize,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 4),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.raleway(
                    fontSize: bodyFontSize + 1,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  company,
                  style: GoogleFonts.raleway(
                    fontSize: bodyFontSize,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: GoogleFonts.raleway(
                    fontSize: bodyFontSize - 2,
                    color: colorScheme.primary,
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
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
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

class _LanguageChip extends StatelessWidget {
  final String label;
  const _LanguageChip({required this.label});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: GoogleFonts.raleway(
          fontSize: 14,
          color: colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------
//  FOOTER: Projects navigation arrow (animated)
// ---------------------------------------------------------------------
class _ProjectsNavigation extends StatelessWidget {
  final bool isMobile;
  final double screenWidth;

  const _ProjectsNavigation({
    required this.isMobile,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ProjectsPage()),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 32,
              vertical: isMobile ? 10 : 14,
            ),
            decoration: BoxDecoration(
              color: colorScheme.primary.withValues(alpha: .7),
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.shadow.withValues(alpha: .5),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
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
                    color: colorScheme.onPrimary,
                  ),
                ),
                const SizedBox(width: 16),
                Icon(
                  Icons.arrow_forward,
                  color: colorScheme.onPrimary,
                  size: isMobile ? 24 : 28,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
