import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Icon + label button used in the hero section for social links.
/// Animates background fill and scale on hover.
class SocialIconButton extends StatefulWidget {
  final IconData icon;
  final String url;
  final String label;

  const SocialIconButton({
    super.key,
    required this.icon,
    required this.url,
    required this.label,
  });

  @override
  State<SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<SocialIconButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () async {
          final uri = Uri.parse(widget.url);
          if (await canLaunchUrl(uri)) launchUrl(uri);
        },
        child: AnimatedScale(
          scale: _hovered ? 1.06 : 1.0,
          duration: const Duration(milliseconds: 150),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: _hovered ? cs.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: _hovered ? cs.primary : cs.outline,
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  widget.icon,
                  size: 18,
                  color: _hovered ? cs.onPrimary : cs.onSurface,
                ),
                const SizedBox(width: 6),
                Text(
                  widget.label,
                  style: TextStyle(
                    fontSize: 14,
                    color: _hovered ? cs.onPrimary : cs.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
