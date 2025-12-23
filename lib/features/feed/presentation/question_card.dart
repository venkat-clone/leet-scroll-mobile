// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/dracula.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/features/feed/presentation/styles/app_theme.dart';
import 'package:mobile/features/feed/presentation/widget/custom_builder.dart';
import '../../../core/injection.dart';
import '../data/question_model.dart';
import '../logic/question_cubit.dart';
import '../logic/question_state.dart';
import 'package:share_plus/share_plus.dart';
import 'widgets/comments_sheet.dart';
import 'package:flutter/services.dart';

class QuestionCard extends StatefulWidget {
  final Question question;
  final ScrollController scrollController;

  const QuestionCard({
    super.key,
    required this.question,
    required this.scrollController,
  });

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  int? _selectedOption;
  bool _isSubmitted = false;

  @override
  void initState() {
    super.initState();
    _loadLikeStatus();
  }

  void _loadLikeStatus() {
    // context.read<QuestionCubit>().loadLikeStatus(widget.question.id);
    // context.read<QuestionCubit>().loadBookmarkStatus(widget.question.id);
    context.read<QuestionCubit>().submitQuestionViewed(widget.question.id);
  }

  void _showComments() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppTheme.vsCodeBackground,
      shape: RoundedRectangleBorder(borderRadius: AppTheme.sheetRadius),
      builder: (context) => BlocProvider(
        create: (context) =>
            getIt<QuestionCubit>()..loadComments(widget.question.id),
        child: CommentsSheet(questionId: widget.question.id),
      ),
    );
  }

  Future<void> _submitAnswer(int index) async {
    if (_isSubmitted) return;

    setState(() {
      _selectedOption = index;
      _isSubmitted = true;
    });

    if (index == widget.question.correctOption) {
      //   vibrate
      HapticFeedback.heavyImpact();
    } else {
      HapticFeedback.lightImpact();
    }

    try {
      await context.read<QuestionCubit>().submitAnswer(
        widget.question.id,
        index,
      );
    } catch (e) {
      debugPrint('Error submitting answer: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to submit answer: $e'),
            backgroundColor: AppTheme.errorColor,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Fixed Header
          _QuestionHeader(question: widget.question),
          _QuestionTitle(title: widget.question.title),
          const SizedBox(height: AppTheme.spacingMedium),

          // Scrollable Content Area (Code + Description)
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.question.codeSnippet != null &&
                          widget.question.codeSnippet!.isNotEmpty)
                        _CodeSnippetSection(
                          codeSnippet: widget.question.codeSnippet!,
                        ),
                      _QuestionDescription(
                        description: widget.question.description,
                      ),
                      if (_isSubmitted)
                        _ExplanationSection(
                          explanation: widget.question.explanation,
                        ),
                      const SizedBox(height: AppTheme.spacingMedium),
                    ],
                  ),
                ),
                // Scroll indicator at bottom
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: IgnorePointer(
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Theme.of(context).colorScheme.primary.withAlpha(10),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: AppTheme.draculaComment.withValues(alpha: 0.5),
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: AppTheme.spacingSmall),

          // Like and Comment Actions (Instagram style - above options)
          _ActionButtons(
            questionId: widget.question.id,
            onCommentTap: _showComments,
          ),

          const SizedBox(height: AppTheme.spacingSmall),

          // Fixed Options Area - All visible without scrolling
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: AppTheme.vsCodeBorder.withValues(alpha: 0.3),
                    width: 1,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppTheme.spacingSmall,
                ),
                child: _OptionsList(
                  options: widget.question.options,
                  correctOption: widget.question.correctOption,
                  selectedOption: _selectedOption,
                  isSubmitted: _isSubmitted,
                  onOptionTap: _submitAnswer,
                ),
              ),
            ),
          ),

          const SizedBox(height: AppTheme.spacingSmall),
        ],
      ),
    );
  }
}

/// Header widget displaying difficulty chip and category
class _QuestionHeader extends StatelessWidget {
  final Question question;

