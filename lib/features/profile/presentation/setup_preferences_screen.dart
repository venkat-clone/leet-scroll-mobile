import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/core/network/request_status.dart';
import 'package:mobile/features/feed/presentation/styles/app_theme.dart';
import '../logic/preferences/edit_preferences_cubit.dart';

enum HighlightStatus { language, topics, none }

@RoutePage()
class SetupPreferencesScreen extends StatefulWidget {
  const SetupPreferencesScreen({
    super.key,
    // required this.preferences,
    // required this.highlightStatus,
  });

  @override
  State<SetupPreferencesScreen> createState() => _SetupPreferencesScreenState();
}

class _SetupPreferencesScreenState extends State<SetupPreferencesScreen> {
  @override
  void initState() {
    context.read<EditPreferencesCubit>().getTags(null);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final outfitStyle = GoogleFonts.outfit(color: AppTheme.white);

    return Scaffold(
      // backgroundColor: AppTheme.black,
      appBar: AppBar(
        // backgroundColor: AppTheme.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppTheme.white,
            size: 20,
          ),
          onPressed: () => context.router.back(),
        ),
        title: Text(
          'Preferences',
          style: outfitStyle.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          BlocBuilder<EditPreferencesCubit, EditPreferencesState>(
            buildWhen: (previous, current) =>
                previous.modified != current.modified ||
                previous.original != current.original,
            builder: (context, state) {
              final hasChanges = state.modified != state.original;
              final onPressed = hasChanges
                  ? () => context.read<EditPreferencesCubit>().savePreferences()
                  : null;
              return TextButton(
                onPressed: onPressed,
                child: Text(
                  'Done',
                  style: outfitStyle.copyWith(
                    color: hasChanges
                        ? AppTheme.successGreen
                        : AppTheme.grey600,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Favorite Languages',
                  style: outfitStyle.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Select up to 10',
                  style: GoogleFonts.outfit(
                    color: AppTheme.grey600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const LanguagesGrid(),
            const SizedBox(height: 32),
            const Divider(color: AppTheme.dividerColor),
            const SizedBox(height: 32),
            Text(
              'Tags of Interest',
              style: outfitStyle.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SearchBar(),
            const SizedBox(height: 24),
            const TagsSection(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class LanguagesGrid extends StatelessWidget {
  const LanguagesGrid({super.key});

  static const List<Map<String, dynamic>> languages = [
    {'name': 'Python', 'icon': Icons.code},
    {'name': 'JavaScript', 'icon': Icons.javascript},
    {'name': 'C++', 'icon': Icons.settings_applications},
    {'name': 'Java', 'icon': Icons.coffee},
    {'name': 'TypeScript', 'icon': Icons.code},
    {'name': 'Dart', 'icon': Icons.flutter_dash},
    {'name': 'Ruby', 'icon': Icons.diamond},
    {'name': 'Go', 'icon': Icons.terminal},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: BlocBuilder<EditPreferencesCubit, EditPreferencesState>(
        buildWhen: (previous, current) =>
            previous.modified.preferredLanguages.length !=
                current.modified.preferredLanguages.length ||
            previous.modified.preferredLanguages !=
                current.modified.preferredLanguages,
        builder: (context, state) {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: languages.length,
            separatorBuilder: (_, __) => const SizedBox(width: 20),
            itemBuilder: (context, index) {
              final lang = languages[index];
              final String name = lang['name'] as String;
              final bool isSelected = state.modified.preferredLanguages
                  .contains(name);

              return LanguageItem(
                name: name,
                icon: lang['icon'] as IconData,
                isSelected: isSelected,
              );
            },
          );
        },
      ),
    );
  }
}

class LanguageItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final bool isSelected;

  const LanguageItem({
    super.key,
    required this.name,
    required this.icon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<EditPreferencesCubit>().toggleLanguage(name),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.surfaceBlack,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppTheme.successGreen : AppTheme.white05,
            width: 1.5,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppTheme.white05,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      icon,
                      color: isSelected
                          ? AppTheme.successGreen
                          : AppTheme.grey600,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    name,
                    style: GoogleFonts.outfit(
                      color: isSelected
                          ? AppTheme.white
                          : AppTheme.tertiaryText,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 22),
                ],
              ),
            ),
            if (isSelected)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: AppTheme.successGreen,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceBlack,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.white05),
      ),
      child: TextField(
        style: const TextStyle(color: AppTheme.white),
        onChanged: (value) =>
            context.read<EditPreferencesCubit>().getTags(value),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search, color: AppTheme.grey),
          hintText: "Find topics like 'Dynamic Programming'...",
          hintStyle: GoogleFonts.outfit(color: AppTheme.grey700, fontSize: 14),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
}

class TagsSection extends StatelessWidget {
  const TagsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionLabel(text: 'YOUR TAGS'),
        const SizedBox(height: 12),
        RepaintBoundary(
          child: BlocBuilder<EditPreferencesCubit, EditPreferencesState>(
            buildWhen: (previous, current) =>
                previous.modified.preferredTopics !=
                current.modified.preferredTopics,
            builder: (context, state) {
              return Wrap(
                spacing: 8,
                runSpacing: 10,
                children: state.modified.preferredTopics
                    .map((tag) => Tag(label: tag, isSelected: true))
                    .toList(),
              );
            },
          ),
        ),
        const SizedBox(height: 32),
        const SectionLabel(text: 'SUGGESTED FOR YOU'),
        const SizedBox(height: 12),
        RepaintBoundary(
          child: BlocBuilder<EditPreferencesCubit, EditPreferencesState>(
            buildWhen: (previous, current) =>
                previous.dropdownStatus != current.dropdownStatus ||
                previous.dropdownItems != current.dropdownItems ||
                previous.modified.preferredTopics !=
                    current.modified.preferredTopics,
            builder: (context, state) {
              if (state.dropdownStatus == RequestStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppTheme.successGreen,
                  ),
                );
              }
              return Wrap(
                spacing: 8,
                runSpacing: 10,
                children: state.dropdownItems
                    .map((tag) => Tag(label: tag, isSelected: false))
                    .toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}

class SectionLabel extends StatelessWidget {
  final String text;

  const SectionLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.outfit(
        color: AppTheme.grey600,
        fontSize: 12,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.5,
      ),
    );
  }
}

class Tag extends StatelessWidget {
  final String label;
  final bool isSelected;

  const Tag({super.key, required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isSelected) {
          context.read<EditPreferencesCubit>().removeTag(label);
        } else {
          context.read<EditPreferencesCubit>().addTag(label);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.successGreen : AppTheme.surfaceBlack,
          borderRadius: BorderRadius.circular(20),
          border: isSelected ? null : Border.all(color: AppTheme.white05),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: GoogleFonts.outfit(
                color: isSelected ? AppTheme.black : AppTheme.tertiaryText,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 6),
            Icon(
              isSelected ? Icons.close : Icons.add,
              size: 14,
              color: isSelected ? AppTheme.black : AppTheme.grey600,
            ),
          ],
        ),
      ),
    );
  }
}
