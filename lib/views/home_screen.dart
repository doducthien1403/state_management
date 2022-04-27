import 'package:drawerflutter/blocs/state/information_register.dart';
import 'package:drawerflutter/views/bloc_screen.dart';
import 'package:drawerflutter/views/cubit_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  String txtTitle = "Drawer";
  String titleOnTap = "";

  ListTile _buildListTitle(Title title, {required Function() onTap}) {
    return ListTile(
      title: title,
      onTap: onTap,
    );
  }

  Drawer _buildDrawer(context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: Center(
              child: Text("Menu"),
            ),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            title: const Text("State"),
            onTap: () {
              setState(() {
                titleOnTap = "This is State Page";
              });
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InformationRegister()));
            },
          ),
          ListTile(
            title: const Text("BloC"),
            onTap: () {
              setState(() {
                titleOnTap = "This is BloC Page";
              });
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => BlocScreen())));
            },
          ),
          ListTile(
            title: const Text("Cubit"),
            onTap: () {
              setState(() {
                titleOnTap = "This is Cubit Page";
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CubitScreen(),
                ),
              );
            },
          ),
          const Divider(
            color: Colors.black45,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(txtTitle)),
      body: Center(
        child: Text(titleOnTap),
      ),
      drawer: _buildDrawer(context),
    );
  }
}
