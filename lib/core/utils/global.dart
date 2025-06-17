import 'package:flutter/material.dart';

const List<String> filterList=['House','Villa','Land','Shop'];

int currentFilterIndex = 0;
final List<Widget> imageSliders = propertyList[currentFilterIndex]['imageList'].map((item) => Container(
  margin: EdgeInsets.all(5.0),
  child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      child: Stack(
        children: <Widget>[
          Image.asset(item, fit: BoxFit.cover, width: 1000.0),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(
                  vertical: 10.0, horizontal: 20.0),
              child: Text(
                'No. ${propertyList[currentFilterIndex]['imageList'].indexOf(item)} image',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      )),
))
    .toList();

const List<Map<String,dynamic>> propertyList=[
  {
    "image": "assets/png/house.png",
    "building_name": "Green Valley",
    "price": 8500000,
    'imageList': [
      "assets/jpg/buiding.jpg",
      "assets/jpg/building1.jpg",
      "assets/jpg/buiding2.jpg",
      "assets/jpg/buiding3.jpg",
      "assets/jpg/buiding4.jpg"
    ],
    "address": "45 Elm Street,",
    "rating": 4.5,
    "discount": "10%",
    "plots": 2,
    "description": "A beautiful 3BHK apartment ",
    "types_of_house": "Apartment",
    "bedroom": 3,
    "hall": 1,
    "kitchen": 1,
    "washroom": 2
  },
  {
    "image": "assets/jpg/buiding.jpg",
    "building_name": "Sunshine Villas",
    "price": 14500000,
    "address": "Sunrise Road, Whitefield,",
    "rating": 4.8,
    'imageList': [
      "assets/jpg/buiding.jpg",
      "assets/jpg/building1.jpg",
      "assets/jpg/buiding2.jpg",
      "assets/jpg/buiding3.jpg",
      "assets/jpg/buiding4.jpg"
    ],
    "discount": "5%",
    "plots": 4,
    "description": "Luxurious 4BHK villa with private garden, pool, and spacious interiors.",
    "types_of_house": "Villa",
    "bedroom": 4,
    "hall": 2,
    "kitchen": 1,
    "washroom": 3
  },
  {
    "image": "assets/jpg/building1.jpg",
    "building_name": "Hilltop Row Houses",
    "price": 6700000,
    "address": "32 Harmony Lane, ",
    "rating": 4.2,
    "discount": "8%",
    'imageList': [
      "assets/jpg/buiding.jpg",
      "assets/jpg/building1.jpg",
      "assets/jpg/buiding2.jpg",
      "assets/jpg/buiding3.jpg",
      "assets/jpg/buiding4.jpg"
    ],
    "plots": 1,
    "description": "Affordable row house with scenic mountain views and modern living space.",
    "types_of_house": "Row House",
    "bedroom": 2,
    "hall": 1,
    "kitchen": 1,
    "washroom": 1
  },
  {
    "image": "assets/jpg/buiding2.jpg",
    "building_name": "Skyline Towers",
    "price": 9300000,
    "address": "Sector 62, Noida,",
    "rating": 4.4,
    "discount": "12%",
    'imageList': [
      "assets/jpg/buiding.jpg",
      "assets/jpg/building1.jpg",
      "assets/jpg/buiding2.jpg",
      "assets/jpg/buiding3.jpg",
      "assets/jpg/buiding4.jpg"
    ],
    "plots": 3,
    "description": "Premium 3BHK high-rise apartment with a city view and smart home features.",
    "types_of_house": "Apartment",
    "bedroom": 3,
    "hall": 1,
    "kitchen": 1,
    "washroom": 2
  },
  {
    "image": "assets/jpg/buiding3.jpg",
    "building_name": "Royal Duplex Homes",
    "price": 10500000,
    "address": "MG Road, Indore,",
    "rating": 4.6,
    "discount": "7%",
    "plots": 2,
    'imageList': [
      "assets/jpg/buiding.jpg",
      "assets/jpg/building1.jpg",
      "assets/jpg/buiding2.jpg",
      "assets/jpg/buiding3.jpg",
      "assets/jpg/buiding4.jpg"
    ],
    "description": "Spacious 3BHK duplex ideal for families with ample parking and garden.",
    "types_of_house": "Duplex",
    "bedroom": 3,
    "hall": 2,
    "kitchen": 1,
    "washroom": 3
  },
  {
    "image": "assets/jpg/buiding4.jpg",
    "building_name": "Orchid Heights",
    "price": 7200000,
    'imageList': [
      "assets/jpg/buiding.jpg",
      "assets/jpg/building1.jpg",
      "assets/jpg/buiding2.jpg",
      "assets/jpg/buiding3.jpg",
      "assets/jpg/buiding4.jpg"
    ],
    "address": "Salt Lake City, ",
    "rating": 4.3,
    "discount": "6%",
    "plots": 2,
    "description": "Modern flat with all amenities near IT hub and shopping centers.",
    "types_of_house": "Flat",
    "bedroom": 2,
    "hall": 1,
    "kitchen": 1,
    "washroom": 2
  },
  {
    "image": "assets/jpg/buiding.jpg",
    "building_name": "Palm Grove Estate",
    "price": 16000000,
    "address": "ECR Road, Chennai",
    "rating": 4.9,
    "discount": "4%",
    'imageList': [
      "assets/jpg/buiding.jpg",
      "assets/jpg/building1.jpg",
      "assets/jpg/buiding2.jpg",
      "assets/jpg/buiding3.jpg",
      "assets/jpg/buiding4.jpg"
    ],
    "plots": 5,
    "description": "Exclusive 5BHK villa with pool, home theater, and sea view.",
    "types_of_house": "Villa",
    "bedroom": 5,
    "hall": 2,
    "kitchen": 2,
    "washroom": 4
  },
  {
    "image": "assets/jpg/building1.jpg",
    "building_name": "Maple Greens",
    "price": 8100000,
    "address": "Civil Lines, Jaipur,",
    "rating": 4.1,
    "discount": "9%",
    'imageList': [
      "assets/jpg/buiding.jpg",
      "assets/jpg/building1.jpg",
      "assets/jpg/buiding2.jpg",
      "assets/jpg/buiding3.jpg",
      "assets/jpg/buiding4.jpg"
    ],
    "plots": 2,
    "description": "Comfortable 3BHK house in a peaceful locality with good schools nearby.",
    "types_of_house": "Independent House",
    "bedroom": 3,
    "hall": 1,
    "kitchen": 1,
    "washroom": 2
  },
  {
    "image": "assets/jpg/buiding2.jpg",
    "building_name": "Elite Penthouse Suites",
    "price": 22000000,
    "address": "Bandra West, Mumbai",
    "rating": 5.0,
    'imageList': [
      "assets/jpg/buiding.jpg",
      "assets/jpg/building1.jpg",
      "assets/jpg/buiding2.jpg",
      "assets/jpg/buiding3.jpg",
      "assets/jpg/buiding4.jpg"
    ],
    "discount": "3%",
    "plots": 1,
    "description": "Premium 4BHK penthouse with terrace garden and panoramic city view.",
    "types_of_house": "Penthouse",
    "bedroom": 4,
    "hall": 2,
    "kitchen": 1,
    "washroom": 4
  },
  {
    "image": "assets/jpg/buiding2.jpg",
    "building_name": "Countryside Farm Villas",
    "price": 12000000,
    "address": "Near Lavasa, Pune,",
    "rating": 4.7,
    "discount": "15%",
    'imageList': [
      "assets/jpg/buiding.jpg",
      "assets/jpg/building1.jpg",
      "assets/jpg/buiding2.jpg",
      "assets/jpg/buiding3.jpg",
      "assets/jpg/buiding4.jpg"
    ],
    "plots": 6,
    "description": "Eco-friendly 3BHK farmhouse with organic garden and mountain views.",
    "types_of_house": "Farmhouse",
    "bedroom": 3,
    "hall": 1,
    "kitchen": 1,
    "washroom": 2
  }
];
