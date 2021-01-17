import 'package:hive/hive.dart';
part 'task_item.g.dart';
@HiveType(typeId: 0)
class TaskItem {
@HiveField(0)
  String title;
@HiveField(1)
  bool isDone;
@HiveField(2)

  TaskItem({this.title, this.isDone});

}
