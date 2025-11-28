import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:google_fonts/google_fonts.dart';

/// Centralized theme configuration for the feed feature
class AppTheme {
  AppTheme._();

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

  // Semantic Colors
  static Color get successColor => draculaGreen;
  static Color get warningColor => draculaOrange;
  static Color get errorColor => draculaRed;
  static Color get infoColor => draculaCyan;

  // Text Colors
  static Color get primaryText => Colors.white;
  static Color get secondaryText => Colors.grey[300]!;
  static Color get tertiaryText => Colors.grey[400]!;

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
        return Colors.grey;
    }
  }

  /// Get difficulty text color (for contrast)
  static Color getDifficultyTextColor(String difficulty) {
    return Colors.black;
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

  static TextStyle get chipTextStyle => const TextStyle(
    color: Colors.black,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );

  /// Markdown style sheet for title
  static MarkdownStyleSheet getTitleMarkdownStyle(BuildContext context) {
    return MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
      p: titleStyle,
      codeblockDecoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
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
