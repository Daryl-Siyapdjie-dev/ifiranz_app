import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ifiranz_client/src/features/client/delivery/infrastructure/remote_service/search_location_service.dart';

import '../../../../core/infrastructure/utils/common_import.dart';
import '../../domain/search_location_models.dart';

part 'search_place_notifier.freezed.dart';

@freezed
class SearchPlaceState with _$SearchPlaceState {
  const SearchPlaceState._();
  const factory SearchPlaceState.initial() = _Initial;
  const factory SearchPlaceState.loading() = _Loading;
  const factory SearchPlaceState.success({required List<PlaceSearch> data}) =
      _Success;
  const factory SearchPlaceState.error() = _Error;
}

final searchCubitProvider =
    StateNotifierProvider<SearchCubit, SearchPlaceState>(
  (ref) => SearchCubit(ref.watch(placesServiceProvider)),
);

class SearchCubit extends StateNotifier<SearchPlaceState> {
  final PlacesService _placeApi;

  SearchCubit(this._placeApi) : super(const SearchPlaceState.initial());

  Future<void> searchPlace(String placeName) async {
    try {
      final res = await _placeApi.getAutocomplete(placeName);
      state = SearchPlaceState.success(data: res);
    } catch (_) {
      state = const SearchPlaceState.error();
    }
  }

  void clearSearch() {
    state = const SearchPlaceState.initial();
  }
}
