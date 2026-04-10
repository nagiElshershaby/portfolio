import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Shared section heading with a coloured left-accent bar.
class SectionTitle extends StatelessWidget {
  final String title;
  final double fontSize;

  const SectionTitle({
    super.key,
    required this.title,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 4,
          height: fontSize * 1.1,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: GoogleFonts.raleway(
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
            color: color,
          ),
        ),
      ],
    );
  }
}
