/*

TO DO PAGE: responsible for providing the cubit to view (UI)

- use BlocProvider

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_clean/domain/repository/todo_repo.dart';
import 'package:todo_clean/presentation/todo_cubit.dart';
import 'package:todo_clean/presentation/todo_view.dart';

class TodoPage extends StatelessWidget {
  final TodoRepo todoRepo;

  const TodoPage({Key? key, required this.todoRepo}) : super(key: key);

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(todoRepo),
      child: const TodoView(),
    );
  }
}
