import 'package:flutter/material.dart';

class DoneScreen extends StatefulWidget {
  const DoneScreen({Key? key}) : super(key: key);

  @override
  State<DoneScreen> createState() => _DoneScreenState();
}

class _DoneScreenState extends State<DoneScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Done Tasks",style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,

      ),
      ),
    );
  }
}