part of 'expense_cubit.dart';

abstract class ExpenseState extends Equatable {
  const ExpenseState();
}

class ExpenseInitial extends ExpenseState {
  @override
  List<Object> get props => [];
}

class ExpenseDataLoaded extends ExpenseState{
  final List<Expense> expenseList;

  ExpenseDataLoaded({this.expenseList});

  @override
  List<Object> get props => [expenseList];
}

class ExpenseDataError extends ExpenseState{
  final String message;

  ExpenseDataError({this.message});

  @override
  List<Object> get props => [message];
}