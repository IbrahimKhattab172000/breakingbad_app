// ignore_for_file: prefer_const_constructors

import 'package:breakingbad_app/business_logic/cubit/characters_cubit.dart';
import 'package:breakingbad_app/constants/my_colors.dart';
import 'package:breakingbad_app/data/models/characters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late Future<List<Character>> allCharacters;

  @override
  void initState() {
    super.initState();

    allCharacters =
        BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: Text(
          "Characters",
          style: TextStyle(
            color: MyColors.myGrey,
          ),
        ),
      ),
      body: Text("test"),
    );
  }
}
