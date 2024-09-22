import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:one_second_everyday/modules/date_selector/date_selector_router.dart';
import 'package:file_picker/file_picker.dart';

class AddMedia extends StatelessWidget {
  final DateTime date;

  const AddMedia({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(
          children: [
            Text(
              'Day ${date.toString().split(' ')[0]}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
            Card(
              color: Colors.grey[800],
              child: Column(
                children: [
                  InkWell(
                    onTap: () async {
                      // context.push(
                      //   DateSelectorRouter.selectMediaPage,
                      //   extra: date,
                      // );
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles();

                      if (result != null) {
                        File file = File(result.files.single.path!);
                        print(file);
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('File Selected'),
                                content: Text(file.path),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            });
                      } else {
                        // User canceled the picker
                      }
                    },
                    child: const Card(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Icon(
                            Icons.add,
                            size: 100,
                          ),
                          Text('Add Media'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
