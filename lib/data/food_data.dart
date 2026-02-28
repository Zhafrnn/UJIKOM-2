import 'package:restaurant_mobile_app/models/food_item_model.dart';

final List<FoodItem> allFoods = [
  // ================= BURGER =================
  FoodItem(name: "Beef Burger", price: "\$12", category: "Burger", image: "assets/Beef_Burger.jpg"),
  FoodItem(name: "Cheese Burger", price: "\$10", category: "Burger", image: "assets/Cheese_Burger.jpg"),
  FoodItem(name: "Double Patty", price: "\$15", category: "Burger", image: "assets/Double_Patty.jpg"),
  FoodItem(name: "Chicken Burger", price: "\$11", category: "Burger", image: "assets/Chicken_Burger.jpg"),

  // ================= PIZZA =================
  FoodItem(name: "Pepperoni Pizza", price: "\$15", category: "Pizza", image: "assets/Pepperoni_Pizza.jpg"),
  FoodItem(name: "Cheese Pizza", price: "\$13", category: "Pizza", image: "assets/Cheese_Pizza.jpg"),
  FoodItem(name: "BBQ Pizza", price: "\$16", category: "Pizza", image: "assets/Barbeque_Pizza.jpg"),

  // ================= DRINKS =================
  FoodItem(name: "Cola", price: "\$3", category: "Drinks", image: "assets/Cola.jpg"),
  FoodItem(name: "Orange Juice", price: "\$4", category: "Drinks", image: "assets/Orange_Juice.jpg"),
  FoodItem(name: "Chocolate Milkshake", price: "\$5", category: "Drinks", image: "assets/Chocolate_Milkshake.jpg"),

  // ================= DESSERT =================
  FoodItem(name: "Ice Cream", price: "\$6", category: "Dessert", image: "assets/Ice_Cream.jpg"),
  FoodItem(name: "Chocolate Cake", price: "\$7", category: "Dessert", image: "assets/Chocolate_Cake.jpg"),
  FoodItem(name: "Donut", price: "\$5", category: "Dessert", image: "assets/Donut.jpg"),

  // ================= CHICKEN =================
  FoodItem(name: "Fried Chicken", price: "\$14", category: "Chicken", image: "assets/Fried_Chicken.jpg"),
  FoodItem(name: "Spicy Wings", price: "\$12", category: "Chicken", image: "assets/Spicy_Wings.jpg"),

  // ================= COFFEE =================
  FoodItem(name: "Cappuccino", price: "\$5", category: "Coffee", image: "assets/Cappucino.jpg"),
  FoodItem(name: "Latte", price: "\$6", category: "Coffee", image: "assets/Latte.jpg"),
];