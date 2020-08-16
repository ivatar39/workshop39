// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/login/presentation/pages/login_page.dart';
import '../../features/login/presentation/pages/registration_page.dart';
import '../../features/profile/presentation/profile_page.dart';
import '../../features/workshops/presentation/pages/favorites_page.dart';
import '../../features/workshops/presentation/pages/home_page.dart';
import 'navigation_page.dart';

class Routes {
  static const String loginPage = '/';
  static const String registrationPage = '/registration-page';
  static const String homePage = '/home-page';
  static const String favoritesPage = '/favorites-page';
  static const String profilePage = '/profile-page';
  static const String navigationPage = '/navigation-page';
  static const all = <String>{
    loginPage,
    registrationPage,
    homePage,
    favoritesPage,
    profilePage,
    navigationPage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.loginPage, page: LoginPage),
    RouteDef(Routes.registrationPage, page: RegistrationPage),
    RouteDef(Routes.homePage, page: HomePage),
    RouteDef(Routes.favoritesPage, page: FavoritesPage),
    RouteDef(Routes.profilePage, page: ProfilePage),
    RouteDef(Routes.navigationPage, page: NavigationPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    LoginPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginPage(),
        settings: data,
      );
    },
    RegistrationPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegistrationPage(),
        settings: data,
      );
    },
    HomePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomePage(),
        settings: data,
      );
    },
    FavoritesPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => FavoritesPage(),
        settings: data,
      );
    },
    ProfilePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProfilePage(),
        settings: data,
      );
    },
    NavigationPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => NavigationPage(),
        settings: data,
      );
    },
  };
}
