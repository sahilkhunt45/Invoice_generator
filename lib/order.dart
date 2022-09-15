import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'global.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class Order_item extends StatefulWidget {
  const Order_item({Key? key}) : super(key: key);

  @override
  State<Order_item> createState() => _Order_itemState();
}

class _Order_itemState extends State<Order_item> {
  double totalProductPrice = 0;
  double totalPrice = 0;
  double productQuantity = 0;

  @override
  final pdf = pw.Document();
  final imagec = pw.MemoryImage(
    File(Globel.image!.path).readAsBytesSync(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
        actions: [
          IconButton(
            onPressed: () async {
              Directory? output = await getExternalStorageDirectory();
              File file = File("${output!.path}/food.pdf");
              await file.writeAsBytes(await pdf.save());
              OpenFile.open(file.path);
            },
            // Directory? dir = await getExternalStorageDirectory();
            // File file = File("${dir!.path}/bill.pdf");

            //    await Printing.layoutPdf(onLayout: (format) => RPDF());
            icon: const Icon(Icons.save_alt),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          ...Global.food
              .map(
                (e) => Card(
                  elevation: 6,
                  child: ListTile(
                    title: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "${e['name']}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text("${e['price']} ₹"),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(width: 30),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    textStyle: const TextStyle(
                                      fontSize: 20,
                                    ),
                                    primary: Colors.amberAccent,
                                    padding: const EdgeInsets.only(
                                        right: 20,
                                        left: 20,
                                        top: 15,
                                        bottom: 15),
                                    elevation: 7,
                                    enableFeedback: true,
                                    shadowColor: Colors.yellow,
                                    side: const BorderSide(
                                      color: Colors.amber,
                                      style: BorderStyle.solid,
                                      width: 2,
                                    ),
                                    visualDensity: VisualDensity.comfortable,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (e['quantity'] > 0) {
                                        e['quantity']--;
                                      }

                                      e['totalPrice'] =
                                          e['price'] * e['quantity'];

                                      totalPrice += e['totalPrice'];
                                    });
                                  },
                                  child: const Icon(Icons.remove),
                                ),
                                const SizedBox(width: 10),
                                Text('${e['quantity']}'),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    textStyle: const TextStyle(
                                      fontSize: 20,
                                    ),
                                    primary: Colors.amberAccent,
                                    padding: const EdgeInsets.only(
                                        right: 20,
                                        left: 20,
                                        top: 15,
                                        bottom: 15),
                                    elevation: 7,
                                    shadowColor: Colors.yellow,
                                    side: const BorderSide(
                                      color: Colors.amber,
                                      style: BorderStyle.solid,
                                      width: 2,
                                    ),
                                    visualDensity: VisualDensity.comfortable,
                                    enableFeedback: true,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      e['quantity']++;
                                      e['totalPrice'] =
                                          e['price'] * e['quantity'];

                                      totalPrice += e['totalPrice'];
                                    });
                                  },
                                  child: const Icon(Icons.add),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: Image.asset(
                      e['images'],
                      scale: e['scale'],
                    ),
                  ),
                ),
              )
              .toList(),
          const SizedBox(height: 10),
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
              onPressed: () async {
                // Uint8List bytes = await pdf.save();

                await Printing.layoutPdf(onLayout: (format) => RPDF());
              },
              child: const Text(
                "Make a Payment",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ]),
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

  Future<Uint8List> RPDF() async {
    final photo =
        (await rootBundle.load('assets/images/logo.png')).buffer.asUint8List();
    final emoji = await PdfGoogleFonts.notoColorEmoji();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) => pw.Center(
          child: pw.Container(
            child: pw.Column(
              children: [
                pw.Column(
                  children: [
                    pw.Text(
                      "SK RESTAURANT",
                      style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 50,
                        color: PdfColors.amber,
                      ),
                    ),
                  ],
                ),
                pw.Divider(
                  thickness: 3,
                  indent: 65,
                  endIndent: 65,
                ),
                pw.Row(
                  children: [
                    pw.Text(
                      "INVOICE",
                      style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 40,
                        color: PdfColors.blueGrey,
                      ),
                    ),
                    pw.Spacer(),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.Container(
                          height: 80,
                          width: 110,
                          child: pw.Image(
                            pw.MemoryImage(photo),
                          ),
                        ),
                        pw.Text(
                          "INVOICE NUMBER ::",
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.Container(
                          height: 80,
                          width: 110,
                          child: pw.Image(imagec),
                        ),
                      ],
                    ),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          "0283834",
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.Text(
                          "Customer Detail :-  ",
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          "SK RESTAURANT",
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold, fontSize: 15),
                        ),
                        pw.Text(
                          "677-976-356-556",
                          style: const pw.TextStyle(fontSize: 15),
                        ),
                        pw.Text(
                          '''Shiv Plaza,Yogichowk.''',
                          style: const pw.TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.Text(
                          "${Globel.first_name} ${Globel.last_name} ",
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold, fontSize: 15),
                        ),
                        pw.Text(
                          "${Globel.email}",
                          style: const pw.TextStyle(fontSize: 15),
                        ),
                        pw.Text(
                          "${Globel.phone_number}",
                          style: const pw.TextStyle(fontSize: 15),
                        ),
                        pw.Text(
                          "${Globel.address}",
                          style: const pw.TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
                pw.Divider(
                  thickness: 3,
                  indent: 3,
                  endIndent: 3,
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      "Your Items",
                      style: const pw.TextStyle(fontSize: 20),
                    ),
                    pw.Text(
                      "Quntity",
                      style: const pw.TextStyle(fontSize: 20),
                    ),
                    pw.Text(
                      "Amount",
                      style: const pw.TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                pw.Divider(
                  thickness: 3,
                  indent: 3,
                  endIndent: 3,
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Expanded(
                      child: pw.Container(
                        alignment: pw.Alignment.centerLeft,
                        height: 170,
                        child: pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                              "Burger",
                              style: const pw.TextStyle(fontSize: 20),
                            ),
                            pw.Text(
                              "Pizza",
                              style: const pw.TextStyle(fontSize: 20),
                            ),
                            pw.Text(
                              "Pasta",
                              style: const pw.TextStyle(fontSize: 20),
                            ),
                            pw.Text(
                              "Manchurian",
                              style: const pw.TextStyle(fontSize: 20),
                            ),
                            pw.Text(
                              "Dhosa",
                              style: const pw.TextStyle(fontSize: 20),
                            ),
                            pw.Text(
                              "Vadapav",
                              style: const pw.TextStyle(fontSize: 20),
                            ),
                            pw.Text(
                              "Dabeli",
                              style: const pw.TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    pw.Expanded(
                      child: pw.Container(
                        alignment: pw.Alignment.center,
                        height: 170,
                        width: 80,
                        child: pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            Global.food
                                .map((e) => pw.Text("${e['quantity']}"))
                                .toList()
                                .elementAt(0),
                            Global.food
                                .map((e) => pw.Text("${e['quantity']}"))
                                .toList()
                                .elementAt(1),
                            Global.food
                                .map((e) => pw.Text("${e['quantity']}"))
                                .toList()
                                .elementAt(2),
                            Global.food
                                .map((e) => pw.Text("${e['quantity']}"))
                                .toList()
                                .elementAt(3),
                            Global.food
                                .map((e) => pw.Text("${e['quantity']}"))
                                .toList()
                                .elementAt(4),
                            Global.food
                                .map((e) => pw.Text("${e['quantity']}"))
                                .toList()
                                .elementAt(5),
                            Global.food
                                .map((e) => pw.Text("${e['quantity']}"))
                                .toList()
                                .elementAt(6),
                          ],
                        ),
                      ),
                    ),
                    pw.Expanded(
                      child: pw.Container(
                        alignment: pw.Alignment.topRight,
                        height: 170,
                        width: 80,
                        child: pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            Global.food
                                .map((e) => pw.Text("${e['price']} RS",
                                    style: pw.TextStyle(
                                      fontFallback: [emoji],
                                    )))
                                .toList()
                                .elementAt(0),
                            Global.food
                                .map((e) => pw.Text("${e['price']} RS",
                                    style: pw.TextStyle(
                                      fontFallback: [emoji],
                                    )))
                                .toList()
                                .elementAt(1),
                            Global.food
                                .map((e) => pw.Text("${e['price']} RS",
                                    style: pw.TextStyle(
                                      fontFallback: [emoji],
                                    )))
                                .toList()
                                .elementAt(2),
                            Global.food
                                .map((e) => pw.Text("${e['price']} RS",
                                    style: pw.TextStyle(
                                      fontFallback: [emoji],
                                    )))
                                .toList()
                                .elementAt(3),
                            Global.food
                                .map((e) => pw.Text("${e['price']} RS",
                                    style: pw.TextStyle(
                                      fontFallback: [emoji],
                                    )))
                                .toList()
                                .elementAt(4),
                            Global.food
                                .map((e) => pw.Text("${e['price']} RS",
                                    style: pw.TextStyle(
                                      fontFallback: [emoji],
                                    )))
                                .toList()
                                .elementAt(5),
                            Global.food
                                .map((e) => pw.Text("${e['price']} RS",
                                    style: pw.TextStyle(
                                      fontFallback: [emoji],
                                    )))
                                .toList()
                                .elementAt(6),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                pw.Divider(
                  thickness: 3,
                  indent: 3,
                  endIndent: 3,
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      "Total :",
                      style: const pw.TextStyle(fontSize: 20),
                    ),
                    pw.Text("${getTotal()} RS",
                        style: pw.TextStyle(
                          fontFallback: [emoji],
                        )),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      "GST(18 %) :",
                      style: const pw.TextStyle(fontSize: 20),
                    ),
                    pw.Text("${getgstTotal()} RS",
                        style: pw.TextStyle(
                          fontFallback: [emoji],
                        )),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      "CGST(9 %) :",
                      style: const pw.TextStyle(fontSize: 20),
                    ),
                    pw.Text("${getcgstTotal()} RS",
                        style: pw.TextStyle(
                          fontFallback: [emoji],
                        )),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      "SGST(9 %) :",
                      style: const pw.TextStyle(fontSize: 20),
                    ),
                    pw.Text("${getsgstTotal()} RS",
                        style: pw.TextStyle(
                          fontFallback: [emoji],
                        )),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      "Net price :",
                      style: const pw.TextStyle(fontSize: 20),
                    ),
                    pw.Text("${total()} RS",
                        style: pw.TextStyle(
                          fontFallback: [emoji],
                        )),
                  ],
                ),
                pw.Divider(
                  thickness: 3,
                  indent: 3,
                  endIndent: 3,
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Text(
                      "Visit Again",
                      style: const pw.TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

    return pdf.save();
  }
}
