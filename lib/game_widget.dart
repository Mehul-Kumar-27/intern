import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/game.dart';

class GameWidget extends StatelessWidget {
  final Game game;
  const GameWidget({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color c = Colors.red;
    if (game.type == "Adventure") {
      c = Colors.redAccent;
    } else if (game.type == "Survival") {
      c = Colors.green;
    } else if (game.type == "Shooter") {
      c = Colors.orange;
    } else {
      c = Colors.blueAccent;
    }
    return Material(
        borderRadius: BorderRadius.circular(40),
        color: Colors.grey[200],
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              SizedBox(
                // height: 250,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.asset(
                    game.image,
                    fit: BoxFit.fill,
                    height: 170,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      color: c.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      game.type,
                      style: GoogleFonts.poppins(
                          fontSize: 15, color: c, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Text(
                game.name,
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.bold),
              )
            ])));
  }
}

