import 'package:drawerflutter/blocs/data/information.dart';

abstract class InformationsState {}

class InformationInitial extends InformationsState {}

class InformationSuccess extends InformationsState {
  final List<Information> informations;
  InformationSuccess({required this.informations});
}

class InformationError extends InformationsState {
  final String error;
  InformationError({required this.error});
}
