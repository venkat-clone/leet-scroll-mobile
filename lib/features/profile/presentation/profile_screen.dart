import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mobile/features/feed/logic/home/home_cubit.dart';
import 'package:mobile/features/feed/presentation/styles/app_theme.dart';
import 'package:mobile/features/profile/data/models/preferences/user_preferences_model.dart';
import 'package:mobile/features/profile/data/models/stats/profile_stats_model.dart';
import '../../../core/router/app_router.gr.dart';
import '../../feed/logic/feed_cubit.dart';
import '../logic/profile_cubit.dart';
import '../../auth/logic/auth_cubit.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    context.read<ProfileCubit>().loadProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final outfitStyle = GoogleFonts.outfit(color: AppTheme.white);
    final monoStyle = GoogleFonts.jetBrainsMono(
      color: AppTheme.grey,
      fontSize: 12,
    );
    // return Text("Profile Scrwwn");
    return Scaffold(
      backgroundColor: AppTheme.black,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.white),
          onPressed: () => context.router.back(),
        ),
        title: Text(
          'Profile',
          style: outfitStyle.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: AppTheme.white),
            onPressed: () {},
          ),
        ],
        backgroundColor: AppTheme.transparent,
        elevation: 0,
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (profile) {
              // return Text("data");
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    // Profile Image with Glow
                    const RepaintBoundary(child: _ProfileHeader()),
                    const SizedBox(height: 20),
                    Text(
                      profile.user.name,
                      style: outfitStyle.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.surfaceDark,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.alternate_email,
                            size: 14,
                            color: AppTheme.grey,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            profile.user.email.split('@').first,
                            style: monoStyle,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    const _SectionHeader(
                      title: 'PERFORMANCE',
                      action: 'View History',
                    ),
                    const SizedBox(height: 12),
                    _PerformanceCard(stats: profile.stats),
                    const SizedBox(height: 32),
                    const _SectionHeader(title: 'PREFERENCES'),
                    const SizedBox(height: 12),
                    _PreferencesCard(preferences: profile.preferences),
                    const SizedBox(height: 32),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            final List<HydratedCubit> cubits = [
                              context.read<HomeCubit>(),
                              context.read<ProfileCubit>(),
                              context.read<FeedCubit>(),
                            ];
                            context.read<AuthCubit>().clearCache(cubits);
                          },
                          icon: const Icon(
                            Icons.delete_outline,
                            color: AppTheme.red,
                          ),
                          label: const Text(
                            'Clear Cache',
                            style: TextStyle(color: AppTheme.red),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () => context.read<AuthCubit>().logout(),
                          icon: Icon(Icons.logout, color: AppTheme.red),
                          label: const Text(
                            'Logout',
                            style: TextStyle(color: AppTheme.red),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              );
            },
            error: (message) => Center(
              child: Column(
                children: [
                  Text('Error: $message'),
                  TextButton(
                    onPressed: () {
                      context.read<AuthCubit>().logout();
                    },
                    child: Text("Logout"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    final profile = (context.read<ProfileCubit>().state as dynamic).profile;
    return Center(
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: AppTheme.profileGlow,
              border: Border.fromBorderSide(
                BorderSide(color: AppTheme.borderGreen, width: 1),
              ),
            ),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: AppTheme.surfaceDark,
              backgroundImage: profile.user.avatar != null
                  ? NetworkImage(profile.user.avatar!)
                  : null,
              child: profile.user.avatar == null
                  ? const Icon(Icons.person, size: 60, color: AppTheme.grey)
                  : null,
            ),
          ),
          Positioned(
            bottom: 5,
            right: 5,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppTheme.surfaceDark,
                shape: BoxShape.circle,
                border: Border.all(color: AppTheme.black, width: 2),
              ),
              child: const Icon(
                Icons.edit,
                size: 12,
                color: AppTheme.accentGreen,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String? action;

  const _SectionHeader({required this.title, this.action});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.outfit(
            color: AppTheme.grey,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        if (action != null)
          InkWell(
            onTap: () {
              context.router.push(SubmissionHistoryRoute());
            },
            child: Text(
              action!,
              style: GoogleFonts.outfit(
                color: AppTheme.accentGreen,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }
}

class _PerformanceCard extends StatelessWidget {
  final ProfileStatsModel stats;

  const _PerformanceCard({required this.stats});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceSubtle,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppTheme.surfaceLight),
      ),
      child: Column(
        children: [
          _StatItem(
            icon: Icons.check_circle,
            iconColor: AppTheme.accentGreen,
            iconBgColor: AppTheme.statIconGreenBg,
            label: 'Correct Answers',
            value: stats.correctAnswers,
            progress: 0.7,
            progressColor: AppTheme.accentOrange,
            secondaryProgressColor: AppTheme.accentGreen,
          ),
          _StatItem(
            icon: Icons.cancel,
            iconColor: AppTheme.accentRed,
            iconBgColor: AppTheme.statIconRedBg,
            label: 'Wrong Answers',
            value: stats.wrongAnswers,
            progress: 0.6,
            progressColor: AppTheme.accentOrange,
            secondaryProgressColor: AppTheme.accentRed,
          ),
          _StatItem(
            icon: Icons.loop,
            iconColor: AppTheme.accentBlue,
            iconBgColor: AppTheme.statIconBlueBg,
            label: 'Attempted',
            value: stats.questionsAttempted,
            progress: 0.4,
            progressColor: AppTheme.accentBlue,
            secondaryProgressColor: AppTheme.surfaceMedium,
            isLast: true,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Text(
                  'Accuracy Rate',
                  style: GoogleFonts.outfit(color: AppTheme.grey, fontSize: 14),
                ),
                const Spacer(),
                Text(
                  '75%',
                  style: GoogleFonts.jetBrainsMono(
                    color: AppTheme.accentGreen,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 12),
                SizedBox(
                  width: 80,
                  height: 6,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: const LinearProgressIndicator(
                      value: 0.75,
                      backgroundColor: AppTheme.surfaceMedium,
                      valueColor: AlwaysStoppedAnimation(AppTheme.accentGreen),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String label;
  final int value;
  final double progress;
  final Color progressColor;
  final Color secondaryProgressColor;
  final bool isLast;

  const _StatItem({
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.label,
    required this.value,
    required this.progress,
    required this.progressColor,
    required this.secondaryProgressColor,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconBgColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          label,
                          style: GoogleFonts.outfit(
                            color: AppTheme.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '$value',
                          style: GoogleFonts.jetBrainsMono(
                            color: AppTheme.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: AppTheme.grey,
                          size: 20,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Stack(
                      children: [
                        Container(
                          height: 6,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppTheme.surfaceLight,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                        FractionallySizedBox(
                          widthFactor: progress,
                          child: Container(
                            height: 6,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [secondaryProgressColor, progressColor],
                              ),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          if (!isLast) const Divider(color: AppTheme.surfaceLight, height: 1),
        ],
      ),
    );
  }
}

class _PreferencesCard extends StatelessWidget {
  final UserPreferencesModel preferences;

  const _PreferencesCard({required this.preferences});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.surfaceSubtle,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppTheme.surfaceLight),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              context.router.push(
                SetupPreferencesRoute(
                  // preferences: preferences, highlightStatus: HighlightStatus.none
                ),
              );
            },
            child: _PreferenceItem(
              icon: Icons.code,
              iconColor: AppTheme.accentPink,
              iconBgColor: AppTheme.statIconPinkBg,
              label: 'Preferred Language',
              trailing: preferences.preferredLanguages.join(","),
            ),
          ),
          const Divider(color: AppTheme.grey, height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: AppTheme.statIconOrangeBg,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.category,
                      color: AppTheme.accentOrange,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Topics of Interest',
                    style: GoogleFonts.outfit(
                      color: AppTheme.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Edit',
                    style: GoogleFonts.outfit(
                      color: AppTheme.grey,
                      fontSize: 12,
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: AppTheme.grey,
                    size: 20,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ...preferences.preferredTopics.map((s) => _Tag(label: s)),
                  const _AddTag(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PreferenceItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String label;
  final String trailing;

  const _PreferenceItem({
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.label,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: iconBgColor, shape: BoxShape.circle),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        const SizedBox(width: 16),
        Text(
          label,
          style: GoogleFonts.outfit(
            color: AppTheme.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        Expanded(
          child: Text(
            trailing,
            textAlign: TextAlign.end,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.jetBrainsMono(
              color: AppTheme.grey,
              fontSize: 12,
            ),
          ),
        ),
        const Icon(Icons.keyboard_arrow_right, color: AppTheme.grey, size: 20),
      ],
    );
  }
}

class _Tag extends StatelessWidget {
  final String label;

  const _Tag({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.surfaceLight,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.surfaceMedium),
      ),
      child: Text(
        label,
        style: GoogleFonts.outfit(color: AppTheme.grey, fontSize: 12),
      ),
    );
  }
}

class _AddTag extends StatelessWidget {
  const _AddTag();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppTheme.surfaceMedium,
          style: BorderStyle.solid,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.add, size: 14, color: AppTheme.grey),
          const SizedBox(width: 4),
          Text(
            'Add',
            style: GoogleFonts.outfit(color: AppTheme.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
