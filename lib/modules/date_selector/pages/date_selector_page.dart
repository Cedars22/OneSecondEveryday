import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:one_second_everyday/modules/date_selector/provider/scroll_controller_provider.dart';
import 'package:one_second_everyday/modules/date_selector/date_selector_router.dart';

class DateSelectorPage extends ConsumerWidget {
  const DateSelectorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();
    final tomorrow = now.add(const Duration(days: 1));
    final initialDate = DateTime(1900);
    bool hasMedia = false;
    final scrollController = ref.watch(scrollControllerProviderProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(scrollControllerProviderProvider)
          .jumpTo(scrollController.position.maxScrollExtent);
    });

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Video Selector Page',
        ),
      ),
      // body: GridView(gridDelegate: gridDelegate),
      body: GridView.builder(
        controller: scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 4.0,
        ),
        itemCount: initialDate.difference(tomorrow).inDays.abs(),
        itemBuilder: (context, index) {
          final date = initialDate.add(Duration(days: index));

          return InkWell(
            // splashColor: Colors.grey,
            onTap: () {
              context.push(
                DateSelectorRouter.videoAddMediaPage,
                extra: date,
              );
            },
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(width: 8),
                    Text(
                      getDayOfWeek(date),
                      // now.weekday.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(width: 8),
                    Text(
                      DateFormat('d').format(date),
                      // now.day.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
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
                Container(
                  color: Colors.white,
                  height: 2,
                ),
              ],
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
  return DateFormat('EE').format(date); // Usa intl para el formato
}
