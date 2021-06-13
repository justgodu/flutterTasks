import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_midterm_2/data/database.dart';
import 'package:flutter_midterm_2/data/models/expense.dart';

part 'expense_state.dart';

class ExpenseCubit extends Cubit<ExpenseState> {
  ExpenseCubit() : super(ExpenseInitial());

  final database = Database();

  Future<void> getExpenses() async {
    try {
      var list = await database.readExpenses();
      emit(ExpenseDataLoaded(expenseList: list));
    } catch (e) {
      emit(ExpenseDataError(message: e.toString()));
    }
  }

  Future<void> addExpense(Expense expense) async {
    try {
      await database.addExpense(expense);
      // var list = await database.readExpenses();
      emit(ExpenseInitial());
    } catch (e) {
      emit(ExpenseDataError(message: e.toString()));
    }
  }

  Future<void> updateExpense(Expense expense) async {
    try {
      await database.updateExpense(expense);
      // var list = await database.readExpenses();
      emit(ExpenseInitial());
    } catch (e) {
      emit(ExpenseDataError(message: e.toString()));
    }
  }

  Future<void> deleteExpense(String id) async {
    try {
      await database.deleteExpense(id);
      // var list = await database.readExpenses();
      emit(ExpenseInitial());
    } catch (e) {
      emit(ExpenseDataError(message: e.toString()));
    }
  }
}
