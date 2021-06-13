import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_midterm_2/data/models/expense.dart';
import 'package:flutter_midterm_2/logic/cubits/expense_cubit.dart';

class AddExpense extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController title = TextEditingController();

  final TextEditingController expenseAmount = TextEditingController();

  final TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add new expense"),
        ),
        body: BlocConsumer<ExpenseCubit, ExpenseState>(
            listener: (context, state) {
              if (state is ExpenseDataError) {
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
                        controller: title,
                        decoration:
                        InputDecoration(hintText: "Please enter title"),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter valid title";
                          }
                          return null;
                        },
                      ),
                    ),
                    Card(
                      child: TextFormField(
                        controller: description,
                        decoration:
                        InputDecoration(hintText: "Please enter description"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter valid title";
                          }
                          return null;
                        },
                      ),
                    ),
                    Card(
                      child: TextFormField(
                        controller: expenseAmount,
                        keyboardType: TextInputType.number,
                        decoration:
                        InputDecoration(
                            hintText: "Please enter expense amount"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter valid expense amount";
                          }
                          return null;
                        },
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
                            if (_formKey.currentState.validate()) {
                              var expense = Expense(
                                  title: title.text,
                                  description: description.text,
                                  expenseAmount: double.parse(
                                      expenseAmount.text)
                              );
                              BlocProvider.of<ExpenseCubit>(context)
                                  .addExpense(expense);
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
