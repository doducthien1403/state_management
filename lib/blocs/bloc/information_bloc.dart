import 'package:drawerflutter/blocs/bloc/information_event.dart';
import 'package:drawerflutter/blocs/bloc/information_state.dart';
import 'package:drawerflutter/blocs/data/information.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InformationBloc extends Bloc<InformationEvent, InformationState> {
  InformationBloc() : super(InformationStateInitial()) {
    List<Information> informations = [];
    on<InformationAdd>((event, emit) {
      // informations.add(event.information);
      emit(InformationStateSuccess(listInformation: [event.information]));
    });
  }
}
