import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/injection.dart';
import '../logic/feed_cubit.dart';
import '../logic/feed_state.dart';
import '../logic/question_cubit.dart';
import 'question_card.dart';

class QuestionFeed extends StatefulWidget {
  const QuestionFeed({super.key});

  @override
  State<QuestionFeed> createState() => _QuestionFeedState();
}

class _QuestionFeedState extends State<QuestionFeed> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedCubit, FeedState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (questions) {
            return PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return BlocProvider(
                  create: (context) => getIt<QuestionCubit>(),
                  child: QuestionCard(
                    question: questions[index],
                    scrollController: _pageController,
                  ),
                );
              },
            );
          },
          error: (message) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Error: $message'),
                ElevatedButton(
                  onPressed: () => context.read<FeedCubit>().loadQuestions(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
