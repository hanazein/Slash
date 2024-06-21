import 'package:flutter/material.dart';

import '../../data/model/itemModel.dart';




@immutable

abstract class HomeState {}
class HomeInitial extends HomeState{}


class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final DataModel data;

  HomeLoaded(this.data);
}
class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}