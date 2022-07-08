// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:shopping_list/models/item.dart';

class AddItem extends StatelessWidget {
  final itemC = TextEditingController();
  AddItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Adicionar Item'),
      content: TextField(
        autofocus: true,
        controller: itemC,
      ),
      actions: [
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancelar')),
        FlatButton(
            onPressed: () {
              final item = Item(title: itemC.value.text);
              itemC.clear();
              Navigator.of(context).pop(item);
            },
            child: const Text('Adicionar'))
      ],
    );
  }
}
