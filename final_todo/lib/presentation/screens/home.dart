import 'package:final_todo/data/models/todos.dart';
import 'package:final_todo/logic/cubits/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget{
  final _editFormKey = GlobalKey<FormState>();

  final TextEditingController editTitle =
  TextEditingController();

  final TextEditingController editTask =
  TextEditingController();

  final TextEditingController editDetails =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<TodoCubit, TodoState>(
        listener: (context, state) {
          if (state is TodoDataError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is TodoInitial) {
            BlocProvider.of<TodoCubit>(context).getTodos();

            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TodoDataLoaded) {
            return Column(children: [
              Container(
                height: 280,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "TODO APP",
                      style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          color: Color(0xff04a3a3),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: IconButton(
                          color: Colors.white,
                          iconSize: 30,
                          icon: Icon(Icons.add),
                          onPressed: () {
                            final _formKey = GlobalKey<FormState>();

                            final TextEditingController title =
                                TextEditingController();

                            final TextEditingController task =
                                TextEditingController();

                            final TextEditingController details =
                                TextEditingController();
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return SingleChildScrollView(child :Container(
                                      height: 500,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 30),
                                      decoration: BoxDecoration(
                                        color: Color(0xff04a3a3),
                                      ),
                                      child: Form(
                                          key: _formKey,
                                          child: Column(
                                            children: [
                                              TextFormField(
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20.0),
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 10,
                                                          horizontal: 20),
                                                  hintText:
                                                      'Please enter title',
                                                  hintStyle: TextStyle(
                                                    color: Color(0xff66C7C7),
                                                  ),
                                                  border: UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.white,
                                                          style: BorderStyle
                                                              .solid)),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .white)),
                                                ),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return "Please enter valid title";
                                                  }
                                                  return null;
                                                },
                                                textAlign: TextAlign.center,
                                                controller: title,
                                              ),
                                              TextFormField(
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20.0),
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 10,
                                                          horizontal: 20),
                                                  hintText: 'Please enter task',
                                                  hintStyle: TextStyle(
                                                    color: Color(0xff66C7C7),
                                                  ),
                                                  border: UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.white,
                                                          style: BorderStyle
                                                              .solid)),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .white)),
                                                ),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return "Please enter valid task";
                                                  }
                                                  return null;
                                                },
                                                textAlign: TextAlign.center,
                                                controller: task,
                                              ),
                                              TextFormField(
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20.0),
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 10,
                                                          horizontal: 20),
                                                  hintText:
                                                      'Please enter details',
                                                  hintStyle: TextStyle(
                                                    color: Color(0xff66C7C7),
                                                  ),
                                                  border: UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.white,
                                                          style: BorderStyle
                                                              .solid)),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .white)),
                                                ),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return "Please enter valid task detail";
                                                  }
                                                  return null;
                                                },
                                                textAlign: TextAlign.center,
                                                controller: details,
                                              ),
                                              SizedBox(height: 20),
                                              Row(
                                                children: [
                                                  TextButton(
                                                      onPressed: () {
                                                        if (_formKey
                                                            .currentState
                                                            .validate()) {
                                                          var todo = Todo(
                                                              title: title.text,
                                                              todoDescription:
                                                                  details.text,
                                                              todoTask:
                                                                  task.text);
                                                          BlocProvider.of<
                                                                      TodoCubit>(
                                                                  context)
                                                              .addTodo(todo);
                                                          Navigator.pop(
                                                              context);
                                                        }
                                                      },
                                                      child: Text(
                                                        "SUBMIT",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff04a3a3),
                                                            fontSize: 20),
                                                      ),
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all<Color>(
                                                                      Colors
                                                                          .white),
                                                          shape: MaterialStateProperty.all<
                                                                  RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        18.0),
                                                          ))))
                                                ],
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                              )
                                            ],
                                          ))));
                                });
                          }),
                    )
                  ],
                ),
              ),
              Flexible(
                  child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color(0xff6cb4b1),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                          child: ListView.builder(
                        itemBuilder: (context, index) {
                          var todo = state.todoList[index];
                          return GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return SingleChildScrollView(child: Container(
                                          height: 500,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 40),
                                          decoration: BoxDecoration(
                                            color: Color(0xff04a3a3),
                                          ),
                                          child: Column(children: [
                                            Text(
                                              todo.title,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 35,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              todo.todoTask,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              "TODO DESCRIPTION",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 23,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              todo.todoDescription,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                GestureDetector(
                                                  child: Container(
                                                    height: 90,
                                                    width: 90,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Color(0xff7FB7B5),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5))),
                                                    child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                              child: Icon(
                                                            Icons
                                                                .assignment_turned_in_outlined,
                                                            color: Colors.white,
                                                            size: 50,
                                                          )),
                                                          Text(
                                                            "Done",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          )
                                                        ]),
                                                  ),
                                                  onTap: () {
                                                    if (todo.isCompleted ==
                                                        null ||
                                                        !todo.isCompleted) {
                                                      todo.isCompleted = true;
                                                    } else {
                                                      todo.isCompleted = false;
                                                    }
                                                    BlocProvider.of<TodoCubit>(
                                                        context)
                                                        .updateTodo(todo);
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                                GestureDetector(
                                                  child: Container(
                                                    height: 90,
                                                    width: 90,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Color(0xff7FB7B5),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5))),
                                                    child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                              child: Icon(
                                                            Icons.edit,
                                                            color: Colors.white,
                                                            size: 50,
                                                          )),
                                                          Text(
                                                            "Edit",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          )
                                                        ]),
                                                  ),
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                    showModalBottomSheet(
                                                        context: context,
                                                        builder: (context) {


                                                          editTitle.text = todo.title;
                                                          editTask.text = todo.todoTask;
                                                          editDetails.text = todo.todoDescription;
                                                          return SingleChildScrollView(child: Container(
                                                            height: 500,
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                  vertical:
                                                                  0,
                                                                  horizontal:
                                                                  30),
                                                              decoration:
                                                              BoxDecoration(
                                                                color: Color(
                                                                    0xff04a3a3),
                                                              ),
                                                              child: Form(
                                                                  key: _editFormKey,
                                                                  child: Column(
                                                                    children: [
                                                                      TextFormField(
                                                                        style: TextStyle(
                                                                            color:
                                                                            Colors.white,
                                                                            fontSize: 20.0),
                                                                        decoration:
                                                                        InputDecoration(
                                                                          contentPadding: EdgeInsets.symmetric(
                                                                              vertical: 10,
                                                                              horizontal: 20),
                                                                          hintText:
                                                                          'Please enter title',
                                                                          hintStyle:
                                                                          TextStyle(
                                                                            color:
                                                                            Color(0xff66C7C7),
                                                                          ),
                                                                          border:
                                                                          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white, style: BorderStyle.solid)),
                                                                          focusedBorder:
                                                                          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                                                        ),
                                                                        validator:
                                                                            (value) {
                                                                          if (value == null ||
                                                                              value.isEmpty) {
                                                                            return "Please enter valid title";
                                                                          }
                                                                          return null;
                                                                        },
                                                                        textAlign:
                                                                        TextAlign.center,
                                                                        controller:
                                                                        editTitle,
                                                                      ),
                                                                      TextFormField(
                                                                        style: TextStyle(
                                                                            color:
                                                                            Colors.white,
                                                                            fontSize: 20.0),
                                                                        decoration:
                                                                        InputDecoration(
                                                                          contentPadding: EdgeInsets.symmetric(
                                                                              vertical: 10,
                                                                              horizontal: 20),
                                                                          hintText:
                                                                          'Please enter task',
                                                                          hintStyle:
                                                                          TextStyle(
                                                                            color:
                                                                            Color(0xff66C7C7),
                                                                          ),
                                                                          border:
                                                                          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white, style: BorderStyle.solid)),
                                                                          focusedBorder:
                                                                          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                                                        ),
                                                                        validator:
                                                                            (value) {
                                                                          if (value == null ||
                                                                              value.isEmpty) {
                                                                            return "Please enter valid task";
                                                                          }
                                                                          return null;
                                                                        },
                                                                        textAlign:
                                                                        TextAlign.center,
                                                                        controller:
                                                                        editTask,
                                                                      ),
                                                                      TextFormField(
                                                                        style: TextStyle(
                                                                            color:
                                                                            Colors.white,
                                                                            fontSize: 20.0),
                                                                        decoration:
                                                                        InputDecoration(
                                                                          contentPadding: EdgeInsets.symmetric(
                                                                              vertical: 10,
                                                                              horizontal: 20),
                                                                          hintText:
                                                                          'Please enter details',
                                                                          hintStyle:
                                                                          TextStyle(
                                                                            color:
                                                                            Color(0xff66C7C7),
                                                                          ),
                                                                          border:
                                                                          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white, style: BorderStyle.solid)),
                                                                          focusedBorder:
                                                                          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                                                                        ),
                                                                        validator:
                                                                            (value) {
                                                                          if (value == null ||
                                                                              value.isEmpty) {
                                                                            return "Please enter valid task detail";
                                                                          }
                                                                          return null;
                                                                        },
                                                                        textAlign:
                                                                        TextAlign.center,
                                                                        controller:
                                                                        editDetails,
                                                                      ),
                                                                      SizedBox(
                                                                          height:
                                                                          20),
                                                                      Row(
                                                                        children: [
                                                                          TextButton(
                                                                              onPressed: () {
                                                                                if (_editFormKey.currentState.validate()) {
                                                                                  todo.title = editTitle.text;
                                                                                  todo.todoTask = editTask.text;
                                                                                  todo.todoDescription = editDetails.text;
                                                                                  BlocProvider.of<TodoCubit>(context).updateTodo(todo);
                                                                                  Navigator.pop(context);
                                                                                }
                                                                              },
                                                                              child: Text(
                                                                                "EDIT",
                                                                                style: TextStyle(color: Color(0xff04a3a3), fontSize: 20),
                                                                              ),
                                                                              style: ButtonStyle(
                                                                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                                                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(18.0),
                                                                                  ))))
                                                                        ],
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment.center,
                                                                      )
                                                                    ],
                                                                  ))));
                                                        });
                                                  },
                                                ),
                                                GestureDetector(
                                                  child: Container(
                                                    height: 90,
                                                    width: 90,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Color(0xff7FB7B5),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5))),
                                                    child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                              child: Icon(
                                                            Icons.delete,
                                                            color: Colors.white,
                                                            size: 50,
                                                          )),
                                                          Text(
                                                            "Delete",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          )
                                                        ]),
                                                  ),
                                                  onTap: () {
                                                    showDialog(
                                                        context: context,
                                                        builder:
                                                            (_) => AlertDialog(
                                                                  title: Text(
                                                                      "Are you sure?"),
                                                                  content: Text(
                                                                      "Do you really want to delete this todo?"),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(context),
                                                                      child: Text(
                                                                          "NO"),
                                                                    ),
                                                                    TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          print(
                                                                              todo.id);
                                                                          BlocProvider.of<TodoCubit>(context)
                                                                              .deleteTodo(todo.id);
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child: Text(
                                                                            "YES"))
                                                                  ],
                                                                ));
                                                  },
                                                )
                                              ],
                                            )
                                          ])));
                                    });
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Column(
                                          children: [
                                            Text(
                                              todo.title,
                                              style: TextStyle(
                                                fontSize: 25,
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                            Text(todo.todoTask,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                ),
                                                textAlign: TextAlign.start)
                                          ],
                                        )),
                                    Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                          color: todo.isCompleted == null ||
                                                  !todo.isCompleted
                                              ? Color(0xff969897)
                                              : Color(0xff0ECC57),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50))),
                                      child: IconButton(
                                        icon: Icon(Icons
                                            .assignment_turned_in_outlined),
                                        color: Colors.white,
                                        onPressed: () {},
                                      ),
                                    )
                                  ],
                                ),
                              ));
                        },
                        itemCount: state.todoList.length,
                      )))
            ]);
          } else {
            return Center(child: Text("Todo Where?"));
          }
        },
      ),
    );
  }

  @override
  // TODO: implement context
  BuildContext get context => throw UnimplementedError();

  @override
  void deactivate() {
    // TODO: implement deactivate
  }

  @override
  void didUpdateWidget(covariant StatefulWidget oldWidget) {
    // TODO: implement didUpdateWidget
  }

  @override
  void initState() {
    // TODO: implement initState
  }

  @override
  // TODO: implement mounted
  bool get mounted => throw UnimplementedError();

  @override
  void reassemble() {
    // TODO: implement reassemble
  }

  @override
  void setState(fn) {
    // TODO: implement setState
  }

  @override
  // TODO: implement widget
  StatefulWidget get widget => throw UnimplementedError();
}
