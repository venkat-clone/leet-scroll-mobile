import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mobile/features/feed/presentation/styles/app_theme.dart';
import 'package:mobile/features/profile/logic/profile_cubit.dart';
import '../../profile/data/models/stats/profile_stats_model.dart';
import '../logic/leaderboard_cubit.dart';
import '../logic/leaderboard_state.dart';

@RoutePage()
class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  @override
  void initState() {
    context.read<LeaderboardCubit>().loadLeaderboard();
    context.read<ProfileCubit>().loadProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.black,
      body: SafeArea(
        child: BlocBuilder<LeaderboardCubit, LeaderboardState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (entries) {
                return CustomScrollView(
                  slivers: [
                    const SliverPadding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      sliver: SliverToBoxAdapter(child: _Header()),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      sliver: SliverToBoxAdapter(
                        child: BlocBuilder<ProfileCubit, ProfileState>(
                          builder: (context, profileState) {
                            return profileState.maybeWhen(
                              loaded: (profile) => _UserRankCard(
                                rank: profile.stats.rank, // Demo value
                                percentile:
                                    "Top ${profile.stats.percentile()}%",
                                points: profile.stats.score, // Mock calculation
                                solved: profile.stats.correctAnswers,
                                name: profile.user.name,
                                avatar: profile.user.avatar,
                                nextRankedUserPoints:
                                    profile.stats.nextRankedUserPoints,
                              ),
                              orElse: () => const SizedBox.shrink(),
                            );
                          },
                        ),
                      ),
                    ),
                    const SliverPadding(
                      padding: EdgeInsets.fromLTRB(20, 32, 20, 16),
                      sliver: SliverToBoxAdapter(
                        child: _SectionHeader(
                          title: 'TOP HACKERS',
                          icon: Icons.bar_chart,
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          final entry = entries[index];
                          return _LeaderboardItem(
                            rank: index + 1,
                            name: entry.name ?? 'Anonymous',
                            solved: entry.problemsSolved,
                            points: entry.score,
                          );
                        }, childCount: entries.length),
                      ),
                    ),
                    const SliverToBoxAdapter(child: SizedBox(height: 40)),
                  ],
                );
              },
              error: (message) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Error: $message',
                      style: const TextStyle(color: AppTheme.red),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () =>
                          context.read<LeaderboardCubit>().loadLeaderboard(),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.emoji_events, color: AppTheme.primary, size: 28),
            const SizedBox(width: 12),
            Text(
              'LEADERBOARD',
              style: GoogleFonts.outfit(
                color: AppTheme.primary,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: AppTheme.surfaceDark,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.filter_list,
                color: AppTheme.white,
                size: 20,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          'GLOBAL RANKINGS',
          style: GoogleFonts.outfit(
            color: AppTheme.grey600,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
        const SizedBox(height: 16),
        const Divider(color: AppTheme.surfaceLight, height: 1),
      ],
    );
  }
}

class _UserRankCard extends StatelessWidget {
  final int rank;
  final String percentile;
  final int points;
  final int solved;
  final String name;
  final int? nextRankedUserPoints;
  final String? avatar;

  const _UserRankCard({
    required this.rank,
    required this.percentile,
    required this.points,
    required this.solved,
    required this.name,
    this.avatar,
    this.nextRankedUserPoints,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppTheme.accentGreen.withValues(alpha: 0.3),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.accentGreen.withValues(alpha: 0.05),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.statIconGreenBg,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.circle,
                          color: AppTheme.primary,
                          size: 6,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'YOUR RANK',
                          style: GoogleFonts.outfit(
                            color: AppTheme.primary,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '#$rank',
                        style: GoogleFonts.outfit(
                          color: AppTheme.white,
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        percentile,
                        style: GoogleFonts.outfit(
                          color: AppTheme.grey600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'TOTAL POINTS',
                    style: GoogleFonts.outfit(
                      color: AppTheme.grey600,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    NumberFormat("#,###").format(points),
                    style: GoogleFonts.jetBrainsMono(
                      color: AppTheme.primary,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: AppTheme.black,
                    backgroundImage: avatar != null
                        ? NetworkImage(avatar!)
                        : null,
                    child: avatar == null
                        ? Text(
                            name.substring(0, 1).toUpperCase(),
                            style: const TextStyle(color: AppTheme.white),
                          )
                        : null,
                  ),
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: AppTheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '$rank',
                      style: const TextStyle(
                        color: AppTheme.black,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.outfit(
                      color: AppTheme.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: AppTheme.primary,
                        size: 14,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '$solved Solved',
                        style: GoogleFonts.outfit(
                          color: AppTheme.grey600,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          if (rank > 1 && nextRankedUserPoints != null)
            const SizedBox(height: 24),
          if (rank > 1 && nextRankedUserPoints != null)
            const Divider(color: AppTheme.surfaceLight, height: 1),
          if (rank > 1 && nextRankedUserPoints != null)
            const SizedBox(height: 16),
          if (rank > 1 && nextRankedUserPoints != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '#${rank - 1}',
                  style: GoogleFonts.outfit(
                    color: AppTheme.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$nextRankedUserPoints pts to ${rank - 1}',
                  style: GoogleFonts.jetBrainsMono(
                    color: AppTheme.primary,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          if (rank > 1 && nextRankedUserPoints != null)
            const SizedBox(height: 8),
          if (rank > 1 && nextRankedUserPoints != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: 0.7,
                backgroundColor: AppTheme.surfaceMedium,
                valueColor: const AlwaysStoppedAnimation(AppTheme.primary),
                minHeight: 8,
              ),
            ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;

  const _SectionHeader({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppTheme.grey600, size: 18),
        const SizedBox(width: 8),
        Text(
          title,
          style: GoogleFonts.outfit(
            color: AppTheme.grey600,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}

class _LeaderboardItem extends StatelessWidget {
  final int rank;
  final String name;
  final int solved;
  final int points;

  const _LeaderboardItem({
    required this.rank,
    required this.name,
    required this.solved,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.white05),
      ),
      child: Row(
        children: [
          _RankMedal(rank: rank),
          const SizedBox(width: 16),
          const CircleAvatar(
            radius: 18,
            backgroundColor: AppTheme.surfaceLight,
            child: Icon(Icons.person, color: AppTheme.grey, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.outfit(
                    color: AppTheme.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Solved: $solved',
                  style: GoogleFonts.outfit(
                    color: AppTheme.grey600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            NumberFormat("#,###").format(points),
            style: GoogleFonts.jetBrainsMono(
              color: AppTheme.primary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _RankMedal extends StatelessWidget {
  final int rank;
  const _RankMedal({required this.rank});

  @override
  Widget build(BuildContext context) {
    if (rank <= 3) {
      return Image.asset(
        'assets/medals/rank_$rank.png',
        width: 32,
        height: 32,
        errorBuilder: (context, error, stackTrace) => _RankNumber(rank: rank),
      );
    }
    return _RankNumber(rank: rank);
  }
}

class _RankNumber extends StatelessWidget {
  final int rank;
  const _RankNumber({required this.rank});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32,
      child: Text(
        rank < 10 ? '0$rank' : '$rank',
        textAlign: TextAlign.center,
        style: GoogleFonts.jetBrainsMono(
          color: AppTheme.grey600,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
