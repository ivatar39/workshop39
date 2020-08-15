import 'package:auto_route/auto_route_annotations.dart';
import 'package:workshop39/features/workshops/presentation/pages/home_page.dart';

import '../../features/login/presentation/pages/login_page.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(
    page: LoginPage,
    initial: true,
  ),
  MaterialRoute(
    page: HomePage,
  ),
])
class $Router {}
