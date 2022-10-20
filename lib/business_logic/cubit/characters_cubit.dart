// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:breakingbad_app/data/models/quote.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:breakingbad_app/data/models/character.dart';
import 'package:breakingbad_app/data/repository/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Character> characters = [];
  CharactersCubit({required this.charactersRepository})
      : super(CharactersInitial());

//*I tried to make this method without any return and it worked,just like the one for the getQuotes down there
  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters: characters));
      this.characters = characters;
    });
    return characters;
  }

  getQuotes({required String charName}) {
    charactersRepository.getCharacterQuotes(charName: charName).then((quotes) {
      emit(QuotesLoaded(quotes: quotes));
    });
  }
}
