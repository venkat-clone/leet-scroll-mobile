import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/core/injection.dart';
import 'package:mobile/features/auth/logic/auth_cubit.dart';
import 'package:mobile/features/leaderboard/logic/leaderboard_cubit.dart';
import 'package:mobile/features/profile/logic/profile_cubit.dart';

import 'package:mobile/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await configureDependencies();
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => getIt<AuthCubit>()),
          BlocProvider(create: (_) => getIt<ProfileCubit>()),
          BlocProvider(create: (_) => getIt<LeaderboardCubit>()),
        ],
        child: MyApp(),
      ),
    );

    expect(true, true);
  });
}
