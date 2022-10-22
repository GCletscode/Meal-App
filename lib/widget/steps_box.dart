import 'package:flutter/material.dart';

class StepBox extends StatelessWidget {
  final String step;
  final int num;

  const StepBox(this.step, this.num);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Card(
        elevation: 6,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            child: Text(
              '$num.',
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
          ),
          title: Text(step),
        ),
      ),
    );
  }
}
