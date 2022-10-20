// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:breakingbad_app/constants/my_colors.dart';
import 'package:flutter/material.dart';

import 'package:breakingbad_app/data/models/characters.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;
  const CharacterDetailsScreen({
    Key? key,
    required this.character,
  }) : super(key: key);

//*This func has the image and name of the character
  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.nickName,
          style: const TextStyle(color: MyColors.myWhite),
        ),
        background: Hero(
          tag: character.charId,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo({
    required String title,
    required String value,
  }) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: MyColors.myWhite,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider({required double endIndent}) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: MyColors.myYellow,
      thickness: 2,
    );
  }

//*Instead of making 2 if cases for the characterInfo(); & buildDivider();...
//* I concatenated them in one method to make the if check on them both
  Widget betterCallSaulCase() {
    return Column(
      children: [
        characterInfo(
          title: "Better Call Saul Seasons : ",
          value: character.betterCallSaulAppearance.join(' / '),
        ),
        buildDivider(endIndent: 150),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      //*Using CustomScrollView which contains slivers:[] that contains => SliverAppBar & SliverList
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  color: MyColors.myGrey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo(
                        title: "Job : ",
                        value: character.jobs.join(' / '),
                      ),
                      buildDivider(endIndent: 330),
                      characterInfo(
                        title: "Appeared in : ",
                        value: character.catergoryForTwoSeries,
                      ),
                      buildDivider(endIndent: 260),
                      characterInfo(
                        title: "Seasons : ",
                        value: character.appearanceOfSeasons.join(' / '),
                      ),
                      buildDivider(endIndent: 280),
                      characterInfo(
                        title: "Status : ",
                        value: character.statusIfDeadOrAlive,
                      ),
                      buildDivider(endIndent: 300),
                      //*Special case
                      character.betterCallSaulAppearance.isEmpty
                          ? Container()
                          : betterCallSaulCase(),

                      characterInfo(
                        title: "Actor/Actress : ",
                        value: character.actorName,
                      ),
                      buildDivider(endIndent: 235),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
