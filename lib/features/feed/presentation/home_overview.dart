import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/features/feed/data/daily_activity/daily_activity_model.dart';
import 'package:mobile/features/feed/logic/home/home_cubit.dart';
import 'package:mobile/features/feed/presentation/styles/app_theme.dart';
import 'package:mobile/features/profile/logic/profile_cubit.dart';

class HomeOverview extends StatefulWidget {
  final VoidCallback onStart;

  const HomeOverview({super.key, required this.onStart});

  @override
  State<HomeOverview> createState() => _HomeOverviewState();
}

class _HomeOverviewState extends State<HomeOverview> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Text(
                  'Welcome back,',
                  style: GoogleFonts.outfit(
                    fontSize: 24,
                    color: AppTheme.greyText,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    final name = state.maybeWhen(
                      loaded: (profile) => profile.user.name.split(' ').first,
                      orElse: () => 'Developer',
                    );
                    return Text(
                      name,
                      style: GoogleFonts.outfit(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.white,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 40),
                _DailyGoalCard(onStart: widget.onStart),
                const SizedBox(height: 24),
                const _ActivityCard(),
                const SizedBox(height: 40),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'SWIPE LEFT TO VIBE LEARNING',
                        style: GoogleFonts.jetBrainsMono(
                          color: AppTheme.grey600,
                          fontSize: 12,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 24),
                      GestureDetector(
                        onTap: widget.onStart,
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppTheme.primary.withValues(alpha: 0.2),
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppTheme.primary,
                                  width: 1.5,
                                ),
                              ),
                              child: const Icon(
                                Icons.arrow_forward,
                                color: AppTheme.primary,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DailyGoalCard extends StatelessWidget {
  final VoidCallback onStart;

  const _DailyGoalCard({required this.onStart});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.when(
          initial: () => const _LoadingCard(),
          loading: () =>
              const _LoadingCard(), // If you add a loading state later
          error: (_) => const _ErrorCard(),
          loaded: (refreshing, error, data) {
            // If data is null (shouldn't happen in loaded, but safe guard)
            if (data == null) return const _ErrorCard();

            final todayActivity = data.todayActivity;
            final currentStreak = data.currentStreak;
            final hasCompletedToday = (todayActivity?.totalAttempts ?? 0) > 0;

            return Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppTheme.surfaceDark,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.code, color: AppTheme.primary, size: 16),
                      const SizedBox(width: 8),
                      Text(
                        'DAILY GOAL',
                        style: GoogleFonts.jetBrainsMono(
                          color: AppTheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    hasCompletedToday
                        ? 'Great job! You\'ve completed today\'s goal 🎉'
                        : currentStreak > 0
                        ? 'Keep your streak alive! Solve a problem today.'
                        : 'Start your first streak today! 🥇 Solve a problem.',
                    style: GoogleFonts.outfit(
                      fontSize: 22,
                      color: AppTheme.white,
                      height: 1.3,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Streak info
                  if (currentStreak > 0)
                    Row(
                      children: [
                        const Icon(
                          Icons.whatshot,
                          color: Colors.orange,
                          size: 20,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '$currentStreak day${currentStreak == 1 ? '' : 's'} streak',
                          style: GoogleFonts.jetBrainsMono(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  if (currentStreak > 0) const SizedBox(height: 32),
                  // Progress bar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: hasCompletedToday ? 1.0 : 0.0,
                      backgroundColor: AppTheme.surfaceMedium.withValues(
                        alpha: 0.3,
                      ),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        hasCompletedToday ? Colors.green : AppTheme.primary,
                      ),
                      minHeight: 8,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        hasCompletedToday
                            ? '1/1 Completed ✓'
                            : '${todayActivity?.totalAttempts ?? 0}/1 Completed',
                        style: GoogleFonts.jetBrainsMono(
                          color: hasCompletedToday
                              ? Colors.green
                              : AppTheme.grey600,
                          fontSize: 12,
                          fontWeight: hasCompletedToday
                              ? FontWeight.bold
                              : null,
                        ),
                      ),
                      if (!hasCompletedToday)
                        GestureDetector(
                          onTap: onStart,
                          child: Text(
                            'Start Now',
                            style: GoogleFonts.outfit(
                              color: AppTheme.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        )
                      else
                        Text(
                          'Done for today!',
                          style: GoogleFonts.outfit(
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                    ],
                  ),
                  // Optional: show refreshing overlay
                  if (refreshing)
                    Container(
                      color: Colors.black.withValues(alpha: 0.2),
                      child: const Center(child: LinearProgressIndicator()),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

// Reusable loading card
class _LoadingCard extends StatelessWidget {
  const _LoadingCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.code,
                color: AppTheme.primary.withValues(alpha: 0.5),
                size: 16,
              ),
              const SizedBox(width: 8),
              Text(
                'DAILY GOAL',
                style: GoogleFonts.jetBrainsMono(
                  color: AppTheme.primary.withValues(alpha: 0.5),
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _ShimmerLine(width: 280),
          const SizedBox(height: 16),
          _ShimmerLine(width: 120),
          const SizedBox(height: 32),
          _ShimmerLine(height: 8, width: double.infinity),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_ShimmerLine(width: 100), _ShimmerLine(width: 80)],
          ),
        ],
      ),
    );
  }
}

// Reusable error card
class _ErrorCard extends StatelessWidget {
  const _ErrorCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        children: [
          Icon(Icons.error_outline, color: Colors.red[400], size: 32),
          const SizedBox(height: 12),
          Text(
            'Failed to load daily goal',
            style: GoogleFonts.outfit(color: AppTheme.white, fontSize: 18),
          ),
          const SizedBox(height: 8),
          Text(
            'Pull to refresh or try again later',
            style: GoogleFonts.jetBrainsMono(
              color: AppTheme.grey600,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// Simple shimmer placeholder (you can replace with shimmer package if desired)
class _ActivityCard extends StatelessWidget {
  const _ActivityCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.circular(28),
      ),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.when(
            initial: () => const _ActivityLoadingCard(),
            loading: () => const _ActivityLoadingCard(),
            loaded: (refreshing, error, data) {
              if (data == null) return const _ActivityErrorCard();

              return Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.grid_view_rounded,
                            color: AppTheme.primary,
                            size: 16,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'ACTIVITY',
                            style: GoogleFonts.jetBrainsMono(
                              color: AppTheme.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      _HeatmapGrid(data.dailyActivities),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Less',
                            style: GoogleFonts.outfit(
                              color: AppTheme.grey600,
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(width: 6),
                          ...List.generate(5, (index) {
                            final opacity = index == 0
                                ? 0.15
                                : (index + 1) * 0.2;
                            return Container(
                              width: 12,
                              height: 12,
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              decoration: BoxDecoration(
                                color: AppTheme.primary.withValues(
                                  alpha: opacity,
                                ),
                                borderRadius: BorderRadius.circular(3),
                              ),
                            );
                          }),
                          const SizedBox(width: 6),
                          Text(
                            'More',
                            style: GoogleFonts.outfit(
                              color: AppTheme.grey600,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (refreshing)
                    Positioned.fill(
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.black.withValues(alpha: 0.15),
                        child: const Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                    ),
                ],
              );
            },
            error: (_) => const _ActivityErrorCard(),
          );
        },
      ),
    );
  }
}

// Loading skeleton for activity card
class _ActivityLoadingCard extends StatelessWidget {
  const _ActivityLoadingCard();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.grid_view_rounded,
              color: AppTheme.primary.withValues(alpha: 0.5),
              size: 16,
            ),
            const SizedBox(width: 8),
            _ShimmerLine(width: 80, height: 14),
          ],
        ),
        const SizedBox(height: 20),
        // Simulate heatmap grid
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: List.generate(49, (_) => _ShimmerBlock()),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _ShimmerLine(width: 40, height: 12),
            const SizedBox(width: 40),
            _ShimmerLine(width: 40, height: 12),
          ],
        ),
      ],
    );
  }
}

// Error state with retry
class _ActivityErrorCard extends StatelessWidget {
  const _ActivityErrorCard();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.error_outline, color: Colors.red[400], size: 40),
        const SizedBox(height: 16),
        Text(
          'Failed to load activity',
          style: GoogleFonts.outfit(
            color: AppTheme.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Check your connection and try again',
          style: GoogleFonts.jetBrainsMono(
            color: AppTheme.grey600,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: () => context.read<HomeCubit>().loadUserActivity(),
          icon: const Icon(Icons.refresh, size: 18),
          label: const Text('Retry'),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primary,
            foregroundColor: AppTheme.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}

// Reusable shimmer components
class _ShimmerLine extends StatelessWidget {
  final double width;
  final double height;

  const _ShimmerLine({required this.width, this.height = 16});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppTheme.grey.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class _ShimmerBlock extends StatelessWidget {
  const _ShimmerBlock();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        color: AppTheme.grey.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class _HeatmapGrid extends StatelessWidget {
  _HeatmapGrid(this.dailyActivities);

  final Map<DateTime, DailyActivityModel> dailyActivities;

  static const int weeksCount = 15;
  static const int daysCount = weeksCount * 7;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 120,
      alignment: Alignment.center,
      child: GridView.builder(
        reverse: false,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: daysCount,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          crossAxisSpacing: 2,
          mainAxisExtent: maxWidth > 450 ? 24 : 16,
          //
          mainAxisSpacing: 2,
        ),
        itemBuilder: (context, index) {
          final date = _getDate(index);
          if (isFutureDate(date)) {
            return SizedBox();
          }
          if (dailyActivities[date] == null) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: _getHeatmapColor(),
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }

          final DailyActivityModel? activityModel = dailyActivities[date];
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: _getHeatmapColor(activityModel?.totalAttempts),
              borderRadius: BorderRadius.circular(3),
            ),
          );
        },
      ),
    );
  }

  static double _getOpacity(int attempts) {
    if (attempts == 0) return 0.0;
    if (attempts <= 5) return 0.25;
    if (attempts <= 10) return 0.50;
    if (attempts <= 15) return 0.75;
    return 1.0;
  }

  static Color _getHeatmapColor([int? totalAttempts]) {
    if (totalAttempts == null || totalAttempts <= 0)
      return AppTheme.surfaceMedium.withValues(alpha: 0.1);
    return AppTheme.primary.withValues(alpha: _getOpacity(totalAttempts));
  }

  final startWeek = DateTime.now().weekday;

  final today = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  bool isFutureDate(DateTime date) => today.compareTo(date).isNegative;

  DateTime _getDate(int index) {
    return today.subtract(Duration(days: (startWeek - 7) - index + daysCount));
  }
}
