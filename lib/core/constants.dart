import 'package:flutter/material.dart';

final ThemeData kBaseTheme = ThemeData.light();

final kTheme = kBaseTheme.copyWith();

const String kSomethingWentWrong = 'Что-то пошло не так!';

const String kUserDoesNotExist = 'Пользователя с такими данными не существует';

const String kAlreadyExists = 'Пользователь с таким email уже существует';

const String kSuccess = 'Успешно';

const Set kAllTags = {'IT', 'Живопись', 'Спорт', 'Интеллект'};
final Map<String, Color> kColorsTagMap = {
  'IT': Colors.purple[600],
  'Живопись': Colors.orange,
  'Спорт': Colors.lightBlueAccent,
  'Интеллект': Colors.green,
  'Микс': Colors.redAccent,
};
final Map<String, String> kEmojiMap = {
  'IT': '💻',
  'Живопись': '🎨',
  'Спорт': '⚽',
  'Интеллект': '♟',
  'Микс': '📖',
};
