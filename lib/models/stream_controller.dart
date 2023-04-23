import 'dart:convert';

import 'package:get/get.dart';

import 'package:intern/models/live_games.dart';

class LiveStreamController extends GetxController {
  final liveStreams = <LiveStream>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadLiveStreams();
  }

  void loadLiveStreams() async {
    // Manually equate the data to the `livestream.json` file
    const data = '''
      [
        {
          "name": "Call of Duty",
          "type": "Survival",
          "image": "assets/images/callofduty.jpg",
          "viewers": 1000
        },
        {
          "name": "Mario",
          "type": "Adventure",
          "image": "assets/images/mario1.jpg",
          "viewers": 1000
        },
        {
          "name": "Pubg",
          "type": "Battel Royal",
          "image": "assets/images/pubg.jpg",
          "viewers": 1000
        },
        {
          "name": "League of Legends",
          "type": "Shooter",
          "image": "assets/images/league.jpg",
          "viewers": 1000
        }
      ]
    ''';
    final jsonList = json.decode(data) as List<dynamic>;
    final liveStreamList = jsonList.map((json) => LiveStream.fromJson(json)).toList();
    liveStreams.assignAll(liveStreamList);
  }
}

// home_screen.dart



