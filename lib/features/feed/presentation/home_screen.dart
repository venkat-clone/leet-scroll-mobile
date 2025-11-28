import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/injection.dart';
import '../logic/feed_cubit.dart';
import 'home_overview.dart';
import 'question_feed.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();

  void _navigateToFeed() {
    _pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FeedCubit>()..loadQuestions(),
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          children: [
            HomeOverview(onStart: _navigateToFeed),
            const QuestionFeed(),
          ],
        ),
      ),
    );
  }
}
