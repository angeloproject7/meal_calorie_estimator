import 'package:flutter/material.dart';
// Angelo Task 2 - Meal Calorie Estimator
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MealCalorieEstimator(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MealCalorieEstimator extends StatefulWidget {
  const MealCalorieEstimator({super.key});

  @override
  State<MealCalorieEstimator> createState() => _MealCalorieEstimatorState();
}

class _MealCalorieEstimatorState extends State<MealCalorieEstimator> {
  int riceCalories = 200;
  double chickenCalories = 250.5;
  bool addDrink = false;
  String result = "";

  void calculateCalories() {
    double total = riceCalories + chickenCalories;
    if (addDrink) total += 150;

    if (total < 400) {
      result = "Low Calorie Meal: $total kcal";
    } else if (total >= 400 && total <= 600) {
      result = "Balanced Meal: $total kcal";
    } else {
      result = "High Calorie Meal: $total kcal";
    }

    switch (addDrink) {
      case true:
        result += "\nDrink included.";
        break;
      case false:
        result += "\nNo drink included.";
        break;
    }

    for (int i = 1; i <= 1; i++) {
      print("Meal calculated $i time");
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meal Calorie Estimator")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SwitchListTile(
              title: const Text("Add Softdrink (150 kcal)"),
              value: addDrink,
              onChanged: (value) {
                setState(() {
                  addDrink = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateCalories,
              child: const Text("Calculate Calories"),
            ),
            const SizedBox(height: 20),
            Text(result, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
