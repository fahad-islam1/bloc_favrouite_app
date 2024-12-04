part of 'home_bloc.dart';

enum ListStatus { loading, success, error }

class HomeState extends Equatable {
  final ListStatus status;
  List<FavouriteListModel> favrouiteItemList;
  List<FavouriteListModel> tempfavrouiteItemList;
  HomeState(
      {this.favrouiteItemList = const [],
      this.tempfavrouiteItemList = const [],
      this.status = ListStatus.loading});
  HomeState copyWith(
      {List<FavouriteListModel>? favrouiteItemList,
      List<FavouriteListModel>? tempfavrouiteItemList,
      ListStatus? status}) {
    return HomeState(
      favrouiteItemList: favrouiteItemList ?? this.favrouiteItemList,
      tempfavrouiteItemList:
          tempfavrouiteItemList ?? this.tempfavrouiteItemList,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [favrouiteItemList, status, tempfavrouiteItemList];
}
