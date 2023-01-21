import 'package:hive/hive.dart';
part 'databasetodo.g.dart';

@HiveType(typeId: 1, adapterName: 'ModelAdapter')
class ModelTodo {
  @HiveField(0)
  late String titleActivity;
  @HiveField(1)
  late bool checkActivity;

  ModelTodo(this.titleActivity, this.checkActivity);
}
