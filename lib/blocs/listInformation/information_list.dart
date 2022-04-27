import 'package:drawerflutter/blocs/data/information.dart';
import 'package:flutter/material.dart';

class InformationList extends StatelessWidget {
  const InformationList({Key? key, required this.informations})
      : super(key: key);

  final List<Information> informations;

  Widget buildListView() {
    return ListView.builder(
      itemCount: informations.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(
              informations[index].name,
              style: const TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              informations[index].phone,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: buildListView(),
    );
  }
}
