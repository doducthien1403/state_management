import 'package:drawerflutter/blocs/bloc/information_bloc.dart';
import 'package:drawerflutter/blocs/bloc/information_event.dart';
import 'package:drawerflutter/blocs/bloc/information_state.dart';
import 'package:drawerflutter/blocs/data/information.dart';
import 'package:drawerflutter/blocs/listInformation/information_list.dart';
import 'package:drawerflutter/views/cubit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocScreen extends StatelessWidget {
  BlocScreen({Key? key}) : super(key: key);

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InformationBloc>(
      create: (BuildContext context) => InformationBloc(),
      child: Scaffold(
          appBar: AppBar(title: const Text("Information Bloc")), body: _body()),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            textField(
              "Enter name",
              _usernameController,
            ),
            const SizedBox(height: 20),
            textField(
              "Enter phone",
              _phoneController,
            ),
            const SizedBox(height: 20),
            _addBtn(onPress: (context) {
              final username = _usernameController.text;
              final phone = _phoneController.text;
              BlocProvider.of<InformationBloc>(context).add(InformationAdd(
                information: Information(name: username, phone: phone),
              ));
            }),
            BlocBuilder<InformationBloc, InformationState>(
              builder: ((context, state) {
                if (state is InformationStateSuccess) {
                  return InformationList(informations: state.listInformation);
                }
                return const Text("Hello");
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget textField(String hint, TextEditingController controller) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
      ),
      controller: controller,
    );
  }

  Widget _addBtn({required Function(BuildContext context) onPress}) {
    return ButtonAddWidget(onPress: onPress);
  }
}
