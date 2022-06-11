import 'package:flutter/material.dart';

class ShopApiDataResponse {
  late bool status;
  late String message;
  late List<Banner> banners;
  late List<Product> products;
  ShopApiDataResponse.FromJson(Map<String, dynamic> json) {
    this.status = json['status'];
    this.message = json['message'];
    this.banners = json['banners'].map((e) => Banner.FromJson(e)).toList();
    this.products = json['products'].map((e) => Product.FromJson(e)).toList();
  }
}

class Banner {
  late int id;
  late ImageProvider image;
  late dynamic category;
  late dynamic product;

  Banner.FromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.image = json['image'];
    this.category = json['category'];
    this.product = json['product'];
  }
}

class Product {
  late bool in_favorites, in_cart;
  late int id;
  late double price;
  late double old_price;
  late int discount;
  late String name, description;
  late List<String> images;
  late ImageProvider image;

  Product.FromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.image = json['image'];
    this.description = json['description'];
    this.discount = json['discount'];
    this.images = json['images'];
    this.in_cart = json['in_cart'];
    this.in_favorites = json['in_favorites'];
    this.name = json['name'];
    this.price = json['price'];
    this.old_price = json['old_price'];
  }
}
