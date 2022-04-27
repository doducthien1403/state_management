import 'package:drawerflutter/blocs/cubit/information_cubit.dart';
import 'package:drawerflutter/blocs/cubit/information_state.dart';
import 'package:drawerflutter/blocs/data/information.dart';
import 'package:drawerflutter/blocs/listInformation/information_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitScreen extends StatelessWidget {
  CubitScreen({Key? key}) : super(key: key);
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InformationsCubit>(
      create: (BuildContext context) => InformationsCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Information Cubit")),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                textField(
                  "Enter username",
                  _usernameController,
                ),
                const SizedBox(height: 20),
                textField(
                  "Enter phone",
                  _phoneController,
                ),
                const SizedBox(height: 20),
                _addBtn(
                  context,
                  onPressed: ((context) {
                    final txtName = _usernameController.text;
                    final txtPhone = _phoneController.text;
                    context
                        .read<InformationsCubit>()
                        .addInformation(txtName, txtPhone);
                  }),
                ),
                const SizedBox(height: 20),
                BlocBuilder<InformationsCubit, InformationsState>(
                  builder: (context, state) {
                    if (state is InformationSuccess) {
                      return InformationList(informations: state.informations);
                    }
                    if (state is InformationError) {
                      return const Text("Error");
                    }
                    return const Text("Truong hop khac");
                  },
                ),
              ],
            ),
          ),
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

  Widget _addBtn(context, {required Function(BuildContext context) onPressed}) {
    return ButtonAddWidget(
      onPress: onPressed,
    );
  }
}

class ButtonAddWidget extends StatelessWidget {
  final Function(BuildContext context)? onPress;
  const ButtonAddWidget({Key? key, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPress?.call(context),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Center(
          child: Text("Add"),
        ),
      ),
    );
  }
}
