import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todoapps/models/task_item.dart';
import 'package:todoapps/models/task_repository.dart';
import 'package:todoapps/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_generator/hive_generator.dart';

const String todoBoxName = "todo";

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();
  
  Hive.init(document.path);
  Hive.registerAdapter(TaskItemAdapter());
  await Hive.openBox<TaskItem>(todoBoxName);
  runApp(ChangeNotifierProvider<TaskRepository>(
    create: (context) => TaskRepository(),
    child: MaterialApp(
      home: MainScreen(),
    ),
  ));
}