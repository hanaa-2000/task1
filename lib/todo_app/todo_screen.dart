import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/todo_app/task_data.dart';
import 'package:task1/todo_app/tasks.dart';

import 'add_task.dart';
import 'list_task.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Padding(
        padding:
            const EdgeInsets.only(top: 50, bottom: 30, left: 20, right: 20),
        child: Consumer<TaskData>(
          builder: (context, data, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.playlist_add_check,
                      color: Colors.white,
                      size: 35,
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      "ToDayDo",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "${data.task.length} Tasks",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: data.task.length,
                          itemBuilder: (context, index) {
                            return ListTask(
                              onChanged: (value) {
                                data.updateChecked(data.task[index]);
                              },
                              isChecked: data.task[index].isDone!,
                              nameTask: data.task[index].name!,
                              onLongPress: () {
                                data.deleteTask(data.task[index]);
                              },
                            );
                          })),
                ),
              ],
            );
          },

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child:  AddTask(
                        addNewTasks: (value){
                          Provider.of<TaskData>(context,listen: false).addTask(value);
                          Navigator.of(context).pop();
                        },

                      )));
            },
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
