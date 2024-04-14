import 'dart:math';

import 'package:test_flutter_1_1/API_Connections/api_connection.dart';

const List<String> words= [
  "PIZZA"
];
// class Words {
//   late final Map<String, String> wordDescriptions;
//   late final List<String> words;
//   late String word;
//
//   Future<String> getWords() async {
//     try {
//       // Fetch word descriptions from the API and store them in a map
//       final Map<String, String> wordDescriptions = await fetchWordDescriptions();
//
//       // Get the list of words from the map keys
//       final List<String> words = wordDescriptions.keys.toList();
//
//       // Choose a random index within the range of the words list
//       final r = Random().nextInt(words.length);
//
//       // Assign the randomly chosen word to the 'word' property
//       word = words[r];
//
//       // Print a random word along with its description
//       print('${words[r]}: ${wordDescriptions[words[r]]}');
//
//       // Return the randomly chosen word
//       return word;
//     } catch (e) {
//       print('Error: $e');
//       // Return an empty string or handle the error as needed
//       return '';
//     }
//   }
// }
// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
//
// Future<Map<String, dynamic>> fetchWordAndDescription() async {
//   const String apiUrl = 'https://192.168.1.9/wordle/word_api.php';
//   const String code = '23452345'; // Your code here
//
//   HttpClient httpClient = HttpClient();
//   httpClient.badCertificateCallback =
//   ((X509Certificate cert, String host, int port) => true);
//
//   final HttpClientRequest request = await httpClient.postUrl(Uri.parse(apiUrl));
//   request.headers.set('content-type', 'application/x-www-form-urlencoded');
//   request.add(utf8.encode('code=$code'));
//
//   final HttpClientResponse response = await request.close();
//
//   final String responseBody = await response.transform(utf8.decoder).join();
//
//   if (response.statusCode == HttpStatus.ok) {
//     final jsonData = json.decode(responseBody);
//
//     // Extract word and description from the JSON data
//     final word = jsonData['word'] as String;
//     final description = jsonData['description'] as String;
//
//     return {'word': word, 'description': description};
//   } else {
//     throw Exception('Failed to load data from API: ${response.statusCode}');
//   }
// }
