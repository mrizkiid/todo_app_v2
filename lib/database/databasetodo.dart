import 'package:hive/hive.dart';
part 'databasetodo.g.dart';

@HiveType(typeId: 2, adapterName: 'ModelAdapter')
class ModelTodo extends HiveObject {
  @HiveField(2)
  late String titleActivity;
  @HiveField(3)
  late bool checkActivity;

  ModelTodo(this.titleActivity, this.checkActivity);
}
