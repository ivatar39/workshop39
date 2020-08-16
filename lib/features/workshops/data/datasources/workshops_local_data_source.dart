import '../models/workshop_model.dart';

abstract class WorkshopsLocalDataSource {
  /// Checks local var
  ///
  ///
  ///
  /// returns list of workshops
  Future<List<WorkshopModel>> getWorkshops();
}

class WorkshopsLocalDataSourceImpl implements WorkshopsLocalDataSource {
  @override
  Future<List<WorkshopModel>> getWorkshops() async {
    final List<WorkshopModel> workshops = [
      WorkshopModel(
          name: 'test1',
          description: 'test test test test test test test test test test test',
          beginTime: '2020-08-17 13:30:00',
          endTime: '2020-08-17 14:30:00',
          tags: {'IT', 'Спорт', 'Музыка'},
          url: 'https://zoom/2rida2r'),
      WorkshopModel(
          name: 'test2',
          description: 'test test test test test test test test test test test',
          beginTime: '2020-08-20 13:00:00',
          endTime: '2020-08-20 14:00:00',
          tags: {'Спорт'},
          url: 'https://zoom/2rida2r'),
      WorkshopModel(
          name: 'test3',
          description: 'test test test test test test test test test test test',
          beginTime: '2020-08-17 17:40:00',
          endTime: '2020-08-17 18:40:00',
          tags: {'IT'},
          url: 'https://zoom/2rida2r'),
      WorkshopModel(
          name: 'test4',
          description: 'test test test test test test test test test test test',
          beginTime: '2020-08-17 20:00:00',
          endTime: '2020-08-17 22:00:00',
          tags: {'Живопись'},
          url: 'https://zoom/2rida2r'),
      WorkshopModel(
          name: 'test5',
          description: 'test test test test test test test test test test test',
          beginTime: '2020-08-18 13:30:00',
          endTime: '2020-08-18 14:30:00',
          tags: {'Интеллект'},
          url: 'https://zoom/2rida2r'),
      WorkshopModel(
          name: 'test6',
          description: 'test test test test test test test test test test test',
          beginTime: '2020-08-17 11:00:00',
          endTime: '2020-08-17 12:00:00',
          tags: {'Спорт'},
          url: 'https://zoom/2rida2r'),
    ];
    await Future.delayed(Duration(milliseconds: 500));
    return workshops;
  }
}
