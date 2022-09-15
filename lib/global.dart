import 'dart:io';

class Detail {
  final File? image;
  final dynamic? first_name;
  final dynamic? last_name;
  final dynamic? phone_number;
  final dynamic? email;
  final dynamic? address;

  Detail({
    required this.image,
    required this.first_name,
    required this.last_name,
    required this.phone_number,
    required this.email,
    required this.address,
  });
}

class Globel {
  static List<Detail> alldetail = [];

  static File? image;
  static String? first_name;
  static String? last_name;
  static dynamic? phone_number;
  static dynamic? email;
  static dynamic? address;
}

class Global {
  static List<Map<String, dynamic>> food = [
    {
      'no': 'images/veg.png',
      'name': "Burger",
      'images': 'assets/images/burger.png',
      'image': 'assets/images/burger2.jpg',
      'price': 50.00,
      'scale': 9.0,
      'quantity': 0,
      'totalPrice': 0,
    },
    {
      'no': 'images/veg.png',
      'name': "Pizza",
      'images': 'assets/images/pizza.png',
      'image': 'assets/images/pizza2.jpg',
      'price': 170.00,
      'scale': 21.0,
      'quantity': 0,
      'totalPrice': 0,
    },
    {
      'no': 'images/veg.png',
      'name': "Pasta",
      'images': 'assets/images/pasta3.jpg',
      'image': 'assets/images/pasta2.jpg',
      'price': 80.00,
      'scale': 5.0,
      'quantity': 0,
      'totalPrice': 0,
    },
    {
      'no': 'images/veg.png',
      'name': "Manchurian",
      'images': 'assets/images/manchurian1.jpg',
      'image': 'assets/images/manchurian2.jpg',
      'price': 90.00,
      'scale': 4.0,
      'quantity': 0,
      'totalPrice': 0,
    },
    {
      'no': 'images/veg.png',
      'name': "Dhosa",
      'images': 'assets/images/dhosa1.jpg',
      'image': 'assets/images/dhosa2.jpg',
      'price': 200.00,
      'scale': 5.0,
      'quantity': 0,
      'totalPrice': 0,
    },
    {
      'no': 'images/veg.png',
      'name': "Vadapav",
      'images': 'assets/images/vadapav1.jpg',
      'image': 'assets/images/vadapav2.jpg',
      'price': 30.00,
      'scale': 5.0,
      'quantity': 0,
      'totalPrice': 0,
    },
    {
      'no': 'images/veg.png',
      'name': "Dabeli",
      'images': 'assets/images/dabeli.jpg',
      'image': 'assets/images/dabeli2.jpg',
      'price': 35.00,
      'scale': 4.0,
      'quantity': 0,
      'totalPrice': 0,
    }
  ];
}
