import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final int pageGo1;
  final Function callbackFunction;
  const MyButtons(
      {Key? key, required this.pageGo1, required this.callbackFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callbackFunction(pageGo1);
      },
      child: Container(
        width: double.maxFinite,
        height: 70,
        margin: const EdgeInsets.only(top: 20, left: 40, right: 40, bottom: 20),
        decoration: BoxDecoration(
            color: Colors.lightBlue, borderRadius: BorderRadius.circular(20)),
        child: const Center(
          child: Text(
            'Atualizar',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
