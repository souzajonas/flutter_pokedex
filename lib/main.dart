import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/common/repositories/pokemon_repository.dart';
import 'package:flutter_pokedex/features/home/container/home_container.dart';
import 'package:flutter_pokedex/features/home/pages/home_error.dart';
import 'package:flutter_pokedex/features/home/pages/home_loading.dart';
import 'package:flutter_pokedex/features/home/pages/home_page.dart';
import 'package:flutter_pokedex/features/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pokedex Jonas',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: PokedexRoute(
          repository: PokemonRepository(
            dio: Dio(),
          ),
        ));
  }
}
