import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/injection.dart';
import '../logic/leaderboard_cubit.dart';
import '../logic/leaderboard_state.dart';

@RoutePage()
class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LeaderboardCubit>()..loadLeaderboard(),
      child: Scaffold(
        backgroundColor: const Color(0xFF1E1E1E),
        appBar: AppBar(
          title: Text(
            '<Leaderboard />',
            style: GoogleFonts.firaCode(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color(0xFF1E1E1E),
          elevation: 0,
        ),
        body: BlocBuilder<LeaderboardCubit, LeaderboardState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (entries) {
                return ListView.separated(
                  itemCount: entries.length,
                  separatorBuilder: (context, index) =>
                      Divider(color: Colors.grey[800]),
                  itemBuilder: (context, index) {
                    final entry = entries[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: _getRankColor(index),
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            color: _getRankTextColor(index),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        entry.name ?? 'Anonymous',
                        style: GoogleFonts.firaCode(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Solved: ${entry.problemsSolved}',
                        style: GoogleFonts.firaCode(color: Colors.grey),
                      ),
                      trailing: Text(
                        '${entry.score} pts',
                        style: GoogleFonts.firaCode(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    );
                  },
                );
              },
              error: (message) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Error: $message',
                      style: const TextStyle(color: Colors.red),
                    ),
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

  Color _getRankColor(int index) {
    switch (index) {
      case 0:
        return Colors.yellow.withOpacity(0.2);
      case 1:
        return Colors.grey.withOpacity(0.2);
      case 2:
        return Colors.orange.withOpacity(0.2);
      default:
        return Colors.grey[800]!;
    }
  }

  Color _getRankTextColor(int index) {
    switch (index) {
      case 0:
        return Colors.yellow;
      case 1:
        return Colors.grey;
      case 2:
        return Colors.orange;
      default:
        return Colors.white;
    }
  }
}
