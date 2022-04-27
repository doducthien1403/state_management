import 'package:drawerflutter/blocs/cubit/information_state.dart';
import 'package:drawerflutter/blocs/data/information.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InformationsCubit extends Cubit<InformationsState> {
  InformationsCubit() : super(InformationInitial());

  final List<Information> informations = [];

  void addInformation(String name, String phone) {
    if (name.isEmpty || phone.isEmpty) {
      emit(InformationError(error: "Information is empty"));
      return;
    }
    Information information = Information(name: name, phone: phone);
    informations.add(information);
    emit(InformationSuccess(informations: informations));
  }
}
