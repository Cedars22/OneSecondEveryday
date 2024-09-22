import 'package:flutter/material.dart';

class SelectMediaPage extends StatelessWidget {
  final DateTime date;
  const SelectMediaPage({
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
                    onTap: () {
                      // context.push()
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
