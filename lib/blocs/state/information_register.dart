import 'package:drawerflutter/blocs/data/information.dart';
import 'package:drawerflutter/blocs/listInformation/information_list.dart';
import 'package:flutter/material.dart';

class InformationRegister extends StatefulWidget {
  const InformationRegister({Key? key}) : super(key: key);

  @override
  State<InformationRegister> createState() => InformationRegisterScreenState();
}

class InformationRegisterScreenState extends State<InformationRegister> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  Information? information;
  @override
  void initState() {
    super.initState();
    information = Information(name: '', phone: '');
  }

  final List<Information> informations = [];

  void _insertUser() {
    if (information!.name.isEmpty || information!.phone.isEmpty) {
      return;
    }
    informations.add(information!);
    information = Information(name: '', phone: '');
    _nameController.text = '';
    _phoneController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("User"),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          textField(
                            "name",
                            "Enter name",
                            controller: _nameController,
                            onChanged: (text) {
                              setState(() {
                                information!.name = text;
                              });
                            },
                          ),
                          const SizedBox(height: 10),
                          textField(
                            "phone",
                            "Enter phone",
                            controller: _phoneController,
                            onChanged: (text) {
                              setState(() {
                                information!.phone = text;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _insertUser();
                        setState(() {});
                      },
                      child: const Text("Add"),
                      style: raisedButtonStyle,
                    ),
                  ],
                ),
                InformationList(informations: informations),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextField textField(String label, String hint,
      {required TextEditingController controller,
      required Function(String) onChanged}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
    );
  }

  ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Colors.blue[300],
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  );
}
