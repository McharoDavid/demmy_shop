import 'package:flutter/material.dart';

class Store{
  String itemName;
  double itemPrice;
  String itemImage;
  double itemRating;

  Store.items({
    this.itemName,
    this.itemPrice,
    this.itemImage,
    this.itemRating
  });
}

List<Store> storeItems = [
  Store.items(
    itemName: "Doritos",
    itemPrice: 3.25,
    itemImage: "https://bit.ly/2JAaBic",
    itemRating: 0.0
  ),
  Store.items(
      itemName: "Fritos",
      itemPrice: 3.35,
      itemImage: "https://bit.ly/2JuTFcW",
      itemRating: 0.0
  ),
  Store.items(
      itemName: "Cheetos",
      itemPrice: 4.00,
      itemImage: "https://bit.ly/3bFE5HJ",
      itemRating: 0.0
  ),
  Store.items(
      itemName: "Lays",
      itemPrice: 3.25,
      itemImage: "https://bit.ly/3dL55Yb",
      itemRating: 0.0
  ),
  Store.items(
      itemName: "Tostitos",
      itemPrice: 2.55,
      itemImage: "https://bit.ly/39zwDfG",
      itemRating: 0.0
  ),
  Store.items(
      itemName: "African Simba Chips",
      itemPrice: 3.25,
      itemImage: "https://bit.ly/2R3pXjL",
      itemRating: 0.0
  ),
  Store.items(
      itemName: "Indian Chips",
      itemPrice: 3.25,
      itemImage: "https://bit.ly/3404RrG",
      itemRating: 0.0
  ),
  Store.items(
      itemName: "UK Crisps",
      itemPrice: 4.35,
      itemImage: "https://bit.ly/2JAbFCI",
      itemRating: 0.0
  ),
  Store.items(
      itemName: "Asian Honey Twist",
      itemPrice: 1.35,
      itemImage: "https://bit.ly/2UBwfJe",
      itemRating: 0.0
  ),
];