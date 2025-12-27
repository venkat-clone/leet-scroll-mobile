import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/core/router/app_router.gr.dart';
import 'package:mobile/features/feed/presentation/styles/app_theme.dart';
import 'package:mobile/features/profile/logic/history/history_cubit.dart';
import 'package:mobile/features/profile/data/models/submissions/submission_model.dart';
import 'package:intl/intl.dart';

@RoutePage()
class SubmissionHistoryScreen extends StatefulWidget {
  const SubmissionHistoryScreen({super.key});

  @override
  State<SubmissionHistoryScreen> createState() =>
      _SubmissionHistoryScreenState();
}

class _SubmissionHistoryScreenState extends State<SubmissionHistoryScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    context.read<HistoryCubit>().getSubmissionHistory();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.black,
      appBar: AppBar(
        backgroundColor: AppTheme.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.white),
          onPressed: () => context.router.back(),
        ),
        title: Text(
          'Quiz History',
          style: GoogleFonts.outfit(
            color: AppTheme.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.tune, color: AppTheme.white),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<HistoryCubit, HistoryState>(
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: _SearchBar(
                  controller: _searchController,
                  onChanged: (value) =>
                      context.read<HistoryCubit>().updateSearch(value),
                ),
              ),
              const _FilterChips(),
              Expanded(
                child: state.when(
                  initial: () =>
                      const Center(child: CircularProgressIndicator()),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (message) => Center(
                    child: Text(
                      message,
                      style: const TextStyle(color: AppTheme.red),
                    ),
                  ),
                  loaded:
                      (
                        isLoading,
                        isError,
                        page,
                        filter,
                        search,
                        hasMore,
                        history,
                        errorMsg,
                      ) {
                        if (history.isEmpty) {
                          return const Center(
                            child: Text(
                              'No history found',
                              style: TextStyle(color: AppTheme.grey),
                            ),
                          );
                        }
                        return _HistoryList(submissions: history);
                      },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const _SearchBar({required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(color: AppTheme.white),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search, color: AppTheme.grey),
          hintText: 'Search past quizzes...',
          hintStyle: GoogleFonts.outfit(color: AppTheme.grey600),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
}

class _FilterChips extends StatelessWidget {
  const _FilterChips();

  @override
  Widget build(BuildContext context) {
    final filters = ['ALL', 'Solved', 'Attempted', 'Skipped'];

    return Container(
      height: 50,
      margin: const EdgeInsets.only(bottom: 10),
      child: BlocBuilder<HistoryCubit, HistoryState>(
        buildWhen: (p, c) =>
            p.maybeWhen(
              loaded: (_, __, ___, f, ____, _____, ______, _______) => f,
              orElse: () => '',
            ) !=
            c.maybeWhen(
              loaded: (_, __, ___, f, ____, _____, ______, _______) => f,
              orElse: () => '',
            ),
        builder: (context, state) {
          final currentFilter = state.maybeWhen(
            loaded: (_, __, ___, filter, ____, _____, ______, _______) =>
                filter,
            orElse: () => 'ALL',
          );

          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: filters.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final filter = filters[index];
              final isSelected =
                  (currentFilter.isEmpty && filter == 'ALL') ||
                  currentFilter.toUpperCase() == filter.toUpperCase();

              return GestureDetector(
                onTap: () => context.read<HistoryCubit>().updateFilter(
                  filter.toUpperCase(),
                ),
                child: Chip(
                  label: Text(
                    filter,
                    style: GoogleFonts.outfit(
                      color: isSelected ? AppTheme.black : AppTheme.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  backgroundColor: isSelected
                      ? AppTheme.accentGreen
                      : AppTheme.surfaceDark,
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _HistoryList extends StatelessWidget {
  final List<SubmissionModel> submissions;

  const _HistoryList({required this.submissions});

  @override
  Widget build(BuildContext context) {
    final grouped = _groupSubmissions(submissions);

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: grouped.length + 1,
      itemBuilder: (context, index) {
        if (index == grouped.length) {
          return const _Footer();
        }

        final group = grouped[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _DateHeader(date: group.title),
            ...group.items.map((s) => _HistoryCard(submission: s)),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }

  List<_GroupedHistory> _groupSubmissions(List<SubmissionModel> items) {
    final Map<String, List<SubmissionModel>> map = {};
    for (var item in items) {
      final date = DateTime.parse(item.createdAt);
      final now = DateTime.now();
      String key;
      if (date.year == now.year &&
          date.month == now.month &&
          date.day == now.day) {
        key = 'TODAY';
      } else if (date.year == now.year &&
          date.month == now.month &&
          date.day == now.day - 1) {
        key = 'YESTERDAY';
      } else {
        key = DateFormat("MMM dd").format(date).toUpperCase();
      }
      map.putIfAbsent(key, () => []).add(item);
    }
    return map.entries.map((e) => _GroupedHistory(e.key, e.value)).toList();
  }
}

class _GroupedHistory {
  final String title;
  final List<SubmissionModel> items;
  _GroupedHistory(this.title, this.items);
}

class _DateHeader extends StatelessWidget {
  final String date;
  const _DateHeader({required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          if (date == 'TODAY')
            Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.only(right: 8),
              decoration: const BoxDecoration(
                color: AppTheme.accentGreen,
                shape: BoxShape.circle,
              ),
            ),
          Text(
            date,
            style: GoogleFonts.outfit(
              color: AppTheme.grey600,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}

class _HistoryCard extends StatelessWidget {
  final SubmissionModel submission;
  const _HistoryCard({required this.submission});

  @override
  Widget build(BuildContext context) {
    final time = DateFormat(
      "hh:mm a",
    ).format(DateTime.parse(submission.createdAt));

    // Status Logic
    final bool isSkipped = submission.attempts == 0;
    final bool hasCorrect = submission.correctAttempts > 0;
    final bool onlyWrong =
        submission.attempts > 0 && submission.correctAttempts == 0;
    final bool onlyCorrect =
        submission.attempts > 0 &&
        submission.correctAttempts == submission.attempts;
    final int incorrectAttempts =
        submission.attempts - submission.correctAttempts;

    Color statusColor;
    String statusLabel = '${submission.correctAttempts}/${submission.attempts}';
    Color? badgeBg;

    if (hasCorrect) {
      statusColor = AppTheme.accentGreen;
      badgeBg = AppTheme.statIconGreenBg;
    } else if (onlyWrong) {
      statusColor = AppTheme.accentRed;
      badgeBg = AppTheme.statIconRedBg;
    } else {
      // Skipped
      statusColor = AppTheme.accentOrange;
      badgeBg = AppTheme.statIconOrangeBg;
    }

    return InkWell(
      onTap: () {
        context.router.push(
          QuestionSubmissionRoute(submissionModel: submission),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.surfaceDark,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppTheme.black.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppTheme.white05),
                  ),
                  child: Icon(
                    _getCategoryIcon(submission.question.category),
                    color: _getCategoryColor(submission.question.category),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              submission.question.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.outfit(
                                color: AppTheme.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: badgeBg,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              statusLabel,
                              style: GoogleFonts.jetBrainsMono(
                                color: statusColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          _StatIcon(
                            icon: Icons.visibility_outlined,
                            count: submission.question.viewsCount ?? 0,
                          ),
                          const SizedBox(width: 12),
                          _StatIcon(
                            icon: Icons.close,
                            count: incorrectAttempts,
                            color: AppTheme.greyText,
                          ),
                          const SizedBox(width: 12),
                          _StatIcon(
                            icon: Icons.check_circle_outline,
                            count: submission.correctAttempts,
                            color: AppTheme.accentGreen,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(
                  Icons.access_time,
                  size: 14,
                  color: AppTheme.greyText,
                ),
                const SizedBox(width: 4),
                Text(
                  time,
                  style: GoogleFonts.outfit(
                    color: AppTheme.greyText,
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
                // Displaying "Solved", "Skipped", or "Incorrect" as a tag alongside other tags
                if (isSkipped)
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: _TagBadge(
                      label: 'Skipped',
                      color: AppTheme.accentOrange,
                    ),
                  )
                else if (onlyCorrect)
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: _TagBadge(
                      label: 'Solved',
                      color: AppTheme.accentGreen,
                    ),
                  )
                else if (hasCorrect)
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: _TagBadge(
                      label: 'Partial',
                      color: AppTheme.accentGreen,
                    ),
                  )
                else if (onlyWrong)
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: _TagBadge(
                      label: 'Incorrect',
                      color: AppTheme.accentRed,
                    ),
                  ),

                if (submission.question.tags.isNotEmpty)
                  Wrap(
                    spacing: 6,
                    children: submission.question.tags
                        .take(2)
                        .map((tag) => _TagBadge(label: tag, color: statusColor))
                        .toList(),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'frontend':
        return Icons.image_outlined;
      case 'data structs':
        return Icons.code;
      case 'algorithms':
        return Icons.memory;
      case 'database':
        return Icons.storage;
      default:
        return Icons.terminal;
    }
  }

  Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'frontend':
        return AppTheme.accentPink;
      case 'data structs':
        return AppTheme.accentOrange;
      case 'algorithms':
        return AppTheme.accentGreen;
      case 'database':
        return AppTheme.accentBlue;
      default:
        return AppTheme.white;
    }
  }
}

class _StatIcon extends StatelessWidget {
  final IconData icon;
  final int count;
  final Color? color;

  const _StatIcon({required this.icon, required this.count, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: color ?? AppTheme.greyText),
        const SizedBox(width: 4),
        Text(
          _formatCount(count),
          style: GoogleFonts.outfit(color: AppTheme.greyText, fontSize: 12),
        ),
      ],
    );
  }

  String _formatCount(int count) {
    if (count >= 1000) return '${(count / 1000).toStringAsFixed(1)}k';
    return count.toString();
  }
}

class _TagBadge extends StatelessWidget {
  final String label;
  final Color? color;
  const _TagBadge({required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? AppTheme.accentGreen;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: effectiveColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: effectiveColor.withValues(alpha: 0.2)),
      ),
      child: Text(
        label,
        style: GoogleFonts.outfit(
          color: effectiveColor,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: AppTheme.surfaceDark,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.check, color: AppTheme.grey, size: 16),
          ),
          const SizedBox(height: 12),
          Text(
            "You're all caught up!",
            style: GoogleFonts.outfit(color: AppTheme.grey600, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
