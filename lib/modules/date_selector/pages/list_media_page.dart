import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class ListMediaPage extends StatefulWidget {
  final DateTime date;
  const ListMediaPage({
    super.key,
    required this.date,
  });

  @override
  State<ListMediaPage> createState() => _ListMediaPageState();
}

class _ListMediaPageState extends State<ListMediaPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
