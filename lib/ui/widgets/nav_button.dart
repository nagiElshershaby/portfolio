import 'package:flutter/material.dart';

/// Circular navigation arrow used in the projects screen.
class NavButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool isDesktop;

  const NavButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.isDesktop = false,
  });

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final size = widget.isDesktop ? 56.0 : 48.0;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _hovered ? 1.1 : 1.0,
          duration: const Duration(milliseconds: 150),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: _hovered
                  ? cs.primary
                  : cs.surfaceContainerHighest.withValues(alpha: 0.5),
              shape: BoxShape.circle,
              boxShadow: _hovered
                  ? [
                      BoxShadow(
                        color: cs.shadow.withValues(alpha: 0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      )
                    ]
                  : null,
            ),
            child: Icon(
              widget.icon,
              color: _hovered ? cs.onPrimary : cs.onSurface,
              size: widget.isDesktop ? 24 : 20,
            ),
          ),
        ),
      ),
    );
  }
}
