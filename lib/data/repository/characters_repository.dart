import 'package:breakingbad_app/data/models/character.dart';
import 'package:breakingbad_app/data/models/quote.dart';
import 'package:breakingbad_app/data/web_services/characters_web_serivces.dart';

class CharactersRepository {
  final CharactersWebServices charactersWeServices;

  CharactersRepository(this.charactersWeServices);

  Future<List<Character>> getAllCharacters() async {
    final characters = await charactersWeServices.getAllCharacters();
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }

  Future<List<Quote>> getCharacterQuotes({required String charName}) async {
    final quotes =
        await charactersWeServices.getCharacterQuotes(charName: charName);
    return quotes.map((charQuotes) => Quote.fromJson(charQuotes)).toList();
  }
}
