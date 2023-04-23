// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intern/models/live_games.dart';

class LiveStreamWidget extends StatelessWidget {
  final LiveStream liveStream;
  const LiveStreamWidget({
    Key? key,
    required this.liveStream,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color c = Colors.red;
    if (liveStream.type == "Adventure") {
      c = Colors.redAccent;
    } else if (liveStream.type == "Survival") {
      c = Colors.green;
    } else if (liveStream.type == "Shooter") {
      c = Colors.orange;
    } else {
      c = Colors.blueAccent;
    }
    return Material(
      borderRadius: BorderRadius.circular(40),
      elevation: 20,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(40),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          liveStream.image,
                          fit: BoxFit.fill,
                          height: 170,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      Positioned(
                        top: 4,
                        left: 20,
                        right: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                height: 24,
                                width: MediaQuery.of(context).size.width * 0.3,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text("2.5k Playing",
                                      style: GoogleFonts.lato(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                )),
                            Container(
                                height: 24,
                                width: MediaQuery.of(context).size.width * 0.2,
                                decoration: BoxDecoration(
                                    color: Colors.yellow[800],
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text("Live",
                                      style: GoogleFonts.lato(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("assets/profile.jpg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              liveStream.name,
                              style: GoogleFonts.lato(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: 24,
                            decoration: BoxDecoration(
                                color: c.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                liveStream.type,
                                style: GoogleFonts.lato(
                                    fontSize: 15,
                                    color: c,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.play_circle_fill_rounded,
                          color: Colors.red,
                          size: 50,
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
