import 'package:bloc_favrouite_app/model/favouriet_item_model.dart';

class FavouritesRepository {
  Future<List<FavouriteListModel>> getFavouriteList() async {
    await Future.delayed(Duration(seconds: 2));
    return _generateList(10);
  }

  List<FavouriteListModel> _generateList(int count) {
    return List.generate(
      count,
          (index) => FavouriteListModel(title: "Task $index", id: index.toString()),
    );
  }
}
