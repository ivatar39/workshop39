import 'package:auto_route/auto_route_annotations.dart';

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
])
class $Router {}
