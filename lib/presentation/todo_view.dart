/*

TO DO VIEW: responsible for UI

- use BlocBuilder

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_clean/domain/models/todo.dart';
import 'package:todo_clean/presentation/todo_cubit.dart';

class TodoView extends StatelessWidget {
  const TodoView({Key? key}) : super(key: key);

  // show dialog box for user to type
  void _showAddTodoBox(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    final textController = TextEditingController();

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(controller: textController),
              actions: [
                // cancel button
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                // add button
                TextButton(
                  onPressed: () {
                    todoCubit.addTodo(textController.text);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Add'),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    //SCAFFOLD
    return Scaffold(
      //FAB
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showAddTodoBox(context),
      ),
      // BLOC BUILDER
      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, todos) {
          // LIST VIEW
          return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                // get individual todo from list
                final todo = todos[index];

                // LIST TILE UI
                return ListTile(
                  // text
                  title: Text(todo.text),

                  // check box
                  leading: Checkbox(
                    value: todo.isCompleted,
                    onChanged: (value) => todoCubit.toggle(todo),
                  ),

                  // delete button
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => todoCubit.delete(todo),
                  ),
                );
              });
        },
      ),
    );
  }
}
