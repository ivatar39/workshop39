import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/navigation/bloc/bloc.dart';
import 'core/presentation/bloc/app_bloc.dart';
import 'core/util/network_info.dart';
import 'features/login/data/datasources/login_local_data_source.dart';
import 'features/login/data/repositories/login_repository_impl.dart';
import 'features/login/domain/repositories/login_repository.dart';
import 'features/login/domain/usecases/login.dart';
import 'features/login/domain/usecases/register_user.dart';
import 'features/login/presentation/bloc/login_form_bloc.dart';
import 'features/login/presentation/bloc/registration_form_bloc.dart';
import 'features/workshops/data/datasources/workshops_local_data_source.dart';
import 'features/workshops/data/repositories/workshops_repository_impl.dart';
import 'features/workshops/domain/repositories/workshops_repository.dart';
import 'features/workshops/domain/usecases/get_favorite_workshops.dart';
import 'features/workshops/domain/usecases/get_workshops.dart';
import 'features/workshops/domain/usecases/set_favorite_workshop.dart';
import 'features/workshops/presentation/bloc/favorites/bloc.dart';
import 'features/workshops/presentation/bloc/workshops/bloc.dart';

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
  final prefs = await SharedPreferences.getInstance();
  sl.registerSingleton(prefs);

  sl.registerSingleton<FlutterSecureStorage>(FlutterSecureStorage());

  /// AppBloc
  sl.registerSingleton<AppBloc>(AppBloc());

  /// Navigation
  sl.registerSingleton<NavigationBloc>(NavigationBloc());

  /// Login
  sl.registerSingleton<LoginLocalDataSource>(LoginLocalDataSourceImpl(sl()));

  sl.registerSingleton<LoginRepository>(LoginRepositoryImpl(sl()));

  sl.registerSingleton(Login(sl()));

  sl.registerFactory(() => LoginFormBloc(login: sl()));

  /// Registration

  sl.registerSingleton(RegisterUser(sl()));

  sl.registerFactory(() => RegistrationFormBloc(
        registerUser: sl(),
        login: sl(),
      ));

  /// Workshops
  sl.registerSingleton<WorkshopsLocalDataSource>(
      WorkshopsLocalDataSourceImpl(sl()));

  sl.registerSingleton<WorkshopsRepository>(WorkshopsRepositoryImpl(sl()));

  sl.registerSingleton(GetWorkshops(sl()));
  sl.registerSingleton(GetFavoriteWorkshops(sl()));
  sl.registerSingleton(SetFavoriteWorkshop(sl()));

  sl.registerFactory(() => WorkshopsBloc(getWorkshops: sl()));

  sl.registerFactory(() => FavoritesBloc(
        getFavoriteWorkshops: sl(),
        setFavoriteWorkshop: sl(),
      ));
}
