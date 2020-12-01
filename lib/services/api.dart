import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:youtube_favourites_video_bloc/models/video.dart';

const API_KEY = "AIzaSyCEZ3yJXOuazQXQRmP7rduJpihWBSUD8Hs";

class ServicesApi {
  String _search;
  String _nextToken;

  Future<List<Video>> search(String search) async {
    _search = search;
    String url =
        "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$_search&type=video&key=$API_KEY&maxResults=10";

    http.Response response = await http.get(url);

    return decode(response);
  }

  Future<List<Video>> nextPage() async {
    String url =
        "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_KEY&maxResults=10*maxResults=100*pageToken$_nextToken";

    http.Response response = await http.get(url);

    return decode(response);
  }

  Future<List<Video>> decode(http.Response response) async {
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);
      _nextToken = decoded["nextPageToken"];

      List<Video> videos = decoded["items"].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();

      print(videos);
    } else {
      throw Exception("Failed to load videos");
    }
  }
}
