import 'package:drawerflutter/blocs/data/information.dart';

abstract class InformationEvent {}

class InformationInsertEvent extends InformationEvent {
  final Information information;
  InformationInsertEvent(this.information);
}

class InformationAdd extends InformationEvent {
  Information information;
  InformationAdd({required this.information});
}
