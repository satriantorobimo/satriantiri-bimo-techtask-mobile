import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tech_task/bloc/ingredients/bloc.dart';
import 'package:tech_task/model/ingredients/ingredients.dart';
import 'package:tech_task/repo/ingredients_repo.dart';
import 'package:tech_task/util/value_string.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime datetime;
  final IngredientsBloc ingredientsBloc =
      IngredientsBloc(ingredientsRepository: IngredientsRepository());
  List<String> chooseIngredients = [];

  @override
  void initState() {
    _checkDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Lunch Recipie'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          icon: Icon(Icons.fastfood),
          label: const Text('Show Recipie')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(datetime == null
                    ? 'Choos the date'
                    : DateFormat.yMMMd().format(datetime).toString()),
                GestureDetector(
                    child: Icon(Icons.calendar_today),
                    onTap: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2021))
                          .then((DateTime date) => {
                                setState(() {
                                  datetime = date;
                                })
                              });
                    })
              ],
            ),
            Container(
                margin: const EdgeInsets.only(top: 50),
                child: const Text('List of Ingredients',
                    style: TextStyle(fontWeight: FontWeight.bold))),
            Container(
              margin: const EdgeInsets.only(top: 70),
              child: BlocBuilder(
                  bloc: ingredientsBloc,
                  builder: (_, IngredientsState state) {
                    if (state is InitialIngredientsState) {
                      return const Center(child: Text('Masih kosong'));
                    } else if (state is IngredientsLoading) {
                      return const Center(child: Text('Loading'));
                    } else if (state is IngredientsSuccess) {
                      final List<IngredientsObject> faqList =
                          state.ingredientsList;
                      return showIngredients(faqList);
                    } else if (state is IngredientsException) {
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

  Widget showIngredients(List<IngredientsObject> ingredientsList) {
    return ListView.builder(
      itemCount: ingredientsList.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(ingredientsList[index].title),
          subtitle: Text(ingredientsList[index].useBy),
          leading: GestureDetector(
            child: Icon(
                !chooseIngredients.contains(ingredientsList[index].title)
                    ? Icons.add
                    : Icons.remove,
                color: Colors.green),
            onTap: () {
              setState(() {
                DateTime dateTimes =
                    DateTime.parse(ingredientsList[index].useBy);

                if (datetime.isAfter(dateTimes)) {
                  _showToast(context);
                } else {
                  if (!chooseIngredients.contains(ingredientsList[index].title))
                    chooseIngredients.add(ingredientsList[index].title);
                  else {
                    chooseIngredients.remove(ingredientsList[index].title);
                  }
                }
              });
            },
          ),
        );
      },
    );
  }

  void _checkDate() {
    if (datetime == null) {
      Timer.run(() => _showDialog());
    }
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(ValueString.titleGetDate),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(datetime == null
                  ? 'Choos the date'
                  : DateFormat.yMMMd().format(datetime).toString()),
              GestureDetector(
                  child: Icon(Icons.calendar_today),
                  onTap: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2021))
                        .then((DateTime date) => {
                              Navigator.of(context).pop(),
                              setState(() {
                                datetime = date;
                              }),
                              Timer.run(() => _showDialog())
                            });
                  })
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text('Ok'),
              onPressed: () {
                ingredientsBloc.dispatch(GetIngredients());
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showToast(BuildContext context) {
    final ScaffoldState scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      const SnackBar(content: Text('Tidak bisa karena sudah basi')),
    );
  }
}
