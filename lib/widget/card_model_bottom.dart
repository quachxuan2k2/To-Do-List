import 'package:flutter/material.dart';

class ModalBottom extends StatelessWidget {
  ModalBottom({Key? key, required this.addTask}) : super(key: key);

  final Function addTask;
  TextEditingController controller = TextEditingController();

  void _handleOnclick(BuildContext context) {
    final name = controller.text;
    if (name.isEmpty) {
      return;
    }
    addTask(name);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Your task",
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () => _handleOnclick(context),
                    child: Text("Add task")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
