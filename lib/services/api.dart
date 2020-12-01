import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:youtube_favourites_video_bloc/models/video.dart';

const API_KEY = "AIzaSyCEZ3yJXOuazQXQRmP7rduJpihWBSUD8Hs";

class ServicesApi {
  search(String search) async {
    String url =
        "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_KEY&maxResults=10";

    http.Response response = await http.get(url);

    decode(response);
  }

  Future<List<Video>> decode(http.Response response) async {
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);

      List<Video> videos = decoded["items"].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();

      print(videos);
    } else {
      throw Exception("Failed to load videos");
    }
  }
}
