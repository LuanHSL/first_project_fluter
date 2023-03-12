import 'package:flutter/material.dart';
import 'package:tasks_level/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    Task('Aprender Flutter', 'assets/images/estudar_flutter.png', 2),
    Task('Andar de bike', 'assets/images/andar_bike.webp', 3),
    Task('Meditar', 'assets/images/meditar.jpeg', 5),
    Task('Jogar', 'assets/images/jogar.jpg', 4),
    Task('Ler', 'assets/images/ler.jpg', 1),
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(Task(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited old) {
    return old.taskList.length != taskList.length;
  }
}
