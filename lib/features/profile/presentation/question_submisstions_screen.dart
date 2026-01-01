import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mobile/features/feed/presentation/styles/app_theme.dart';
import 'package:mobile/features/profile/data/models/attempts_history/attempts_history_model.dart';
import 'package:mobile/features/profile/data/models/submissions/submission_model.dart';

import '../../feed/presentation/widget/custom_builder.dart';

@RoutePage()
class QuestionSubmissionScreen extends StatelessWidget {
  const QuestionSubmissionScreen({super.key, required this.submissionModel});

  final SubmissionModel submissionModel;

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
          'Question Details',
          style: GoogleFonts.outfit(
            color: AppTheme.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: AppTheme.white, size: 20),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                _Badge(label: submissionModel.question.category.toUpperCase()),
                const SizedBox(width: 8),
                _Badge(
                  label: submissionModel.question.difficulty.toUpperCase(),
                  color: AppTheme.getDifficultyColor(
                    submissionModel.question.difficulty,
                  ),
                  textColor: Colors.black,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              submissionModel.question.title,
              style: GoogleFonts.outfit(
                color: AppTheme.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 16),
            MarkdownBody(
              data: submissionModel.question.description,
              builders: {"code": CustomCodeMarkdownBuilder()},
              styleSheet: AppTheme.getBodyMarkdownStyle(context),
            ),
            const SizedBox(height: 16),
            if (submissionModel.question.tags.isNotEmpty)
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: submissionModel.question.tags
                    .map((tag) => _TagBadge(label: tag))
                    .toList(),
              ),
            const SizedBox(height: 32),
            Text(
              'OPTIONS',
              style: GoogleFonts.outfit(
                color: AppTheme.grey600,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 16),
            ...List.generate(submissionModel.question.options.length, (index) {
              final option = submissionModel.question.options[index];
              final isCorrect =
                  submissionModel.correctAttempts > 0 &&
                  index == submissionModel.question.correctOption;
              return _OptionCard(
                label: String.fromCharCode(65 + index),
                text: option,
                isCorrect: isCorrect,
              );
            }),
            if (submissionModel.question.explanation != null &&
                submissionModel.question.explanation!.isNotEmpty) ...[
              const SizedBox(height: 32),
              Text(
                'EXPLANATION',
                style: GoogleFonts.outfit(
                  color: AppTheme.grey600,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceDark,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppTheme.accentGreen.withValues(alpha: 0.1),
                  ),
                ),
                child: MarkdownBody(
                  data: submissionModel.question.explanation!,
                  builders: {"code": CustomCodeMarkdownBuilder()},
                  styleSheet: AppTheme.getExplanationMarkdownStyle(context),
                ),
              ),
            ],
            const SizedBox(height: 40),
            Text(
              'ATTEMPT HISTORY',
              style: GoogleFonts.outfit(
                color: AppTheme.grey600,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 24),
            _AttemptTimeline(history: submissionModel.attemptsHistory),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;
  final Color? color;
  final Color? textColor;

  const _Badge({required this.label, this.color, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color ?? AppTheme.surfaceLight,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: GoogleFonts.outfit(
          color: textColor ?? AppTheme.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _TagBadge extends StatelessWidget {
  final String label;

  const _TagBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppTheme.white05),
      ),
      child: Text(
        '#$label',
        style: GoogleFonts.outfit(
          color: AppTheme.accentGreen,
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _OptionCard extends StatelessWidget {
  final String label;
  final String text;
  final bool isCorrect;

  const _OptionCard({
    required this.label,
    required this.text,
    required this.isCorrect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.black,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isCorrect ? AppTheme.accentGreen : AppTheme.white05,
          width: isCorrect ? 1.5 : 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: isCorrect ? AppTheme.accentGreen : AppTheme.surfaceDark,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                label,
                style: GoogleFonts.outfit(
                  color: isCorrect ? AppTheme.black : AppTheme.greyText,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.outfit(
                color: isCorrect ? AppTheme.white : AppTheme.secondaryText,
                fontSize: 15,
                fontWeight: isCorrect ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ),
          if (isCorrect)
            const Icon(
              Icons.check_circle,
              color: AppTheme.accentGreen,
              size: 20,
            ),
        ],
      ),
    );
  }
}

class _AttemptTimeline extends StatelessWidget {
  final List<AttemptsHistoryModel> history;

  const _AttemptTimeline({required this.history});

  @override
  Widget build(BuildContext context) {
    if (history.isEmpty) {
      return const Center(
        child: Text('No history found', style: TextStyle(color: AppTheme.grey)),
      );
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: history.length,
      itemBuilder: (context, index) {
        final attempt = history[index];
        final isLast = index == history.length - 1;
        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: attempt.isCorrect
                          ? AppTheme.accentGreen
                          : AppTheme.accentRed.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                      boxShadow: attempt.isCorrect
                          ? [
                              BoxShadow(
                                color: AppTheme.accentGreen.withValues(
                                  alpha: 0.5,
                                ),
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                            ]
                          : null,
                    ),
                    child: Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: attempt.isCorrect
                              ? AppTheme.white
                              : AppTheme.accentRed,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  if (!isLast)
                    Expanded(
                      child: Container(width: 2, color: AppTheme.surfaceLight),
                    ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppTheme.surfaceDark,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: attempt.isCorrect
                            ? AppTheme.accentGreen.withValues(alpha: 0.3)
                            : AppTheme.transparent,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    attempt.isCorrect ? 'Correct' : 'Incorrect',
                                    style: GoogleFonts.outfit(
                                      color: attempt.isCorrect
                                          ? AppTheme.accentGreen
                                          : AppTheme.accentRed,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '• ${_formatDate(attempt.attemptedAt)}',
                                    style: GoogleFonts.outfit(
                                      color: AppTheme.grey600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    'Selected: ',
                                    style: GoogleFonts.outfit(
                                      color: AppTheme.greyText,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppTheme.black.withValues(
                                        alpha: 0.3,
                                      ),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      attempt.selectedOption,
                                      style: GoogleFonts.outfit(
                                        color: attempt.isCorrect
                                            ? AppTheme.accentGreen
                                            : AppTheme.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          attempt.isCorrect ? Icons.check : Icons.close,
                          color: attempt.isCorrect
                              ? AppTheme.accentGreen
                              : AppTheme.accentRed,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      final now = DateTime.now();
      if (date.year == now.year &&
          date.month == now.month &&
          date.day == now.day) {
        return 'Today, ${DateFormat('h:mm a').format(date)}';
      }
      return DateFormat("MMM d, h:mm a").format(date);
    } catch (_) {
      return dateStr;
    }
  }
}
