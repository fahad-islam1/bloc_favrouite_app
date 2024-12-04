part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {

  const HomeEvent();
  @override
  List<Object> get props=> [];

}
class FetchFavouriteList extends HomeEvent{
  
}
class FavouriteList extends HomeEvent{
FavouriteListModel item;
FavouriteList({required this .item});
}
class SelectItem extends HomeEvent{
FavouriteListModel item;
SelectItem({required this .item});
}class UnSelectItem extends HomeEvent{
FavouriteListModel item;
UnSelectItem({required this .item});
}

class DeleteItem extends HomeEvent{

}
