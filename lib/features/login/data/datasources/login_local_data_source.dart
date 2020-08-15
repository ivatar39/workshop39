import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workshop39/core/errors/exceptions.dart';
import 'package:workshop39/features/login/data/models/credentials_model.dart';
import 'package:workshop39/features/login/data/models/user_model.dart';

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
    try {
      final data = await secureStorage.read(key: credentialsModel.email);
      _log.info(data);
      final user = UserModel.fromJson(jsonDecode(data));
      if (user == null) {
        throw UserNotFoundException;
      }
      return user;
    } on Exception catch (e) {
      _log.warning(e);
      throw CacheException();
    }
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
