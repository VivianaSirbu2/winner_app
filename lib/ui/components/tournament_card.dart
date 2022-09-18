import 'package:flutter/material.dart';
import 'package:winner_flutter_app/model/models.dart';
import 'package:winner_flutter_app/ui/components/game_card.dart';
import 'package:winner_flutter_app/utils/colors.dart';
import 'package:winner_flutter_app/utils/strings.dart';

class TournamentCard extends StatelessWidget {
  const TournamentCard({
    Key? key,
    required this.tournamentGroup,
  }) : super(key: key);

  final TournamentGroup tournamentGroup;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 8.0,
      ),
      decoration: BoxDecoration(
        color: kTournamentCardBackground,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            10.0,
          ),
        ),
        border: Border.all(
          color: kBorderColor,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(
                12.0,
              ),
            ),
            child: Image.network(
              "https://h6v9r7t5.stackpathcdn.com/public/bonus/1050x585%20%20123.jpg",
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GameCard(
                tournament: tournamentGroup.tournaments[index],
              ),
              itemCount: tournamentGroup.tournaments.length,
            ),
          ),
          const Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                kDetails,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
