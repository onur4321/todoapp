import 'package:todoapps/models/task_repository.dart';
import 'package:todoapps/screens/add_task_screen.dart';
import 'package:flutter/material.dart';
import 'package:todoapps/widgets/task.list.dart';
import 'package:provider/provider.dart';
import 'package:todoapps/helpers/database_helper.dart';
import 'package:todoapps/models/task_item.dart';
import 'dart:async';
import 'package:hive/hive.dart';
import 'package:todoapps/main.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  Box<TaskItem> todoBox;
  final TextEditingController titleController = TextEditingController();


  @override
  void initState() {
    // TODO: implement deactivate
    super.initState();
    todoBox = Hive.box<TaskItem>(todoBoxName);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30,
                    color: Colors.lightBlueAccent,
                  ),
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Cet Todo',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3.0,
                      color: Colors.white),
                ),
                Text(
                  '${Provider.of<TaskRepository>(context).taskCount()} Tasks (${Provider.of<TaskRepository>(context).incompleteTaskCount()} Incomplete)',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: TaskList(),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () {
          print('floating action button pressed');
          showModalBottomSheet(
              context: context, builder: (context) => AddTaskScreen());
        },
      ),
    );
  }
}