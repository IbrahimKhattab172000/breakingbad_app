// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:breakingbad_app/constants/my_colors.dart';
import 'package:flutter/material.dart';

import 'package:breakingbad_app/data/models/characters.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        child: Container(
          color: MyColors.myGrey,
          child: Text(character.name),
        ),
      ),
    );
  }
}
