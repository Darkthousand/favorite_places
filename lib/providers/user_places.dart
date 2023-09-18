import 'dart:io';

import 'package:favorite_places/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super([]);

  void addPlace(String title, File image) {
    for (final item in state) {
      if (item.title == title) {
        return;
      }
    }
    state = [...state, Place(title: title, image: image)];
    print(state);
  }

  void removePlace(String title) {
    state = state.where((p) => p.title != title).toList();
    print(state);
  }
}

final userPlacesNotifier =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>(
  (ref) {
    return UserPlacesNotifier();
  },
);
