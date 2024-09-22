import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:one_second_everyday/core/extensions/app_loc_extension.dart';
import 'package:one_second_everyday/modules/date_selector/date_selector_router.dart';

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
        child: Column(
          children: [
            Text('Home Page'),
            ElevatedButton(
              onPressed: () {
                context.push(DateSelectorRouter.videoSelectorPage);
              },
              child: Text(context.loc.example_text),
            ),
          ],
        ),
      ),
    );
  }
}
