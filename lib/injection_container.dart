import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'core/util/network_info.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  /// Core
  sl.registerSingleton(
    DataConnectionChecker(),
  );
  sl.registerSingleton<NetworkInfo>(
    NetworkInfoImpl(
      sl(),
    ),
  );
}