  const _QuestionHeader({required this.question});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppTheme.cardPadding,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppTheme.getDifficultyColor(
                question.difficulty,
              ).withAlpha(40),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: AppTheme.getDifficultyColor(question.difficulty),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.getDifficultyColor(question.difficulty),
                  blurRadius: 3,
                ),
                BoxShadow(color: Colors.black),
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Text(
              question.difficulty,
              style: AppTheme.chipTextStyle.copyWith(
                color: AppTheme.getDifficultyColor(question.difficulty),
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
          ),

          SizedBox(width: 8),
          Icon(Icons.circle, size: 12, color: Colors.grey[800]),
          SizedBox(width: 8),
          Text(
            question.category,
            style: AppTheme.labelStyle.copyWith(
              color: Colors.grey[500],
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

/// Title widget with markdown support and dynamic font sizing
class _QuestionTitle extends StatefulWidget {
  final String title;

  const _QuestionTitle({required this.title});

  @override
  State<_QuestionTitle> createState() => _QuestionTitleState();
}

class _QuestionTitleState extends State<_QuestionTitle> {
  double _fontSize = 20.0;
  static const double _defaultFontSize = 20.0;
  static const double _reducedFontSize = 16.0;
  static const int _maxLinesBeforeReduction = 2;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculateFontSize();
    });
  }

  @override
  void didUpdateWidget(_QuestionTitle oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.title != widget.title) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _calculateFontSize();
      });
    }
  }

  void _calculateFontSize() {
    if (!mounted) return;

    final textPainter = TextPainter(
      text: TextSpan(
        text: widget.title,
        style: GoogleFonts.firaCode(
          color: AppTheme.primaryText,
          fontSize: _defaultFontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
      maxLines: null,
      textDirection: TextDirection.ltr,
    );

    // Get available width (screen width - horizontal padding)
    final screenWidth = MediaQuery.of(context).size.width;
    final availableWidth =
        screenWidth - (AppTheme.horizontalPadding.horizontal);

    textPainter.layout(maxWidth: availableWidth);

    // Calculate number of lines
    final lineHeight = textPainter.preferredLineHeight;
    final numberOfLines = (textPainter.height / lineHeight).ceil();

    if (mounted) {
      setState(() {
        _fontSize = numberOfLines > _maxLinesBeforeReduction
            ? _reducedFontSize
            : _defaultFontSize;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppTheme.horizontalPadding,
      child: MarkdownBody(
        data: widget.title,
        builders: {"code": CustomCodeMarkdownBuilder()},
        styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
          p: GoogleFonts.firaCode(
            color: AppTheme.primaryText,
            fontSize: _fontSize,
            fontWeight: FontWeight.bold,
          ),
          codeblockDecoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[300]!),
          ),
          codeblockPadding: const EdgeInsets.all(16),
        ),
      ),
    );
  }
}

/// Code snippet display section
class _CodeSnippetSection extends StatelessWidget {
  final String codeSnippet;

  const _CodeSnippetSection({required this.codeSnippet});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppTheme.draculaBackground,
      padding: AppTheme.cardPadding,
      margin: const EdgeInsets.only(bottom: AppTheme.spacingMedium),
      child: HighlightView(
        codeSnippet,
        language: 'javascript',
        theme: draculaTheme,
        textStyle: AppTheme.codeStyle,
      ),
    );
  }
}

/// Question description with markdown support
class _QuestionDescription extends StatelessWidget {
  final String description;

  const _QuestionDescription({required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppTheme.horizontalPadding,
      child: MarkdownBody(
        data: description,
        builders: {"code": CustomCodeMarkdownBuilder()},
        styleSheet: AppTheme.getBodyMarkdownStyle(context),
      ),
    );
  }
}

/// List of answer options with dynamic font sizing
class _OptionsList extends StatelessWidget {
  final List<String> options;
  final int correctOption;
  final int? selectedOption;
  final bool isSubmitted;
  final Function(int) onOptionTap;

  const _OptionsList({
    required this.options,
    required this.correctOption,
    required this.selectedOption,
    required this.isSubmitted,
    required this.onOptionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        options.length,
        (index) => Flexible(
          child: _AnswerOption(
            option: options[index],
            index: index,
            correctOption: correctOption,
            selectedOption: selectedOption,
            isSubmitted: isSubmitted,
            onTap: () => onOptionTap(index),
            fontSize: 12,
          ),
        ),
      ),
    );
    // return LayoutBuilder(
    //   builder: (context, constraints) {
    //     final fontSize = _calculateFontSize(
    //       constraints.maxHeight,
    //       options.length,
    //     );
    //
    //     return Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: List.generate(
    //         options.length,
    //         (index) => Flexible(
    //           child: _AnswerOption(
    //             option: options[index],
    //             index: index,
    //             correctOption: correctOption,
    //             selectedOption: selectedOption,
    //             isSubmitted: isSubmitted,
    //             onTap: () => onOptionTap(index),
    //             fontSize: fontSize,
    //           ),
    //         ),
    //       ),
    //     );
    //   },
    // );
  }
}

/// Individual answer option widget with dynamic font sizing
class _AnswerOption extends StatelessWidget {
  final String option;
  final int index;
  final int correctOption;
  final int? selectedOption;
  final bool isSubmitted;
  final VoidCallback onTap;
  final double fontSize;

