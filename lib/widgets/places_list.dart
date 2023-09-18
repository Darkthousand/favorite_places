import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/providers/user_places.dart';
import 'package:favorite_places/screens/place_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesList extends ConsumerWidget {
  const PlacesList({required this.places, super.key});
  final List<Place> places;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          "No places added yet",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      );
    }

    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) {
            ref
                .read(userPlacesNotifier.notifier)
                .removePlace(places[index].title);
          },
          child: ListTile(
            leading: CircleAvatar(
              radius: 26,
              backgroundImage: FileImage(places[index].image),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) {
                    return PlaceDetailScreen(
                      place: places[index],
                    );
                  },
                ),
              );
            },
            title: Text(
              places[index].title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        );
      },
    );
  }
}
