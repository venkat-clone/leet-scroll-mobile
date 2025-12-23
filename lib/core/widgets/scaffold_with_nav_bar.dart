import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/leaderboard/logic/leaderboard_cubit.dart';
import '../../features/profile/logic/profile_cubit.dart';
import '../router/app_router.gr.dart';

@RoutePage()
class ShellScreen extends StatelessWidget {
  const ShellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [HomeRoute(), LeaderboardRoute(), ProfileRoute()],

      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: (index) {
            if (index == 2) {
              context.read<ProfileCubit>().loadProfile();
            } else if (index == 1) {
              context.read<LeaderboardCubit>().loadLeaderboard();
            }
            tabsRouter.setActiveIndex(index);
          },
          backgroundColor: Colors.black,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(
            shadows: [
              Shadow(
                color: Theme.of(context).colorScheme.primary,
                blurRadius: 3,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard_rounded),
              activeIcon: Icon(Icons.leaderboard_rounded),
              label: 'Leaderboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              activeIcon: Icon(Icons.person_rounded),
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }
}
