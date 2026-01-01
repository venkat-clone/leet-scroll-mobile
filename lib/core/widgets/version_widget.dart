import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/features/feed/presentation/styles/app_theme.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionWidget extends StatelessWidget {
  const VersionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getVersion(),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.hasData) {
          return Text(
            'v${asyncSnapshot.requireData}',
            style: GoogleFonts.jetBrainsMono(
              color: AppTheme.greyText.withValues(alpha: 0.5),
              fontSize: 12,
            ),
          );
        }
        return SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primary),
          ),
        );
      },
    );
  }

  Future<String> getVersion() async {
    return (await PackageInfo.fromPlatform()).version;
  }
}
