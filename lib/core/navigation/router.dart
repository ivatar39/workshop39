import 'package:auto_route/auto_route_annotations.dart';
import 'package:workshop39/core/navigation/navigation_page.dart';
import 'package:workshop39/features/profile/presentation/profile_page.dart';
import 'package:workshop39/features/workshops/presentation/pages/favorites_page.dart';

import '../../features/login/presentation/pages/login_page.dart';
import '../../features/login/presentation/pages/registration_page.dart';
import '../../features/workshops/presentation/pages/home_page.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(
    page: LoginPage,
    initial: true,
  ),
  MaterialRoute(
    page: RegistrationPage,
  ),
  MaterialRoute(
    page: HomePage,
  ),
  MaterialRoute(
    page: FavoritesPage,
  ),
  MaterialRoute(
    page: ProfilePage,
  ),
  MaterialRoute(
    page: NavigationPage,
  ),
])
class $Router {}
