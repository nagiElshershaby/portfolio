import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => _build(
        cs: ColorScheme.light().copyWith(
          primary:                  AppColors.lightPrimary,
          onPrimary:                AppColors.lightOnPrimary,
          primaryContainer:         AppColors.lightCard,
          onPrimaryContainer:       AppColors.lightOnSurface,
          surface:                  AppColors.lightSurface,
          onSurface:                AppColors.lightOnSurface,
          onSurfaceVariant:         AppColors.lightOnSurfaceVariant,
          surfaceContainerHighest:  AppColors.lightCard,
          outline:                  AppColors.lightOutline,
          outlineVariant:           AppColors.lightOutline,
          inverseSurface:           AppColors.darkSurface,
          onInverseSurface:         AppColors.darkOnSurface,
          inversePrimary:           AppColors.darkPrimary,
          // Remove M3 surface tinting entirely
          surfaceTint:              const Color(0x00000000),
        ),
        textBase: ThemeData.light().textTheme,
      );

  static ThemeData get darkTheme => _build(
        cs: ColorScheme.dark().copyWith(
          primary:                  AppColors.darkPrimary,
          onPrimary:                AppColors.darkOnPrimary,
          primaryContainer:         AppColors.darkCard,
          onPrimaryContainer:       AppColors.darkOnSurface,
          surface:                  AppColors.darkSurface,
          onSurface:                AppColors.darkOnSurface,
          onSurfaceVariant:         AppColors.darkOnSurfaceVariant,
          surfaceContainerHighest:  AppColors.darkCard,
          outline:                  AppColors.darkOutline,
          outlineVariant:           AppColors.darkOutline,
          inverseSurface:           AppColors.lightSurface,
          onInverseSurface:         AppColors.lightOnSurface,
          inversePrimary:           AppColors.lightPrimary,
          surfaceTint:              const Color(0x00000000),
        ),
        textBase: ThemeData.dark().textTheme,
      );

  static ThemeData _build({
    required ColorScheme cs,
    required TextTheme textBase,
  }) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: cs,
      scaffoldBackgroundColor: cs.surface,
      textTheme: GoogleFonts.ralewayTextTheme(textBase),
      cardTheme: CardThemeData(
        color: cs.surfaceContainerHighest,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: cs.outline, width: 1),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: cs.primaryContainer,
        labelStyle: GoogleFonts.raleway(
          color: cs.onPrimaryContainer,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      dividerTheme: DividerThemeData(color: cs.outline, thickness: 1),
    );
  }
}
