import 'package:flutter/material.dart';
import 'package:meals_app_flutter/models/meal.dart';

class MealsScreen extends StatefulWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  Map<int, int> mealCounts = {};

  void _incrementCount(int index) {
    setState(() {
      mealCounts[index] = (mealCounts[index] ?? 0) + 1;
    });
  }

  void _decrementCount(int index) {
    setState(() {
      if (mealCounts[index] != null && mealCounts[index]! > 0) {
        mealCounts[index] = mealCounts[index]! - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: widget.meals.isNotEmpty
          ? ListView.builder(
              itemCount: widget.meals.length,
              itemBuilder: (ctx, index) {
                final meal = widget.meals[index];
                final count = mealCounts[index] ?? 0; // Get count for this meal
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        meal.title,
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () => _decrementCount(index),
                          ),
                          Text('$count'), // Display the current count
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () => _incrementCount(index),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            )
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("No meals found"),
                  const SizedBox(height: 16),
                  Text(
                    'Try selecting a different meal',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ],
              ),
            ),
    );
  }
}
