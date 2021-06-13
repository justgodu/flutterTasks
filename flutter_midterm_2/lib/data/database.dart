import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_midterm_2/data/models/expense.dart';


final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collectionReference = _firestore.collection("users");

class Database{
  static String userID = "hi";
  List<Expense> expenses = [];
  //Save expense to firebase database
  Future<void> addExpense(Expense expense) async {
    DocumentReference documentReference =
        _collectionReference.doc(userID).collection(("expenses")).doc();

    await documentReference
      .set(expense.toJson())
      .whenComplete(() => print("Expense has been added to the database"))
      .catchError((e)=> print(e));
  }

  Future<List<Expense>> readExpenses() async{
    debugPrint(_collectionReference.id);
    CollectionReference expensesReference = _collectionReference
        .doc(userID)
        .collection('expenses');
    //My eyes are suffering at this point
    var idk = await expensesReference.get();
    var docs = idk.docs;
    // expenses = await expensesReference.snapshots().forEach(( QuerySnapshot element) {
    //   element.docs.map((e) => Expense.fromJson(e.data())).toList();
    // }) as List<Expense>;
    // print("list");
    // print(expenses);
    for (int i = 0; i < docs.length; i++) {
      expenses.add(Expense.fromJson(docs[i].data(), docs[i].id));
      print(docs[i].id);
    }

    return expenses;
  }

  // Update expense in firebase database
  Future<void> updateExpense(Expense expense) async {
    DocumentReference expenseReference = _collectionReference.doc(userID)
        .collection("expenses")
        .doc(expense.id);

    await expenseReference.update(expense.toJson())
        .whenComplete(() => ()=> print("Expense updated successfully"))
        .catchError((e) => print(e));
  }
  //Delete item from firebase database
  Future<void> deleteExpense(String expenseId) async {
    DocumentReference expenseReference = _collectionReference.doc(userID)
        .collection("expenses")
        .doc(expenseId);

    await expenseReference.delete()
        .whenComplete(() {
          print("Expense deleted successfully");
        print(expenseId);
        })
        .catchError((e)=> print(e));
  }
}