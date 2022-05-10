import 'package:flutter/material.dart';
import 'package:flutter_pokedex/common/widgets/po_error.dart';
import 'package:flutter_pokedex/common/widgets/po_loading.dart';

import '../../../common/error/falilure.dart';
import '../../../common/models/pokemon.dart';
import '../../../common/repositories/pokemon_repository.dart';
import '../pages/detail_page.dart';

class DetailArguments {
  DetailArguments({this.index = 0, required this.pokemon});

  final Pokemon pokemon;
  final int index;
}

class DetailsContainer extends StatefulWidget {
  const DetailsContainer(
      {Key? key,
      required this.repository,
      required this.arguments,
      required this.onBack})
      : super(key: key);
  final IPokemonRepository repository;
  final DetailArguments arguments;
  final VoidCallback onBack;

  @override
  State<DetailsContainer> createState() => _DetailsContainerState();
}

class _DetailsContainerState extends State<DetailsContainer> {
  late PageController controller;
  @override
  void initState() {
    controller = PageController(
      viewportFraction: 0.5,
      initialPage: widget.arguments.index,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: widget.repository.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const PoLoading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return DetailPage(
            pokemon: widget.arguments.pokemon,
            list: snapshot.data!,
            onBack: widget.onBack,
            controller: controller,
          );
        }

        if (snapshot.hasError) {
          return PoError(
            error: (snapshot.error as Failure).message!,
          );
        }

        return Container();
      },
    );
  }
}
