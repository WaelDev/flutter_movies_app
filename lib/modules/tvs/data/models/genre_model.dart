import '../../domain/entities/genre.dart';

class GenreModel extends Genre {
  const GenreModel({required String name, required int id})
      : super(name: name, id: id);

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(name: json['name'], id: json['id']);
  }
}
