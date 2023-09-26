import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 10,
      ),
      itemCount:2,
      itemBuilder: (BuildContext context, int index) =>ListTile(
        title:Text("T"),
        subtitle: Text("S"),
        trailing: Text("M"),
        leading: Text("X"),
      ),

    );
  }


}