import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final isLoggedIn = token != null;

    if (isLoggedIn) {
      resolver.next(true);
    } else {
      router.push(const LoginRoute());
    }
  }
}
