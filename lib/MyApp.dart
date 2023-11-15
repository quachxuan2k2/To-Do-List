import 'package:flutter/material.dart';
import 'package:test_1/modal/items.dart';
import 'widget/card_body_widget.dart';
import 'widget/card_model_bottom.dart';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<DataItems> items = [];

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  void _handleAddTask(String name) {
    final now = DateTime.now();
    final newItem = DataItems(
        id: DateTime.now().toString(),
        date: DateFormat('yyyy-MM-dd HH:mm').format(now).toString(),
        name: name);
    setState(() {
      items.add(newItem);
    });
    saveItems();
  }

  Future<String> localFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/todo_list.json';
  }

  Future<void> saveItems() async {
    final file = File(await localFilePath());
    await file.writeAsString(jsonEncode(items.map((e) => e.toJson()).toList()));
  }

  //Encode() để chuyển đổi đối tượng Dart thành chuỗi JSON
  //Decode() để chuyển đổi chuỗi JSON thành đối tượng Dart

  Future<void> loadItems() async {
    try {
      final file = File(await localFilePath());
      final data = await file.readAsString();
      final jsonList = jsonDecode(data) as List;
      items = jsonList.map((json) => DataItems.fromJson(json)).toList();
      setState(() {});
    } catch (e) {
      items = [];
    }
  }

  void _handleDeleteTask(String id) {
    setState(() {
      items.removeWhere((item) => item.id == id);
    });
    saveItems();
  }

  void _handleEdit(int index, String name) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          String editname = name;
          return AlertDialog(
            title: const Text('Edit Task'),
            content: TextField(
              controller: TextEditingController(text: name),
              onChanged: (value) {
                editname = value;
              },
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    _handSaveEditTask(index, editname);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Save')),
            ],
          );
        });
  }

  void _handSaveEditTask(int index, String name) {
    setState(() {
      items[index].name = name;
    });
    saveItems();
  }

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "To Do List",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.blue),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image:  AssetImage("images/magnolia-flower.jpg"),
            fit:  BoxFit.cover),
          ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: items
                .map((item) => CardBody(
                      index: items.indexOf(item),
                      item: item,
                      handleDelete: _handleDeleteTask,
                      handleEdit: _handleEdit,
                    ))
                .toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return ModalBottom(addTask: _handleAddTask);
              });
        },
        child: Icon(Icons.add, size: 40),
      ),
    );
  }
}
