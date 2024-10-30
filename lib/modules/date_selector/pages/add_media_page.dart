import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:one_second_everyday/modules/date_selector/date_selector_router.dart';
import 'package:file_picker/file_picker.dart';

class AddMedia extends ConsumerStatefulWidget {
  final DateTime date;

  const AddMedia({
    super.key,
    required this.date,
  });

  @override
  ConsumerState<AddMedia> createState() => _AddMediaState();
}

class _AddMediaState extends ConsumerState<AddMedia> {
  bool selected = false;

  @override
  void initState() {
    super.initState();
    selected = false;
  }

  @override
  Widget build(BuildContext context) {
    FilePickerResult? result;
    File? file;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(
          children: [
            Text(
              'Day ${widget.date.toString().split(' ')[0]}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
            if (selected)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: file != null ? Image.file(file!) : Container(),
              ),
            Card(
              color: Colors.grey[800],
              child: Column(
                children: [
                  if (selected)
                    Container(
                      height: 200,
                      // color: Colors.deepPurple,
                      // child: AssetImage(file!.path),
                    ),
                  InkWell(
                    onTap: () async {
                      // context.push(
                      //   DateSelectorRouter.selectMediaPage,
                      //   extra: date,
                      // );
                      result = await FilePicker.platform.pickFiles(
                        type: FileType.media,
                        // allowedExtensions: ['mp4', 'jpg'],
                      );
                      if (result != null) {
                        file = File(result!.files.single.path!);
                        AssetImage(file!.path);
                        setState(() {
                          selected = true;
                        });
                        // selected = true;
                        // showDialog(
                        //     context: context,
                        //     builder: (context) {
                        //       return AlertDialog(
                        //         title: Text('File Selected'),
                        //         content: Text(file.path),
                        //         actions: [
                        //           TextButton(
                        //             onPressed: () {
                        //               Navigator.pop(context);
                        //             },
                        //             child: const Text('OK'),
                        //           ),
                        //         ],
                        //       );
                        //     });
                      } else {
                        selected = false;
                        // User canceled the picker
                      }
                    },
                    child: Card(
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
            // selected
            // ? const Text('No file selected')
            // : Text(result!.files.single.path!),
            // Image.asset(file.path),

            // if (selected){
            //     AssetImage(file.path),
            //   }
          ],
        ),
      ),
    );
  }
}
