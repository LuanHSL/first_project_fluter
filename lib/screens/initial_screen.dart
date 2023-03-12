import 'package:flutter/material.dart';
import 'package:tasks_level/components/task.dart';
import 'package:tasks_level/data/task_inherited.dart';
import 'package:tasks_level/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        leading: Container(),
      ),
      body: Container(
        color: Colors.blueGrey,
        child: ListView(
          children: TaskInherited.of(context).taskList,
          padding: EdgeInsets.only(top: 10, bottom: 70),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (contextNew) => FormScreen(taskContext: context,),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
