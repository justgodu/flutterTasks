
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task6/data/models/people.dart';
import 'package:task6/data/repositories/people_repository.dart';

part 'people_data_state.dart';

class PeopleDataCubit extends Cubit<PeopleDataState> {
  PeopleDataCubit() : super(PeopleDataInitial());

  final peopleRepo = PeopleRepository();

  Future<void> getPeopleData() async {
    try {
      var list = await peopleRepo.fetchPeople();
      emit(PeopleDataLoaded(peopleList: list));
    } catch (e) {
      emit(PeopleDataError(message: e.toString()));
    }
  }
}
