import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../feed/presentation/styles/app_theme.dart';

class BlinkingSubtitle extends StatefulWidget {
  const BlinkingSubtitle({super.key});

  @override
  State<BlinkingSubtitle> createState() => _BlinkingSubtitleState();
}

class _BlinkingSubtitleState extends State<BlinkingSubtitle>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.firaCode(fontSize: 14, color: Colors.grey[400]),
        children: [
          const TextSpan(text: "Master algorithms on the go "),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: FadeTransition(
              opacity: _controller,
              child: Text(
                "|",
                style: TextStyle(color: AppTheme.draculaGreen, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
