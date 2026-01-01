import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:google_fonts/google_fonts.dart';

/// Centralized theme configuration for the app
class AppTheme {
  AppTheme._();

  // Base Colors
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color red = Color(0xFFF44336);
  static const Color transparent = Color(0x00000000);

  // Surface Colors
  static const Color surfaceDark = Color(0xFF212121); // grey[900]
  static const Color surfaceLight = Color(0xFF2C2C2C); // grey[850]
  static const Color surfaceMedium = Color(0xFF424242); // grey[800]
  static const Color surfaceSubtle = Color(
    0x80212121,
  ); // grey[900] with 0.5 opacity
  static const Color surfaceBlack = Color(0xFF121212);
  static const Color dividerColor = Color(0xFF1A1A1A);
  static const Color primary = Color(0xff00c950);

  // Dracula Theme Colors
  static const Color draculaBackground = Color(0xFF282A36);
  static const Color draculaCurrentLine = Color(0xFF44475A);
  static const Color draculaForeground = Color(0xFFF8F8F2);
  static const Color draculaComment = Color(0xFF6272A4);
  static const Color draculaCyan = Color(0xFF8BE9FD);
  static const Color draculaGreen = Color(0xFF50FA7B);
  static const Color draculaOrange = Color(0xFFFFB86C);
  static const Color draculaPink = Color(0xFFFF79C6);
  static const Color draculaPurple = Color(0xFFBD93F9);
  static const Color draculaRed = Color(0xFFFF5555);
  static const Color draculaYellow = Color(0xFFF1FA8C);

  // VS Code Theme Colors
  static const Color vsCodeBackground = Color(0xFF1E1E1E);
  static const Color vsCodeSidebarBg = Color(0xFF252526);
  static const Color vsCodeInputBg = Color(0xFF3E3E3E);
  static const Color vsCodeBorder = Color(0xFF3E3E3E);

  // Accent Colors
  static const Color accentGreen = Color(0xFF69F0AE); // greenAccent
  static const Color accentRed = Color(0xFFFF5252); // redAccent
  static const Color accentBlue = Color(0xFF448AFF); // blueAccent
  static const Color accentPink = Color(0xFFFF4081); // pinkAccent
  static const Color accentOrange = Color(0xFFFF9800); // orange
  static const Color successGreen = Color(0xFF4CAF50);

  // Glow & Border Colors
  static const Color glowGreen = Color(0x334CAF50); // green with 0.2 opacity
  static const Color borderGreen = Color(0x804CAF50); // green with 0.5 opacity
  static const Color white05 = Color(0x0DFFFFFF); // white with 0.05 opacity

  static const Color statIconGreenBg = Color(
    0x1A4CAF50,
  ); // green with 0.1 opacity
  static const Color statIconRedBg = Color(
    0x1AFF5252,
  ); // redAccent with 0.1 opacity
  static const Color statIconBlueBg = Color(
    0x1A448AFF,
  ); // blueAccent with 0.1 opacity
  static const Color statIconPinkBg = Color(
    0x1AFF4081,
  ); // pinkAccent with 0.1 opacity
  static const Color statIconOrangeBg = Color(
    0x1AFF9800,
  ); // orange with 0.1 opacity

  // Text Colors
  static const Color primaryText = Color(0xFFFFFFFF);
  static const Color secondaryText = Color(0xFFE0E0E0); // grey[300]
  static const Color tertiaryText = Color(0xFFBDBDBD); // grey[400]
  static const Color greyText = Color(0xFF9E9E9E);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey700 = Color(0xFF616161);

  static const Color errorColor = Color(0xFFF44336);
  static const Color successColor = Color(0xFF4CAF50);

  // Optimization: Pre-defined Shadows
  static const List<BoxShadow> profileGlow = [
    BoxShadow(color: glowGreen, blurRadius: 20, spreadRadius: 10),
  ];

  /// Get difficulty color based on difficulty level
  static Color getDifficultyColor(String difficulty) {
    switch (difficulty.toUpperCase()) {
      case 'EASY':
        return draculaGreen;
      case 'MEDIUM':
        return draculaOrange;
      case 'HARD':
        return draculaRed;
      default:
        return grey;
    }
  }

  /// Get difficulty text color (for contrast)
  static Color getDifficultyTextColor(String difficulty) {
    return black;
  }

  /// Common text styles
  static TextStyle get titleStyle => GoogleFonts.firaCode(
    color: primaryText,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get bodyStyle =>
      GoogleFonts.firaCode(color: secondaryText, fontSize: 15, height: 1.5);

  static TextStyle get codeStyle => GoogleFonts.firaCode(fontSize: 14);

  static TextStyle get commentStyle =>
      GoogleFonts.firaCode(color: draculaComment, fontSize: 14);

  static TextStyle get labelStyle =>
      GoogleFonts.firaCode(color: tertiaryText, fontSize: 12);

  static TextStyle get chipTextStyle =>
      const TextStyle(color: black, fontSize: 12, fontWeight: FontWeight.bold);

  /// Markdown style sheet for title
  static MarkdownStyleSheet getTitleMarkdownStyle(BuildContext context) {
    return MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
      p: titleStyle,
      codeblockDecoration: BoxDecoration(
        color: const Color(0xFFF5F5F5), // grey[100]
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE0E0E0)), // grey[300]
      ),
      codeblockPadding: const EdgeInsets.all(16),
    );
  }

  /// Markdown style sheet for body/description
  static MarkdownStyleSheet getBodyMarkdownStyle(BuildContext context) {
    return MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
      p: bodyStyle,
      code: GoogleFonts.firaCode(
        backgroundColor: draculaBackground,
        color: draculaPink,
      ),
      codeblockDecoration: BoxDecoration(
        color: draculaBackground,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: draculaCurrentLine),
      ),
      codeblockPadding: const EdgeInsets.all(16),
    );
  }

  /// Markdown style sheet for options
  static MarkdownStyleSheet getOptionMarkdownStyle(BuildContext context) {
    return MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
      p: GoogleFonts.firaCode(color: secondaryText, fontSize: 14),
      code: GoogleFonts.firaCode(backgroundColor: vsCodeInputBg, fontSize: 13),
    );
  }

  /// Markdown style sheet for explanation
  static MarkdownStyleSheet getExplanationMarkdownStyle(BuildContext context) {
    return MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
      p: GoogleFonts.firaCode(color: secondaryText, fontSize: 14),
      code: GoogleFonts.firaCode(
        backgroundColor: vsCodeBackground,
        fontSize: 13,
      ),
    );
  }

  /// Common padding values
  static const EdgeInsets cardPadding = EdgeInsets.all(16.0);
  static const EdgeInsets horizontalPadding = EdgeInsets.symmetric(
    horizontal: 16.0,
  );
  static const EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 6.0);
  static const EdgeInsets optionPadding = EdgeInsets.symmetric(
    horizontal: 16.0,
    vertical: 6.0,
  );
  static const EdgeInsets buttonPadding = EdgeInsets.all(12);

  /// Common border radius
  static BorderRadius get cardRadius => BorderRadius.circular(8);
  static BorderRadius get buttonRadius => BorderRadius.circular(4);
  static BorderRadius get sheetRadius =>
      const BorderRadius.vertical(top: Radius.circular(20));

  /// Common spacing
  static const double spacingSmall = 8.0;
  static const double spacingMedium = 16.0;
  static const double spacingLarge = 24.0;
}
