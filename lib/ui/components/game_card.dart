import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:winner_flutter_app/model/models.dart';
import 'package:winner_flutter_app/utils/colors.dart';
import 'package:winner_flutter_app/utils/strings.dart';

class GameCard extends StatelessWidget {
  const GameCard({
    Key? key,
    required this.tournament,
  }) : super(key: key);

  final Tournament tournament;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 3.0,
                ),
                decoration: const BoxDecoration(
                  color: kYellow,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      5.0,
                    ),
                  ),
                ),
                child: const Text(
                  kActive,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              Text(
                '${DateFormat("d MMM").format(
                  DateTime.fromMillisecondsSinceEpoch(
                    tournament.startDate,
                  ),
                )} - ${DateFormat("d MMM").format(
                  DateTime.fromMillisecondsSinceEpoch(
                    tournament.endDate,
                  ),
                )}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 10.0,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  kGameCard1Background,
                  kGameCard3Background,
                  kGameCard2Background,
                ],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  8.0,
                ),
              ),
            ),
            // Top icon with prize
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      tournament.meta.ui.cornerImage.url,
                      width: 60,
                      height: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            tournament.meta.ui.prize1.text.ro,
                            style: const TextStyle(
                              color: kPriceColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            tournament.meta.ui.prize2.text.ro,
                            style: const TextStyle(
                              color: kPriceColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  '${DateTime.fromMillisecondsSinceEpoch(tournament.startDate).day.toString()} - '
                  '${DateTime.fromMillisecondsSinceEpoch(tournament.endDate).day.toString()} '
                  '${DateFormat("MMMM").format(DateTime.fromMillisecondsSinceEpoch(tournament.endDate))}',
                  style: const TextStyle(
                    color:Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Image.network(
                            tournament.meta.ui.gamesImage.url,
                            width: 60,
                            height: 60,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Text(
                            '+${tournament.meta.games.length} jocuri',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 8.0,
                            ),
                          ),
                        )
                      ],
                    ),
                    Image.network(
                      tournament.meta.ui.topImage.url,
                      width: 60,
                      height: 60,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                tournament.enrolled == false
                    ? Column(
                        children: [
                          //Button
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 18,
                                  child: Container(
                                    color: Colors.pink,
                                    child: const Center(
                                      child:  Text(
                                        kEnrolled,
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 30,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          kButton1Background,
                                          kGameCard3Background,
                                          kButton2Background,
                                        ],
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          5.0,
                                        ),
                                      ),
                                    ),
                                    child:const Center(
                                      child:  Text(
                                        kIsIn,
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
