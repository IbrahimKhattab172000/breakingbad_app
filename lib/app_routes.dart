// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors
import 'package:breakingbad_app/data/models/character.dart';
import 'package:breakingbad_app/data/web_services/characters_web_serivces.dart';
import 'package:flutter/material.dart';

import 'package:breakingbad_app/business_logic/cubit/characters_cubit.dart';
import 'package:breakingbad_app/constants/strings.dart';
import 'package:breakingbad_app/data/repository/characters_repository.dart';
import 'package:breakingbad_app/presentation/screens/character_details_screen.dart';
import 'package:breakingbad_app/presentation/screens/characters_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;
  AppRouter() {
    charactersRepository =
        CharactersRepository(charactersWeServices: CharactersWebServices());
    charactersCubit =
        CharactersCubit(charactersRepository: charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: CharactersScreen(),
          ),
        );
      case characterDetailsScreen:
        //Todo:.. //!I don't fully understand this |final character = settings.arguments as Character;|
        final character = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            //Todo: //! this point is important, why don't we use |charactersCubit| and we created new one

            create: (BuildContext context) =>
                CharactersCubit(charactersRepository: charactersRepository),
            child: CharacterDetailsScreen(
              character: character,
            ),
          ),
        );
    }
  }
}
