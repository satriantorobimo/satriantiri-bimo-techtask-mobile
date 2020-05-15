import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class IngredientsEvent extends Equatable {
  IngredientsEvent([List props = const []]) : super(props);
}

class GetIngredients extends IngredientsEvent {
  GetIngredients();
}
