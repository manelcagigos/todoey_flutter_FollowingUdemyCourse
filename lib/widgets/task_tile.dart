import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.isChecked,
    required this.taskTitle,
    required this.checkBoxCallback,
    required this.onDismissed,
  }) : super(key: key);

  final bool isChecked;
  final String taskTitle;
  final Function(bool?) checkBoxCallback;
  final Function() onDismissed;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.horizontal,
      onDismissed: (_) => onDismissed(),
      background: DeleteContainer(
        alignment: Alignment.centerLeft,
      ),
      secondaryBackground: DeleteContainer(
        alignment: Alignment.centerRight,
      ),
      child: ListTile(
        title: Text(
          taskTitle,
          style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: checkBoxCallback,
        ),
      ),
    );
  }
}

class DeleteContainer extends StatelessWidget {
  DeleteContainer({
    super.key,
    required this.alignment,
  });

  Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }
}
