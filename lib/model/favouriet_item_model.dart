import 'package:equatable/equatable.dart';

class FavouriteListModel extends Equatable {
  final String title;
  final String id;
  final bool isDeleting;
  final bool isFavourite;

  FavouriteListModel(
      {required this.title,
      required this.id,
      this.isDeleting = false,
      this.isFavourite = false});
  FavouriteListModel copyWith(
      String? title, String? id, bool? isDeleting, bool? isFavourite) {
    return FavouriteListModel(
        title: title ?? this.title,
        id: id ?? this.id,
        isDeleting: isDeleting ?? this.isDeleting,
        isFavourite: isFavourite ?? this.isFavourite);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [title, id, isDeleting, isFavourite];
}
