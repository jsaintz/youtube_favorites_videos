import 'package:flutter/material.dart';
import 'package:youtube_favourites_video_bloc/screens/home.dart';
import 'package:youtube_favourites_video_bloc/services/api.dart';

void main() {
  ServicesApi api = ServicesApi();
  api.search("eletro");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youtube Favourites',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

// Here we take the value from the MyHomePage object that was created by
// the App.build method, and use it to set our appbar title.
