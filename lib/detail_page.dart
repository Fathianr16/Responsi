import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:responsi_124210026/detail_model.dart';

class DetailMeal extends StatelessWidget {
  final Meals meal;

  const DetailMeal({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meal Detail',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              meal.strMealThumb ?? '',
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 22),
            Text(
              'Categori: ${meal.strCategory}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Area: ${meal.strArea}',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Ingredients',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              meal.strIngredient1 ?? '',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Instructions',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              meal.strInstructions ?? '',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _launchURL(meal.strYoutube ?? '');
        },
        icon: Icon(Icons.video_collection),
        label: Text("Watch Tutorial"),
      ),
    );
  }
}

Future<void> _launchURL(String url) async {
  final Uri _url = Uri.parse(url);
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
