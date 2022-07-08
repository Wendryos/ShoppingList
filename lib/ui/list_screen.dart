import 'package:flutter/material.dart';
import 'package:shopping_list/models/item.dart';
import 'package:shopping_list/ui/add_item.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Item> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Lista de Compras'),
          centerTitle: true,
          backgroundColor: Colors.black),
      body: ListView.separated(
        itemBuilder: (BuildContext context, index) {
          final item = items[index];

          return ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.black,
              child: IconTheme(
                data: IconThemeData(color: Colors.white),
                child: Icon(Icons.done),
              ),
            ),
            title:
                Text(item.title, style: const TextStyle(color: Colors.black)),
          );
        },
        separatorBuilder: (BuildContext context, index) =>
            const Divider(color: Colors.black),
        itemCount: items.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addItem() async {
    final item = await showDialog<Item>(
        context: (context),
        builder: (BuildContext context) {
          return AddItem();
        });

    setState(() {
      items.add(item!);
    });
  }
}
