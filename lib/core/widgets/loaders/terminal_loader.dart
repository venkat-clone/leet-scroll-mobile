import 'package:flutter/material.dart';

class TerminalLoader extends StatefulWidget {
  final String? text; // Optional text to show next to the spinner
  final Color? color;
  final double size;

  const TerminalLoader({super.key, this.text, this.color, this.size = 24.0});

  @override
  State<TerminalLoader> createState() => _TerminalLoaderState();
}

class _TerminalLoaderState extends State<TerminalLoader>
    with SingleTickerProviderStateMixin {
  final List<String> chars = ['⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏'];

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 80), // Fast like real terminals
    )..repeat(); // Repeats from 0 to 1 indefinitely
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            // Map animation value (0.0 to 1.0) to character index
            int index =
                (_controller.value * chars.length).floor() % chars.length;
            return Text(
              chars[index],
              style: TextStyle(
                fontSize: widget.size,
                color: widget.color ?? Theme.of(context).colorScheme.primary,
                fontFamily: 'Monospace', // Ensures proper alignment
              ),
            );
          },
        ),
        if (widget.text != null) ...[
          const SizedBox(width: 12),
          Text(
            widget.text!,
            style: TextStyle(
              fontSize: widget.size * 0.8,
              color: widget.color ?? Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ],
    );
  }
}
