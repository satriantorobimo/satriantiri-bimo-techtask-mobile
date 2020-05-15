import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class RecipiesEvent extends Equatable {
  RecipiesEvent([List props = const []]) : super(props);
}

class GetRecipes extends RecipiesEvent {
  final List<String> data;
  GetRecipes({@required this.data}) : assert(data != null);
}
