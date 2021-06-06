part of 'people_data_cubit.dart';


abstract class PeopleDataState extends Equatable {
  const PeopleDataState();
}

class PeopleDataInitial extends PeopleDataState {
  @override
  List<Object> get props => [];
}

class PeopleDataLoaded extends PeopleDataState {
  final List<People> peopleList;

  PeopleDataLoaded({this.peopleList});

  @override
  List<Object> get props => [peopleList];
}

class PeopleDataError extends PeopleDataState {
  final String message;

  PeopleDataError({this.message});

  @override
  List<Object> get props => [message];
}
