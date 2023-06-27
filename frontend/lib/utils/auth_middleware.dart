/// A middleware class for handling authentication and redirecting to the appropriate page.
///
/// If the user is not signed in, they are redirected to the onboarding page.
/// If the user is signed in, they are redirected to the AllPagesNav (HomePage by default).
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sahara/routes/routes.dart';

class AuthManager extends GetMiddleware {

  /// Returns the priority of the middleware.
  ///
  /// The higher the priority, the earlier the middleware is executed.
  /// Since this middleware doesn't depend on other middlewares, its priority is set to 0.
  @override
  int? get priority => 0;

  /// Redirects to the appropriate page based on user authentication status.
  ///
  /// If the user is not signed in, they are redirected to the onboarding page.
  /// If the user is signed in, they are redirected to the AllPagesNav (HomePage by default).
  ///
  /// @param route The name of the route being accessed.
  /// @return A [RouteSettings] object representing the appropriate route to redirect to, or null if no redirect is necessary.
  @override
  RouteSettings? redirect(String? route) {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return const RouteSettings(name: Routes.app);
    }
    return null;
  }
}
