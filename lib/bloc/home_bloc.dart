import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_favrouite_app/model/favouriet_item_model.dart';
import 'package:bloc_favrouite_app/repository/favourite_repo.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<FavouriteListModel> favouriteItemList = [];
  List<FavouriteListModel> tempfavrouiteItemList = [];
  FavouritesRepository favouritesRepository;
  HomeBloc(this.favouritesRepository) : super(HomeState()) {
    on<FetchFavouriteList>(fetchfavouriteList);
    on<FavouriteList>(addfavrtlist);
    on<SelectItem>(selectItem);
    on<UnSelectItem>(unselectItem);
    on<DeleteItem>(removeItem);
  }
  Future<void> fetchfavouriteList(
      FetchFavouriteList event, Emitter<HomeState> emit) async {
    favouriteItemList = await favouritesRepository.getFavouriteList();
    emit(state.copyWith(
        favrouiteItemList: List.from(favouriteItemList),
        status: ListStatus.success));
  }

  void addfavrtlist(FavouriteList event, Emitter<HomeState> emit) async {
    final index =
        favouriteItemList.indexWhere((element) => element.id == event.item.id);
    favouriteItemList[index] = event.item;
    emit(state.copyWith(
        favrouiteItemList: List.from(favouriteItemList),
        status: ListStatus.success));
  }

  void removeItem(DeleteItem event, Emitter<HomeState> emit) {
for(int i =0; i<tempfavrouiteItemList.length;i++){
  favouriteItemList.remove(tempfavrouiteItemList[i]);

}
tempfavrouiteItemList.clear();
    emit(state.copyWith(
      favrouiteItemList: List.from(favouriteItemList),
      tempfavrouiteItemList: List.from(tempfavrouiteItemList),
      status: ListStatus.success,
    ));
  }

  FutureOr<void> selectItem(SelectItem event, Emitter<HomeState> emit) {
    if (!tempfavrouiteItemList.contains(event.item)) {
      tempfavrouiteItemList.add(event.item);
    }
    emit(state.copyWith(
      tempfavrouiteItemList: List.from(tempfavrouiteItemList),
      status: ListStatus.success,
    ));
  }

  FutureOr<void> unselectItem(UnSelectItem event, Emitter<HomeState> emit) {
    tempfavrouiteItemList.remove(event.item);
    emit(state.copyWith(
      tempfavrouiteItemList: List.from(tempfavrouiteItemList),
      status: ListStatus.success,
    ));
  }
}
