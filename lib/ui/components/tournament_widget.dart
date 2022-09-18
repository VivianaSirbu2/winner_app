import 'package:flutter/material.dart';
import 'package:winner_flutter_app/model/models.dart';
import 'package:winner_flutter_app/ui/components/tournament_card.dart';
import 'package:winner_flutter_app/utils/colors.dart';


class TournamentWidget extends StatelessWidget {
  const TournamentWidget({
    Key? key,
    required this.tournamentGroup,
  }) : super(key: key);

  final TournamentGroup tournamentGroup;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tournamentGroup.name,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: TournamentCard(
              tournamentGroup: tournamentGroup,
            ),
          ),
        ],
      ),
    );
  }
}
