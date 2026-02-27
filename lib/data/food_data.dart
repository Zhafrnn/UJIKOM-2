import 'package:restaurant_mobile_app/models/food_item_model.dart';

final List<FoodItem> allFoods = [
  // ================= BURGER =================
  FoodItem(name: "Beef Burger", price: "\$12", category: "Burger", image: "assets/burger1.jpg"),
  FoodItem(name: "Cheese Burger", price: "\$10", category: "Burger", image: "assets/burger2.jpg"),
  FoodItem(name: "Double Patty", price: "\$15", category: "Burger", image: "assets/burger3.jpg"),
  FoodItem(name: "Chicken Burger", price: "\$11", category: "Burger", image: "assets/burger4.jpg"),

  // ================= PIZZA =================
  FoodItem(name: "Pepperoni Pizza", price: "\$15", category: "Pizza", image: "assets/pizza1.jpg"),
  FoodItem(name: "Cheese Pizza", price: "\$13", category: "Pizza", image: "assets/pizza2.jpg"),
  FoodItem(name: "BBQ Pizza", price: "\$16", category: "Pizza", image: "assets/pizza3.jpg"),

  // ================= DRINKS =================
  FoodItem(name: "Cola", price: "\$3", category: "Drinks", image: "assets/drink1.jpg"),
  FoodItem(name: "Orange Juice", price: "\$4", category: "Drinks", image: "assets/drink2.jpg"),
  FoodItem(name: "Milkshake", price: "\$5", category: "Drinks", image: "assets/drink3.jpg"),

  // ================= DESSERT =================
  FoodItem(name: "Ice Cream", price: "\$6", category: "Dessert", image: "assets/dessert1.jpg"),
  FoodItem(name: "Chocolate Cake", price: "\$7", category: "Dessert", image: "assets/dessert2.jpg"),
  FoodItem(name: "Donut", price: "\$5", category: "Dessert", image: "assets/dessert3.jpg"),

  // ================= CHICKEN =================
  FoodItem(name: "Fried Chicken", price: "\$14", category: "Chicken", image: "assets/chicken1.jpg"),
  FoodItem(name: "Spicy Wings", price: "\$12", category: "Chicken", image: "assets/chicken2.jpg"),

  // ================= COFFEE =================
  FoodItem(name: "Cappuccino", price: "\$5", category: "Coffee", image: "assets/coffee1.jpg"),
  FoodItem(name: "Latte", price: "\$6", category: "Coffee", image: "assets/coffee2.jpg"),
];