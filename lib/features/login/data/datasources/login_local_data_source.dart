import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors/exceptions.dart';
import '../models/credentials_model.dart';
import '../models/user_model.dart';

abstract class LoginLocalDataSource {
  /// Checks [SharedPreferences]
  ///
  /// retrieves user data
  ///
  /// Otherwise, throws [CacheException] or [UserNotFoundException]
  Future<UserModel> login(CredentialsModel credentialsModel);

  /// Checks [SharedPreferences]
  ///
  /// registers user data locally
  ///
  /// Otherwise, throws [CacheException] or [UserAlreadyExistsException]
  Future<void> register(UserModel userModel);
}

class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  final FlutterSecureStorage secureStorage;
  static final _log = Logger('LoginLocalDataSourceImpl');

  LoginLocalDataSourceImpl(this.secureStorage);

  @override
  Future<UserModel> login(CredentialsModel credentialsModel) async {
    _log.info(credentialsModel.email);

    final data = await secureStorage.read(key: credentialsModel.email);
    _log.info(data);
    if (data == null) {
      throw UserNotFoundException();
    }
    final user = UserModel.fromJson(jsonDecode(data));

    return user;
  }

  @override
  Future<void> register(UserModel userModel) async {
    try {
      final data = await secureStorage.read(key: userModel.email);
      _log.info(data);
      if (data == null) {
        return await secureStorage.write(
          key: userModel.email,
          value: jsonEncode(
            userModel.toJson(),
          ),
        );
      } else {
        throw UserAlreadyExistsException();
      }
    } on Exception catch (e) {
      _log.warning(e);
      throw CacheException();
    }
  }
}
