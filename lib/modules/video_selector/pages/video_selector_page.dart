import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VideoSelectorPage extends StatelessWidget {
  const VideoSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final initialDate = DateTime(1900);
    final hasMedia = false;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Video Selector Page',
        ),
      ),
      // body: GridView(gridDelegate: gridDelegate),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: 100,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              color: Colors.black,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 8),
                      Text(
                        now.day.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 8),
                      Text(
                        getDayOfWeek(now),
                        // now.weekday.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      hasMedia
                          ? const Icon(
                              Icons.movie_rounded,
                              color: Colors.white,
                            )
                          : Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                      const SizedBox(width: 2),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/');
            },
            child: const Text('Mash'),
          ),
        ],
      ),
    );
  }
}

String getDayOfWeek(DateTime date) {
  return DateFormat('EEEE').format(date); // Usa intl para el formato
}
