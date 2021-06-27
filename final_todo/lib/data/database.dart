import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_todo/data/models/todos.dart';
import 'package:flutter/material.dart';


final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collectionReference = _firestore.collection("users");

class Database{
  static String userID;
  List<Todo> todo = [];
  //Save todo to firebase database
  Future<void> addTodo(Todo todo) async {
    DocumentReference documentReference =
    _collectionReference.doc(userID).collection(("todo")).doc();

    await documentReference
        .set(todo.toJson())
        .whenComplete(() => print("Todo has been added to the database"))
        .catchError((e)=> print(e));
  }

  Future<List<Todo>> readTodos() async{
    debugPrint(_collectionReference.id);
    CollectionReference todoReference = _collectionReference
        .doc(userID)
        .collection('todo');
    //My eyes are suffering at this point
    var idk = await todoReference.get();
    var docs = idk.docs;
    // todo = await todoReference.snapshots().forEach(( QuerySnapshot element) {
    //   element.docs.map((e) => Todo.fromJson(e.data())).toList();
    // }) as List<Todo>;
    // print("list");
    // print(todo);
    for (int i = 0; i < docs.length; i++) {
      todo.add(Todo.fromJson(docs[i].data(), docs[i].id));
      print(docs[i].id);
    }

    return todo;
  }

  // Update todo in firebase database
  Future<void> updateTodo(Todo todo) async {
    DocumentReference todoReference = _collectionReference.doc(userID)
        .collection("todo")
        .doc(todo.id);

    await todoReference.update(todo.toJson())
        .whenComplete(() => ()=> print("Todo updated successfully"))
        .catchError((e) => print(e));
  }
  //Delete item from firebase database
  Future<void> deleteTodo(String todoId) async {
    DocumentReference todoReference = _collectionReference.doc(userID)
        .collection("todo")
        .doc(todoId);

    await todoReference.delete()
        .whenComplete(() {
      print("Todo deleted successfully");
      print(todoId);
    })
        .catchError((e)=> print(e));
  }
}