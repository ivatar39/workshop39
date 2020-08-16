import 'package:auto_route/auto_route_annotations.dart';
import 'package:workshop39/features/workshops/presentation/pages/workshop_page.dart';

import '../../features/login/presentation/pages/login_page.dart';
import '../../features/login/presentation/pages/registration_page.dart';
import '../../features/profile/presentation/profile_page.dart';
import '../../features/workshops/presentation/pages/favorites_page.dart';
import '../../features/workshops/presentation/pages/home_page.dart';
import 'navigation_page.dart';

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
  MaterialRoute(
    page: WorkshopPage,
  ),
])
class $Router {}
