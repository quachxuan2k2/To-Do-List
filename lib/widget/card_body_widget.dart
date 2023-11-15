import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  CardBody(
      {Key? key,
      required this.item,
      required this.handleDelete,
      required this.handleEdit,
      required this.index})
      : super(key: key);
  var item;
  var index;
  final Function handleDelete;
  final Function handleEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 70,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          gradient: (index % 2 == 0)
              ? LinearGradient(colors: [Colors.purpleAccent, Colors.pinkAccent])
              : LinearGradient(colors: [Colors.blue, Colors.cyanAccent]),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                child: Column(
                  children: [
                    Text(
                      item.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("\n" + item.date,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(onPressed: (){
                    handleEdit(index, item.name);
                  }, icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 30,
                  )),
                  InkWell(
                    onTap: () async {
                      if (await confirm(context)) {
                        handleDelete(item.id);
                      }
                      return print("PressedCancel");
                    },
                    child: Icon(
                      Icons.delete_outline,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

