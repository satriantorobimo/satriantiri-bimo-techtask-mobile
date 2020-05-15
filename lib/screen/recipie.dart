import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_task/bloc/recipies/recipies_bloc.dart';
import 'package:tech_task/bloc/recipies/recipies_event.dart';
import 'package:tech_task/bloc/recipies/recipies_state.dart';
import 'package:tech_task/model/recipe/recipe.dart';
import 'package:tech_task/repo/recipes_repo.dart';

class RecipieScreen extends StatefulWidget {
  final List<String> chooseIngredients;

  const RecipieScreen({Key key, this.chooseIngredients}) : super(key: key);

  @override
  _RecipieScreenState createState() => _RecipieScreenState();
}

class _RecipieScreenState extends State<RecipieScreen> {
  RecipiesBloc recipeBloc =
      RecipiesBloc(recipesRepository: RecipesRepository());

  @override
  void initState() {
    recipeBloc.dispatch(GetRecipes(data: widget.chooseIngredients));
    super.initState();
  }

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Recipies'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: <Widget>[
            Container(
                child: const Text('List of Recipes',
                    style: TextStyle(fontWeight: FontWeight.bold))),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: BlocBuilder(
                  bloc: recipeBloc,
                  builder: (_, RecipiesState state) {
                    if (state is InitialRecipiesState) {
                      return const Center(child: Text('Masih kosong'));
                    } else if (state is RecipiesLoading) {
                      return const Center(child: Text('Loading'));
                    } else if (state is RecipiesSuccess) {
                      final List<RecepieObject> recipesList = state.recipesList;
                      return showRecipes(recipesList);
                    } else if (state is RecipiesException) {
                      return const Center(child: Text('Error'));
                    }
                    return Container();
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget showRecipes(List<RecepieObject> recipesList) {
    return ListView.builder(
      itemCount: recipesList.length,
      itemBuilder: (BuildContext context, int index) {
        return ExpansionTile(
          title: Text(recipesList[index].title),
          children: <Widget>[
            Text(recipesList[index].ingredients.toString()),
            const SizedBox(
              height: 16,
            )
          ],
        );
      },
    );
  }
}
