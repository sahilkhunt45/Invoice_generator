import 'package:flutter/material.dart';

import 'global.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

List<Map> foods = [
  {
    'images': 'assets/images/burger2.jpg',
    'type': "Veg-Burger",
    'logo': 'assets/images/veg.png',
    'price': 50,
  },
  {
    'images': 'assets/images/pizza2.jpg',
    'type': "Pizza",
    'logo': 'assets/images/veg.png',
    'price': 170
  },
  {
    'images': 'assets/images/pasta2.jpg',
    'type': "Pasta",
    'logo': 'assets/images/veg.png',
    'price': 80
  },
  {
    'images': 'assets/images/manchurian2.jpg',
    'type': "Manchurian",
    'logo': 'assets/images/veg.png',
    'price': 90
  },
  {
    'images': 'assets/images/dhosa2.jpg',
    'type': "Idli-Dhosa",
    'logo': 'assets/images/veg.png',
    'price': 200
  },
  {
    'images': 'assets/images/dabeli2.jpg',
    'type': "Dabeli",
    'logo': 'assets/images/veg.png',
    'price': 30
  },
  {
    'images': 'assets/images/vadapav2.jpg',
    'type': "Vadapav",
    'logo': 'assets/images/veg.png',
    'price': 35
  },
];

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('editpage');
              setState(() {
                FileImage(Globel.image!);
              });
            },
            child: CircleAvatar(
              backgroundImage: FileImage(Globel.image!),
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.amber,
        elevation: 20,
        title: const Text(
          "Food Menu",
          style: TextStyle(
            fontSize: 50,
            fontFamily: "Menu",
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(),
            const Text(
              "SK Restaurant",
              style: TextStyle(
                fontFamily: "SK",
                fontWeight: FontWeight.bold,
                fontSize: 60,
                color: Colors.yellow,
              ),
            ),
            const Spacer(),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: foods
                    .map(
                      (e) => Container(
                        decoration: const BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        height: 450,
                        width: 300,
                        child: Column(
                          children: [
                            Image.asset(
                              e['images'],
                              fit: BoxFit.fill,
                              height: 250,
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                const SizedBox(width: 20),
                                Text(
                                  "${e['type']}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Image.asset(
                                  'assets/images/veg.png',
                                  scale: 10,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: const [
                                SizedBox(width: 20),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star_border, color: Colors.yellow),
                                Text("(4.0)", style: TextStyle(fontSize: 20))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 20,
                                  height: 50,
                                ),
                                Text(
                                  "${e['price']} ₹",
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.amberAccent,
                  padding: const EdgeInsets.only(
                      right: 20, left: 20, top: 15, bottom: 15),
                  elevation: 7,
                  enableFeedback: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('orderpage');
                },
                child: const Text(
                  "Make A Order",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