  const _AnswerOption({
    required this.option,
    required this.index,
    required this.correctOption,
    required this.selectedOption,
    required this.isSubmitted,
    required this.onTap,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedOption == index;
    final isCorrectOption = index == correctOption;
    final isCorrect = selectedOption == correctOption;

    Color borderColor = AppTheme.vsCodeBorder;
    Color backgroundColor = Color(0xff18181b);

    if (isSubmitted) {
      if (isSelected) {
        borderColor = isCorrect ? AppTheme.successColor : AppTheme.errorColor;
        backgroundColor = isCorrect
            ? AppTheme.successColor.withValues(alpha: 0.1)
            : AppTheme.errorColor.withValues(alpha: 0.1);
      } else if (isCorrectOption) {
        borderColor = AppTheme.successColor;
        backgroundColor = AppTheme.successColor.withValues(alpha: 0.1);
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: InkWell(
        onTap: isSubmitted ? null : onTap,
        borderRadius: AppTheme.buttonRadius,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: AppTheme.buttonRadius,
            color: backgroundColor,
          ),
          child: Row(
            children: [
              Expanded(child: Text(option)),
              // Expanded(
              //   child: MarkdownBody(
              //     data: option,
              //     shrinkWrap: true,
              //
              //     styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context))
              //         .copyWith(
              //           p: GoogleFonts.firaCode(
              //             color: AppTheme.secondaryText,
              //             fontSize: fontSize,
              //           ),
              //           code: GoogleFonts.firaCode(
              //             backgroundColor: AppTheme.vsCodeInputBg,
              //             fontSize: fontSize - 1,
              //           ),
              //         ),
              //   ),
              // ),
              if (isSubmitted && isSelected)
                Padding(
                  padding: const EdgeInsets.only(left: AppTheme.spacingSmall),
                  child: Icon(
                    isCorrect ? Icons.check_circle : Icons.cancel,
                    color: isCorrect
                        ? AppTheme.successColor
                        : AppTheme.errorColor,
                    size: 20,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Explanation section shown after submission
class _ExplanationSection extends StatelessWidget {
  final String? explanation;

  const _ExplanationSection({this.explanation});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: AppTheme.spacingLarge),
        Container(
          width: double.infinity,
          padding: AppTheme.cardPadding,
          color: AppTheme.vsCodeSidebarBg,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '// Explanation',
                style: AppTheme.commentStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppTheme.spacingSmall),
              MarkdownBody(
                data: explanation ?? 'No explanation provided.',
                styleSheet: AppTheme.getExplanationMarkdownStyle(context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Action buttons for like and comment
class _ActionButtons extends StatelessWidget {
  final String? questionId;
  final VoidCallback onCommentTap;

  const _ActionButtons({required this.questionId, required this.onCommentTap});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionCubit, QuestionState>(
      builder: (context, state) {
        return Padding(
          padding: AppTheme.horizontalPadding,
          child: Row(
            children: [
              // Left side - Primary actions (Instagram style - icon only)
              _ActionButton(
                icon: Icons.favorite,
                label: '${state.likesCount}',
                activeIcon: Icons.favorite,
                activeColor: AppTheme.errorColor,
                isActive: state.isLiked,
                showLabel: true,
                onTap: questionId != null
                    ? () =>
                          context.read<QuestionCubit>().toggleLike(questionId!)
                    : null,
              ),
              const SizedBox(width: 16),
              _ActionButton(
                icon: Icons.mode_comment,
                label: '',
                showLabel: false,
                onTap: onCommentTap,
              ),
              const SizedBox(width: 16),
              const Spacer(),
              _ActionButton(
                icon: Icons.share,
                label: '',
                showLabel: false,
                onTap: () {
                  Share.share('Check out this question on LeetScroll!');
                },
              ),

              // const Spacer(),

              // Right side - Bookmark (Instagram style)
              // _ActionButton(
              //   icon: Icons.bookmark,
              //   label: '',
              //   activeIcon: Icons.bookmark,
              //   activeColor: AppTheme.draculaYellow,
              //   isActive: state.isBookmarked,
              //   showLabel: false,
              //   onTap: questionId != null
              //       ? () => context.read<QuestionCubit>().toggleBookmark(
              //           questionId!,
              //         )
              //       : null,
              // ),
              // const SizedBox(width: 12),
              // _ActionButton(
              //   icon: Icons.flag,
              //   label: '',
              //   activeIcon: Icons.flag,
              //   activeColor: AppTheme.errorColor,
              //   isActive: state.isReported,
              //   showLabel: false,
              //   onTap: questionId != null && !state.isReported
              //       ? () {
              //           context.read<QuestionCubit>().reportQuestion(
              //             questionId!,
              //           );
              //           ScaffoldMessenger.of(context).showSnackBar(
              //             const SnackBar(
              //               content: Text('Question reported. Thank you!'),
              //               duration: Duration(seconds: 2),
              //             ),
              //           );
              //         }
              //       : null,
              // ),
            ],
          ),
        );
      },
    );
  }
}

/// Individual action button widget (Instagram style)
class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final IconData? activeIcon;
  final Color? activeColor;
  final bool isActive;
  final VoidCallback? onTap;
  final bool showLabel;

  const _ActionButton({
    required this.icon,
    required this.label,
    this.activeIcon,
    this.activeColor,
    this.isActive = false,
    this.onTap,
    this.showLabel = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isActive && activeIcon != null ? activeIcon : icon,
            color: isActive && activeColor != null
                ? activeColor
                : Color(0xff949ba6),
            size: 20,
          ),
          if (showLabel && label.isNotEmpty) ...[
            const SizedBox(width: 4),
            Text(
              label,
              style: GoogleFonts.firaCode(
                color: Color(0xff949ba6),
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
