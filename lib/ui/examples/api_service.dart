import 'dart:convert'; // jsonDecode()

import 'package:http/http.dart' as http;
import 'package:ms_tromm/ui/examples/album.dart';

// testing network calls
Future<Album> fetchAlbum() async {
  // Future is a core dart class for working with async operations.
  String url = 'https://jsonplaceholder.typicode.com/albums/1';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
 }