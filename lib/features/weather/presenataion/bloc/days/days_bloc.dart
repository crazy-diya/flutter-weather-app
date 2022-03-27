import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'days_event.dart';
part 'days_state.dart';

class DaysBloc extends Bloc<DaysEvent, DaysState> {
  DaysBloc() : super(DaysInitial()) {
    on<DaysEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
