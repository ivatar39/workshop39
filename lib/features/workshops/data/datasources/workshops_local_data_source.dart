import 'dart:convert';

import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workshop39/core/errors/exceptions.dart';

import '../models/workshop_model.dart';

abstract class WorkshopsLocalDataSource {
  /// Checks local var
  ///
  ///
  ///
  /// returns list of workshops
  Future<List<WorkshopModel>> getWorkshops();

  /// Checks [SharedPreferences]
  ///
  ///
  ///
  /// returns list of favorite workshops
  Future<List<WorkshopModel>> getFavoriteWorkshops();

  /// Checks [SharedPreferences]
  ///
  ///
  ///
  /// returns list of favorite workshops
  Future<void> setFavoriteWorkshop(WorkshopModel workshopModel);
}

class WorkshopsLocalDataSourceImpl implements WorkshopsLocalDataSource {
  final SharedPreferences sharedPreferences;
  static final _log = Logger('WorkshopsLocalDataSourceImpl');

  WorkshopsLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<List<WorkshopModel>> getWorkshops() async {
    final List<WorkshopModel> workshops = [
      WorkshopModel(
          name: 'Python',
          description:
              'В этом мастер-классе я поделюсь своим опытом работы с этим '
              'языком, его недостатки и плюсы, отвечу на интересующие для '
              'вас вопросы. P.S. Этот курс будет теоритечским, а на '
              'следующей неделе будет практическая часть.',
          beginTime: '2020-08-17 16:30:00',
          endTime: '2020-08-17 18:30:00',
          tags: {'IT'}.toList(),
          url: 'https://zoom/2rida2r'),
      WorkshopModel(
          name: 'Java',
          description: 'В этом мастер-классе я поделюсь своим опытом работы с '
              'этим языком, его недостатки и плюсы, отвечу на интересующие для '
              'вас вопросы. P.S. Этот курс будет теоритечским, а на следующей '
              'неделе будет практическая часть.',
          beginTime: '2020-08-18 14:30:00',
          endTime: '2020-08-18 15:30:00',
          tags: {'IT'}.toList(),
          url: 'https://zoom/2rida2r'),
      WorkshopModel(
          name: 'Оригами',
          description: 'На данном мастер-классе вы узнаете историю оригами, '
              'и как правильно его складывать',
          beginTime: '2020-08-17 10:40:00',
          endTime: '2020-08-17 11:40:00',
          tags: {'Интеллект'}.toList(),
          url: 'https://zoom/2rida2r'),
      WorkshopModel(
          name: 'Графический планшет',
          description: 'На мастер-классе вы узнаете основы рисования на '
              'графическом планшете, а так же мы будем анимировать '
              'ваших собственных персонажей',
          beginTime: '2020-08-20 11:30:00',
          endTime: '2020-08-20 12:30:00',
          tags: {'Живопись'}.toList(),
          url: 'https://zoom/2rida2r'),
      WorkshopModel(
          name: 'Картины маслом',
          description: 'Этот мастер-класс ознакомит вас с основами '
              'работы по холсту маслянными красками',
          beginTime: '2020-08-17 13:30:00',
          endTime: '2020-08-17 14:30:00',
          tags: {'Живопись'}.toList(),
          url: 'https://zoom/2rida2r'),
      WorkshopModel(
          name: 'Фитнес-обучение',
          description: 'Благодаря данному мастер-классу вы '
              'узнаете какими навыками должен обладать фитнес-тренер.',
          beginTime: '2020-08-19 10:15:00',
          endTime: '2020-08-19 12:45:00',
          tags: {'Спорт'}.toList(),
          url: 'https://zoom/2rida2r'),
      WorkshopModel(
          name: 'Нарисовать пазлы',
          description: 'За этот час вы сможете понять разработку пазлов и '
              'создать свой личный дизайн своими руками',
          beginTime: '2020-08-21 19:30:00',
          endTime: '2020-08-21 20:15:00',
          tags: {'Живопись', 'Интеллект'}.toList(),
          url: 'https://zoom/2rida2r'),
      WorkshopModel(
          name: '3D-моделирование',
          description: 'На данном мастер-классе мы расскажем вам про '
              'основы моделирования, а практическая часть '
              'будет выполненна в моей собсвенной программе',
          beginTime: '2020-08-19 15:10:00',
          endTime: '2020-08-19 16:30:00',
          tags: {'Живопись', 'IT'}.toList(),
          url: 'https://zoom/2rida2r'),
    ];
    await Future.delayed(Duration(milliseconds: 500));
    return workshops;
  }

  @override
  Future<List<WorkshopModel>> getFavoriteWorkshops() async {
    try {
      final List<String> list =
          await sharedPreferences.getStringList(kFavorites);

      final List<WorkshopModel> models = [];
      if (list == null) {
        return models;
      }
      for (final item in list) {
        final WorkshopModel model =
            WorkshopModel.fromJson(jsonDecode(item.toString()));
        models.add(model);
      }
      return models;
    } on Exception catch (e) {
      _log.warning(e);
      throw CacheException();
    }
  }

  @override
  Future<void> setFavoriteWorkshop(WorkshopModel workshopModel) async {
    final list = await sharedPreferences.getStringList(kFavorites);

    final stringWorkshop = jsonEncode(workshopModel.toJson());
    final List<String> items = [];

    if (list == null) {
      items.add(stringWorkshop);
    } else {
      for (final item in list) {
        items.add(item);
      }
      items.add(stringWorkshop);
    }
    return await sharedPreferences.setStringList(kFavorites, items);
  }
}

const String kFavorites = 'favorites';
