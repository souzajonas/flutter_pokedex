import 'package:flutter/material.dart';
import 'package:flutter_pokedex/common/models/pokemon.dart';
import 'package:flutter_pokedex/features/details/pages/widgets/detail_app_bar_widget.dart';
import 'package:flutter_pokedex/features/details/pages/widgets/detail_list_widget.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.pokemon,
    required this.list,
    required this.onBack,
    required this.controller,
  }) : super(key: key);

  final Pokemon pokemon;
  final List<Pokemon> list;
  final VoidCallback onBack;
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DetailAppBarrWidget(
            pokemon: pokemon,
            onBack: onBack,
          ),
          DetailListWidget(
            pokemon: pokemon,
            list: list,
            controller: controller,
          )
        ],
      ),
    );
  }
}
