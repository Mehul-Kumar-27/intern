// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'package:intern/models/live_games.dart';

import 'game_widget.dart';
import 'live_stream_widget.dart';
import 'models/game.dart';
import 'models/stream_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;
  List<Game> gameList = [
    Game(
        name: "Call of Duty",
        type: "Survival",
        image: "assets/images/callofduty.jpg"),
    Game(name: "Mario", type: "Adventure", image: "assets/images/mario1.jpg"),
    Game(name: "Pubg", type: "Battel Royal", image: "assets/images/pubg.jpg"),
    Game(
        name: "League of Legends",
        type: "Shooter",
        image: "assets/images/league.jpg")
  ];

  final controller = Get.put(LiveStreamController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_circle_left_rounded,
                          size: 45,
                          color: Colors.red,
                        )),
                    const Material(
                      elevation: 10,
                      shape: CircleBorder(eccentricity: 0.3),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/profile.jpg"),
                      ),
                    ),
                  ],
                ),
              ),
              TextRowWidget(header: "Trending", image: "assets/fire.json"),
              const SizedBox(
                height: 20,
              ),
              CarouselSlider.builder(
                itemCount: gameList.length,
                itemBuilder: (context, index, realIndex) {
                  return GameWidget(game: gameList[index]);
                },
                options: CarouselOptions(
                  autoPlay: false,
                  autoPlayInterval: const Duration(seconds: 3),
                  height: 275,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                ),
              ),
              TextRowWidget(
                header: "Live Now!",
                image: "assets/live.json",
              ),
              SizedBox(
                height: 400,
                child: Obx(
                  () => CarouselSlider.builder(
                    itemCount: controller.liveStreams.length,
                    itemBuilder: (context, index, realIndex) {
                      final liveStream = controller.liveStreams[index];
                      return LiveStreamWidget(liveStream: liveStream);
                    },
                    options: CarouselOptions(
                      autoPlay: false,
                      autoPlayInterval: const Duration(seconds: 3),
                      height: 275,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          activeIndex = index;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextRowWidget extends StatelessWidget {
  String header;
  String image;
  TextRowWidget({
    Key? key,
    required this.header,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            header,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            height: 40,
            width: 40,
            child: Lottie.asset(image),
          )
        ],
      ),
    );
  }
}
