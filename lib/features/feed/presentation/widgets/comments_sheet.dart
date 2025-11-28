import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/features/feed/presentation/styles/app_theme.dart';
import '../../logic/question_cubit.dart';
import '../../logic/question_state.dart';

/// Bottom sheet widget for displaying and posting comments
class CommentsSheet extends StatefulWidget {
  final String questionId;

  const CommentsSheet({super.key, required this.questionId});

  @override
  State<CommentsSheet> createState() => _CommentsSheetState();
}

class _CommentsSheetState extends State<CommentsSheet> {
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  Future<void> _postComment() async {
    final commentText = _commentController.text.trim();
    if (commentText.isEmpty) return;

    await context.read<QuestionCubit>().postComment(
      widget.questionId,
      commentText,
    );
    _commentController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionCubit, QuestionState>(
      builder: (context, state) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.7,
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              _CommentsHeader(),
              Expanded(
                child: _CommentsBody(
                  isLoading: state.isLoadingComments,
                  comments: state.comments,
                ),
              ),
              _CommentInput(
                controller: _commentController,
                isPosting: state.isPostingComment,
                onPost: _postComment,
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Header for comments sheet
class _CommentsHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppTheme.cardPadding,
      child: Text(
        '// Comments',
        style: GoogleFonts.firaCode(
          color: AppTheme.primaryText,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

/// Body containing the list of comments
class _CommentsBody extends StatelessWidget {
  final bool isLoading;
  final List<dynamic> comments;

  const _CommentsBody({required this.isLoading, required this.comments});

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (comments.isEmpty) {
      return Center(
        child: Text(
          'No comments yet.',
          style: GoogleFonts.firaCode(color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      itemCount: comments.length,
      itemBuilder: (context, index) {
        return _CommentItem(comment: comments[index]);
      },
    );
  }
}

/// Individual comment item
class _CommentItem extends StatelessWidget {
  final Map<String, dynamic> comment;

  const _CommentItem({required this.comment});

  String _getUserName() {
    return comment['user']?['name'] ?? 'User';
  }

  String _getUserInitial() {
    final name = _getUserName();
    return name.isNotEmpty ? name[0].toUpperCase() : 'U';
  }

  String _getCommentContent() {
    return comment['content'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[800],
        child: Text(
          _getUserInitial(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      title: Text(
        _getUserName(),
        style: GoogleFonts.firaCode(
          color: AppTheme.successColor,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        _getCommentContent(),
        style: GoogleFonts.firaCode(color: Colors.white70),
      ),
    );
  }
}

/// Comment input field with post button
class _CommentInput extends StatelessWidget {
  final TextEditingController controller;
  final bool isPosting;
  final VoidCallback onPost;

  const _CommentInput({
    required this.controller,
    required this.isPosting,
    required this.onPost,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppTheme.cardPadding,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              style: GoogleFonts.firaCode(color: AppTheme.primaryText),
              decoration: InputDecoration(
                hintText: '/* Add a comment... */',
                hintStyle: GoogleFonts.firaCode(color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFF2D2D2D),
                border: OutlineInputBorder(
                  borderRadius: AppTheme.cardRadius,
                  borderSide: BorderSide.none,
                ),
              ),
              maxLines: null,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => isPosting ? null : onPost(),
            ),
          ),
          const SizedBox(width: AppTheme.spacingSmall),
          IconButton(
            onPressed: isPosting ? null : onPost,
            icon: isPosting
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Icon(Icons.send, color: AppTheme.successColor),
          ),
        ],
      ),
    );
  }
}
