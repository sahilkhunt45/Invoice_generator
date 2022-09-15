import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';
import 'global.dart';

class PDF extends StatefulWidget {
  const PDF({Key? key}) : super(key: key);

  @override
  State<PDF> createState() => _PDFState();
}

class _PDFState extends State<PDF> {
  final pdf = pw.Document();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              Directory? dir = await getExternalStorageDirectory();
              File file = File("${dir!.path}/bill.pdf");

              await file.writeAsBytes(await pdf.save());
            },
            icon: const Icon(Icons.save_alt),
          ),
          IconButton(
            onPressed: () async {
              Uint8List bytes = await pdf.save();

              await Printing.layoutPdf(onLayout: ((format) => bytes));
            },
            icon: const Icon(Icons.print),
          ),
        ],
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Column(
                children: const [
                  Text(
                    "SK RESTAURANT",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 3,
                indent: 65,
                endIndent: 65,
              ),
              Row(
                children: [
                  const Text(
                    "INVOICE",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.blueGrey,
                    ),
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/images/logo.png',
                    scale: 10,
                    filterQuality: FilterQuality.high,
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "INVOICE NUMBER ::",
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "0283834",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        "Customer Detail :-  ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "SK RESTAURANT",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        "677-976-356-556",
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        '''Shiv Plaza,Yogichowk.''',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${Globel.first_name} ${Globel.last_name} ",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        "${Globel.email}",
                        style: const TextStyle(fontSize: 15),
                      ),
                      Text(
                        "${Globel.phone_number}",
                        style: const TextStyle(fontSize: 15),
                      ),
                      Text(
                        "${Globel.address}",
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(
                thickness: 3,
                indent: 3,
                endIndent: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Your Items",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Quntity",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Amount",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              const Divider(
                thickness: 3,
                indent: 3,
                endIndent: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 170,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Burger",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Pizza",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Pasta",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Manchurian",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Dhosa",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Vadapav",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Dabeli",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      height: 170,
                      width: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Global.food
                              .map((e) => Text("${e['quantity']}"))
                              .toList()
                              .elementAt(0),
                          Global.food
                              .map((e) => Text("${e['quantity']}"))
                              .toList()
                              .elementAt(1),
                          Global.food
                              .map((e) => Text("${e['quantity']}"))
                              .toList()
                              .elementAt(2),
                          Global.food
                              .map((e) => Text("${e['quantity']}"))
                              .toList()
                              .elementAt(3),
                          Global.food
                              .map((e) => Text("${e['quantity']}"))
                              .toList()
                              .elementAt(4),
                          Global.food
                              .map((e) => Text("${e['quantity']}"))
                              .toList()
                              .elementAt(5),
                          Global.food
                              .map((e) => Text("${e['quantity']}"))
                              .toList()
                              .elementAt(6),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.topRight,
                      height: 170,
                      width: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Global.food
                              .map((e) => Text("${e['price']} ₹"))
                              .toList()
                              .elementAt(0),
                          Global.food
                              .map((e) => Text("${e['price']} ₹"))
                              .toList()
                              .elementAt(1),
                          Global.food
                              .map((e) => Text("${e['price']} ₹"))
                              .toList()
                              .elementAt(2),
                          Global.food
                              .map((e) => Text("${e['price']} ₹"))
                              .toList()
                              .elementAt(3),
                          Global.food
                              .map((e) => Text("${e['price']} ₹"))
                              .toList()
                              .elementAt(4),
                          Global.food
                              .map((e) => Text("${e['price']} ₹"))
                              .toList()
                              .elementAt(5),
                          Global.food
                              .map((e) => Text("${e['price']} ₹"))
                              .toList()
                              .elementAt(6),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 3,
                indent: 3,
                endIndent: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total :",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text("${getTotal()} ₹"),
                ],
              ),
              const Divider(
                thickness: 3,
                indent: 3,
                endIndent: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "GST(18 %) :",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text("${getgstTotal()} ₹"),
                ],
              ),
              const Divider(
                thickness: 3,
                indent: 3,
                endIndent: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "CGST(9 %) :",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text("${getcgstTotal()} ₹"),
                ],
              ),
              const Divider(
                thickness: 3,
                indent: 3,
                endIndent: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "SGST(9 %) :",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text("${getsgstTotal()} ₹"),
                ],
              ),
              const Divider(
                thickness: 3,
                indent: 3,
                endIndent: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Net price :",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text("${total()} ₹"),
                ],
              ),
              const Divider(
                thickness: 3,
                indent: 3,
                endIndent: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Visit Again",
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  getTotal() {
    double sum = 0;
    List price;
    price = Global.food.map((e) {
      return (e['price'] * e['quantity']);
    }).toList();
    for (int i = 0; i < price.length; i++) {
      sum += price[i] as double;
    }
    return sum;
  }

  getgstTotal() {
    double sum = 0;
    List price;
    price = Global.food.map((e) {
      return (e['price'] * e['quantity']) * (18 / 100);
    }).toList();
    for (int i = 0; i < price.length; i++) {
      sum += price[i] as double;
    }
    return sum;
  }

  getcgstTotal() {
    double sum = 0;
    List price;
    price = Global.food.map((e) {
      return (e['price'] * e['quantity']) * (9 / 100);
    }).toList();
    for (int i = 0; i < price.length; i++) {
      sum += price[i] as double;
    }
    return sum;
  }

  getsgstTotal() {
    double sum = 0;
    List price;
    price = Global.food.map((e) {
      return (e['price'] * e['quantity']) * (9 / 100);
    }).toList();
    for (int i = 0; i < price.length; i++) {
      sum += price[i] as double;
    }
    return sum;
  }

  total() {
    double t;
    t = getsgstTotal() + getgstTotal() + getcgstTotal() + getTotal();
    return t;
  }
}
//  Container(
//   child: Column(
//     children: [
//       IconButton(
//         onPressed: () async {
//           Directory? dir = await getExternalStorageDirectory();
//           File file = File("${dir!.path}/resume.pdf");
//
//           await file.writeAsBytes(await pdf.save());
//         },
//         icon: Icon(Icons.save_alt),
//       ),
//       IconButton(
//         onPressed: () async {
//           //  Uint8List bytes = await pdf.save();
//           await Printing.layoutPdf(
//               onLayout: (format) async => pdf.save());
//           //  await Printing.layoutPdf(onLayout: ((format) => bytes));
//         },
//         icon: Icon(Icons.print),
//       ),
//     ],
//   ),
// ),
