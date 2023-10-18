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
          color: (index % 2 == 0)
              ? const Color.fromARGB(255, 78, 234, 211)
              : const Color.fromARGB(255, 241, 141, 233),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.name,
                style: TextStyle(
                    color: Color(0xff4B4B4B),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () async {
                      if (await confirm(context)) {
                        handleEdit(item.id);
                      }
                      return print("PressedCancel");
                    },
                    child: Icon(
                      Icons.edit_outlined,
                      color: Color(0xff4B4B4B),
                      size: 30,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      if (await confirm(context)) {
                        handleDelete(item.id);
                      }
                      return print("PressedCancel");
                    },
                    child: Icon(
                      Icons.delete_outline,
                      color: Color(0xff4B4B4B),
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
