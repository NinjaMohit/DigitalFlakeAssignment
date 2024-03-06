import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Fetching extends StatefulWidget {
  @override
  State<Fetching> createState() => _FetchingState();
}

class _FetchingState extends State<Fetching> {
  late Future<Map<String, dynamic>> jsonData;

  @override
  void initState() {
    super.initState();
    jsonData = fetchData();
  }

  Future<Map<String, dynamic>> fetchData() async {
    final response = await http.get(Uri.parse('sample.json'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load JSON');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON Fetcher'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: jsonData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Access your JSON data here using snapshot.data
            Map<String, dynamic> jsonData = snapshot.data!;

            // Extracting the 'item' list from the JSON data
            List<dynamic> itemList = jsonData['item'];

            return ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                // Access each item in the list
                Map<String, dynamic> item = itemList[index];

                // Display the 'name' of each item in the list
                return ListTile(
                  title: Text(item['name'] ?? 'Unknown'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
