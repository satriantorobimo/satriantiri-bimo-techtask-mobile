import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tech_task/model/ingredients/ingredients.dart';

@immutable
abstract class IngredientsState extends Equatable {
  IngredientsState([List props = const []]) : super(props);
}

class InitialIngredientsState extends IngredientsState {}

class IngredientsLoading extends IngredientsState {}

class IngredientsSuccess extends IngredientsState {
  final List<IngredientsObject> ingredientsList;

  IngredientsSuccess({@required this.ingredientsList})
      : assert(ingredientsList != null),
        super([ingredientsList]);
}

class IngredientsException extends IngredientsState {
  final Exception exception;

  IngredientsException({@required this.exception})
      : assert(exception != null),
        super([exception]);
}
