import 'package:breakingbad_app/constants/strings.dart';
import 'package:breakingbad_app/data/models/characters.dart';
import 'package:dio/dio.dart';

class CharactersWeServices {
  late Dio dio;
  CharactersWeServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, //*20 sec
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }

  Future<List<Character>> getAllCharacters() async {
    try {
      Response response = await dio.get("characters");
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
    }
    return [];
  }
}
