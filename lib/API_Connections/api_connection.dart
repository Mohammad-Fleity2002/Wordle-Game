import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:test_flutter_1_1/utils/calculate_stats.dart';

late String chosenWord;
late String chosenDesc;
late Map<String, String> wordDescriptions;
late bool first_Time=true;
String code = '662';


Future<Map<String, String>> fetchWordDescriptions() async {
  const String apiUrl = 'https://192.168.1.9/wordle/API.php';
  // const String apiUrl = 'https://192.168.1.6/wordle/API.php';
  // const String apiUrl = 'https://192.168.34.11/wordle/API.php';
  // const String apiUrl = 'https://192.168.8.181/wordle/API.php';
  // const String code = '23452345'; // Your code here

  // Create an HttpClient instance
  HttpClient httpClient = HttpClient();

  // Bad certificate callback for HttpClient
  httpClient.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);

  // Use the HttpClient to send the request
  final HttpClientRequest request = await httpClient.postUrl(Uri.parse(apiUrl));

  // Add necessary headers and body to the request
  request.headers.set('content-type', 'application/x-www-form-urlencoded');
  request.add(utf8.encode('code=$code'));

  // Send the request and get the response
  final HttpClientResponse response = await request.close();

  // Read response body
  final String responseBody = await response.transform(utf8.decoder).join();

  // Check response status code
  if (response.statusCode == HttpStatus.ok) {
    // Decode JSON response
    final jsonData = json.decode(responseBody);

    // Create a map to store word descriptions
    Map<String, String> wordDescriptions = {};

    // Extract words and their descriptions from JSON data and store in map
    for (int i = 0; i < jsonData['size']; i++) {
      String word = jsonData['words']['word$i'];
      String description = jsonData['word_desc']['desc$i'];
      wordDescriptions[word] = description;
    }

    return wordDescriptions;
  } else {
    // Throw an exception if response status code is not OK
    throw Exception('Failed to load data from API: ${response.statusCode}');
  }
}

void print_data() async {
  try {
    wordDescriptions = await fetchWordDescriptions();
    first_Time=false;
    choose_word();
    print("---------------------------------------///////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\------------------------------------");
    // final r = Random().nextInt(wordDescriptions.length);
    // int i=0;
    // print("r: $r");
    // // Print the map containing word descriptions
    // wordDescriptions.forEach((word, description) {
    //   if(i==r){
    //     // print(word);
    //     // print(wordDescriptions);
    //     chosenWord=word;
    //     chosenDesc=description;
    //   }
    //   i++;
    //   print('$word: $description');
    // });
  } catch (e) {
    print('Error: $e');
  }
}
void choose_word(){
  final r = Random().nextInt(wordDescriptions.length);
  int i=0;
  print("r: $r");
  // Print the map containing word descriptions
  wordDescriptions.forEach((word, description) {
    if(i==r){
      // print(word);
      // print(wordDescriptions);
      chosenWord=word;
      chosenDesc=description;
    }
    i++;
    print('$word: $description');
  });

}