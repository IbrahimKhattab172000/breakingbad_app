import 'package:breakingbad_app/data/models/characters.dart';
import 'package:breakingbad_app/data/web_services/characters_web_serivces.dart';

class CharactersRepository {
  final CharactersWebServices charactersWeServices;

  CharactersRepository(this.charactersWeServices);

  Future<List<dynamic>> getAllCharacters() async {
    final characters = await charactersWeServices.getAllCharacters();
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}
