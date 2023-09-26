

 

import 'package:flutter/material.dart';

class ArchiveScreen extends StatefulWidget {
  const ArchiveScreen({Key? key}) : super(key: key);

  @override
  State<ArchiveScreen> createState() => _ArchiveScreenState();
}

class _ArchiveScreenState extends State<ArchiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Archive Tasks",style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
      ),
      ),
    );
  }
}