import 'package:flutter/material.dart';
import 'package:one_second_everyday/core/extensions/app_loc_extension.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          context.loc.example_text,
        ),
      ),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
