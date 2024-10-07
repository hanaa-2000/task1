import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key, required this.addNewTasks, });
  final void Function(String) addNewTasks;
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String ?  newTask;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Add Task",
            style: TextStyle(
                color: Colors.indigo,
                fontSize: 21,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 30,
          ),
           TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
                border: InputBorder.none, hintText: "enter task"),
            onChanged: (value){
              newTask=value;
            },
          ),
          const SizedBox(height: 30,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                elevation: 5,
              ),
              onPressed: () {

                widget.addNewTasks(newTask!);

              },
              child: const SizedBox(
                  width: double.infinity,
                  child: Center(
                      child: Text(
                    "Add",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w500),
                  )))),
        ],
      ),
    );
  }
}
