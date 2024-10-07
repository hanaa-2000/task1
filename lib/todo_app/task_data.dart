import 'package:flutter/material.dart';
import 'package:task1/todo_app/tasks.dart';

class TaskData extends ChangeNotifier{

  List<Tasks> task = [
    Tasks(
      name: "go shopping",
    ),
    Tasks(
      name: "go shopping",
    ),

  ];

  void addTask(String newTask) async {

    task.add(Tasks(name: newTask));
    notifyListeners();

  }
  void updateChecked(Tasks task){

    task.checkedTask();
    notifyListeners();

  }
  void deleteTask(Tasks tasks){
    task.remove(tasks);
    notifyListeners();
    
  }






}