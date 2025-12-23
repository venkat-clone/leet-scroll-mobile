import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/injection.dart';
import '../logic/feed_cubit.dart';
import '../logic/feed_state.dart';
import '../logic/question_cubit.dart';
import 'question_card.dart';

@RoutePage()
class QuestionFeedScreen extends StatefulWidget {
  const QuestionFeedScreen({super.key});

  @override
  State<QuestionFeedScreen> createState() => _QuestionFeedState();
}

class _QuestionFeedState extends State<QuestionFeedScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedCubit, FeedState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (questions) {
            if (questions.isEmpty) {
              return Center(child: Text("Failed to Load Questions"));
            }

            return PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              itemCount: questions.length,
              onPageChanged: (i) {
                // next page index
                if (i > questions.length - 3) {
                  context.read<FeedCubit>().loadQuestions();
                }
              },
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
