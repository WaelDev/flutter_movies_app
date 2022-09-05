import 'package:equatable/equatable.dart';

abstract class TvsEvent extends Equatable {
  const TvsEvent();

  @override
  List<Object?> get props => [];
}

class GetOnTheAirTvsEvent extends TvsEvent {}

class GetPopularTvsEvent extends TvsEvent {}

class GetTopRatedTvsEvent extends TvsEvent {}
