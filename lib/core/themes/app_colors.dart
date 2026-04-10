import 'package:flutter/material.dart';

/// Handcrafted black-and-white palette — zero colour tinting.
class AppColors {
  AppColors._();

  // ── Dark palette ──────────────────────────────────────────────────────────
  static const Color darkSurface           = Color(0xFF080808); // page bg
  static const Color darkCard              = Color(0xFF111111); // card bg
  static const Color darkPrimary           = Color(0xFFEEEEEE); // accent / chips
  static const Color darkOnPrimary         = Color(0xFF080808);
  static const Color darkOnSurface         = Color(0xFFEEEEEE); // body text
  static const Color darkOnSurfaceVariant  = Color(0xFF888888); // secondary text
  static const Color darkOutline           = Color(0xFF2A2A2A); // borders

  // ── Light palette ─────────────────────────────────────────────────────────
  static const Color lightSurface          = Color(0xFFFFFFFF); // page bg
  static const Color lightCard             = Color(0xFFF7F7F7); // card bg
  static const Color lightPrimary          = Color(0xFF111111); // accent / chips
  static const Color lightOnPrimary        = Color(0xFFFFFFFF);
  static const Color lightOnSurface        = Color(0xFF111111); // body text
  static const Color lightOnSurfaceVariant = Color(0xFF666666); // secondary text
  static const Color lightOutline          = Color(0xFFDDDDDD); // borders
}
