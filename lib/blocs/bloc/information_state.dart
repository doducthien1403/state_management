import 'package:drawerflutter/blocs/data/information.dart';

abstract class InformationState {}

class InformationStateInitial extends InformationState {}

class InformationStateError extends InformationState {
  final error;
  InformationStateError({this.error});
}

class InformationStateSuccess extends InformationState {
  final List<Information> listInformation;
  InformationStateSuccess({required this.listInformation});
}
