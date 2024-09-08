/* 

TO DO CUBIT - simple state management

Each cubit is a list of todos.

*/

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_clean/domain/models/todo.dart';
import 'package:todo_clean/domain/repository/todo_repo.dart';

class TodoCubit extends Cubit<List<Todo>> {
  // Reference todo repo
  final TodoRepo todoRepo;

  // Constructor initializes the cubit with an empty list of todos
  TodoCubit(this.todoRepo) : super([]) {
    loadTodos();
  }

  // L O A D
  Future<void> loadTodos() async {
    final todoList = await todoRepo.getTodos();
    // emit the fetched list as a new state
    emit(todoList);
  }

  // A D D
  Future<void> addTodo(String text) async {
    // create a new todo with unique id
    final newTodo = Todo(
      id: DateTime.now().millisecondsSinceEpoch,
      text: text,
    );

    // save the new todo to repo
    await todoRepo.addNewTodo(newTodo);

    // re-load
    loadTodos();
  }

  // D E L E T E
  Future<void> delete(Todo todo) async {
    // delete the todo from repo
    await todoRepo.deleteTodo(todo);

    // re-load
    loadTodos();
  }

  // T O G G L E
  Future<void> toggle(Todo todo) async {
    // toggle the todo's completion status
    final updatedTodo = todo.toggleCompletion();

    // update the todo in the repo
    await todoRepo.updateTodo(updatedTodo);

    // re-load
    loadTodos();
  }
}
