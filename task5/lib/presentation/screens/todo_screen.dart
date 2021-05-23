import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rest_api_example/logic/cubits/todo_data/todo_data_cubit.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key, required this.userID}) : super(key: key);
  final String userID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<TodoDataCubit, TodoDataState>(
        listener: (context, state) {
          if (state is TodoDataError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${state.message}')),
            );
          }
        },
        builder: (context, state) {
          if (state is TodoDataInitial) {
            BlocProvider.of<TodoDataCubit>(context)
                .getTodoData(userID.toString());
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TodoDataLoaded) {
            return ListView.builder(
              itemBuilder: (context, index) {
                var todo = state.todoList[index];
                return Dismissible(key: UniqueKey(), child: ListTile(
                  title: Text('${todo.title!}'),
                  trailing: Icon(todo.completed! ? Icons.done : Icons.close),
                ),
                    confirmDismiss: (direction) => showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text("Are you sure?"),
                          content: Text(
                              "Do you really want to delete this todo?"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("NO"),
                            ),
                            TextButton(
                                onPressed: () {
                                  BlocProvider.of<TodoDataCubit>(context).deleteTodo(todo.id, todo.userId.toString());
                                  Navigator.pop(context);
                                },
                                child: Text("YES"))
                          ],
                        ))
                );
              },
            );
          } else {
            return Center(
              child: Text('Ops! Something went wrong!'),
            );
          }
        },
      ),
    );
  }
}
