import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rest_api_example/data/models/todo.dart';
import 'package:flutter_rest_api_example/logic/cubits/todo_data/todo_data_cubit.dart';

import 'package:provider/provider.dart';

class PostTodoScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  TextEditingController todoUserID = TextEditingController();

  TextEditingController todoTitle = TextEditingController();

  bool? isCompleted = false;

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
        }, builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Card(
                      child: TextFormField(
                        controller: todoUserID,
                        decoration:
                            InputDecoration(hintText: "Please enter id"),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter valid id";
                          }
                          return null;
                        },
                      ),
                    ),
                    Card(
                      child: TextFormField(
                        controller: todoTitle,
                        decoration:
                            InputDecoration(hintText: "Please enter title"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter valid title";
                          }
                          return null;
                        },
                      ),
                    ),
                    Card(
                      child: Checkbox(
                        value: isCompleted,
                        onChanged: (isChecked) =>
                            {this.isCompleted = isChecked},
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("Back"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              var todo = new Todo();
                              todo.userId = int.parse(todoUserID.text);
                              todo.title = todoTitle.text;
                              todo.completed = isCompleted;
                              todo.id = 0;
                              BlocProvider.of<TodoDataCubit>(context)
                                  .postTodoData(todoUserID.text, todo );
                              Navigator.pop(context);
                            }
                          },
                          child: Text("Add"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
