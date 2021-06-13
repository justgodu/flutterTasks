import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_midterm_2/logic/cubits/expense_cubit.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses"),
      ),
      body: BlocConsumer<ExpenseCubit, ExpenseState>(
        listener: (context, state) {
          if (state is ExpenseDataError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is ExpenseInitial) {
            BlocProvider.of<ExpenseCubit>(context).getExpenses();

            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ExpenseDataLoaded) {
            return ListView.builder(
                itemBuilder: (context, index){
              var expense = state.expenseList[index];
              return ListTile(
                onTap: (){
                  Navigator.of(context).pushNamed("/edit-expense", arguments: {"index": index});
                },
                onLongPress: ()=> showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text("Are you sure?"),
                      content: Text("Do you really want to delete this Expense?"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("NO"),
                        ),
                        TextButton(
                            onPressed: () {
                              print(expense.id);
                              BlocProvider.of<ExpenseCubit>(context)
                                  .deleteExpense(expense.id);
                              Navigator.pop(context);
                            },
                            child: Text("YES"))
                      ],
                    ),
                ),
                title: Text(expense.title + " " + expense.expenseAmount.toString()),
                subtitle: Text("Description: " + expense.description),
              );
            },
            itemCount: state.expenseList.length,
            );

          } else {
            return Center(
                child: Text("Expense Where?")
            );
          }
        },

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/add-expense");
        },
        child: Icon(Icons.add),
      ),

    );
  }
}
