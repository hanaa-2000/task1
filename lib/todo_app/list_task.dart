import 'package:flutter/material.dart';

class ListTask extends StatelessWidget {

  const ListTask ({super.key, required this.onChanged,required this.isChecked, required this.nameTask, this.onLongPress});
  final bool isChecked;
  final void Function(bool?)? onChanged;
  final void Function()? onLongPress;
final String nameTask;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 4),
      child: ListTile(
        title: Text(
         nameTask,
          style: TextStyle(
              decoration:isChecked
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              color: Colors.black45, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        trailing: Checkbox(
          activeColor: Colors.teal,
          value: isChecked,
          onChanged:onChanged,

        ),
        onLongPress: onLongPress,
      ),
    );
  }
}


