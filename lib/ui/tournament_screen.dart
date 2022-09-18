import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:winner_flutter_app/services/tournament_model.dart';
import 'package:winner_flutter_app/ui/components/tournament_widget.dart';
import 'package:winner_flutter_app/utils/colors.dart';

class TournamentsScreen extends StatelessWidget {
  const TournamentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ChangeNotifierProvider(
        create: (context) => TournamentModel(),
        child: SafeArea(
          child: Builder(
            builder: (context) {
              final model = Provider.of<TournamentModel>(context);
              if (model.homeState == HomeState.Loaded) {
                return TournamentWidget(
                  tournamentGroup: model.tournamentGroupList[0],
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
