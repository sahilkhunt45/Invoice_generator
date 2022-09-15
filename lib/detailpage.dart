import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'global.dart';

class Detail_page extends StatefulWidget {
  const Detail_page({Key? key}) : super(key: key);

  @override
  State<Detail_page> createState() => _Detail_pageState();
}

class _Detail_pageState extends State<Detail_page> {
  final ImagePicker _picker = ImagePicker();

  final GlobalKey<FormState> contactFormkey = GlobalKey<FormState>();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController phonenumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
        title: const Text(
          "Customer Detail",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.amber.withOpacity(0.1),
                Colors.yellow.withOpacity(0.1),
                Colors.amber.withOpacity(0.1),
                Colors.yellow.withOpacity(0.1),
                Colors.amber.withOpacity(0.1),
              ],
              end: Alignment.centerLeft,
              begin: Alignment.centerRight,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      backgroundImage: (Globel.image != null)
                          ? FileImage(Globel.image!)
                          : null,
                      radius: 50,
                      backgroundColor: Colors.grey.shade400,
                      child: (Globel.image != null)
                          ? const Text("")
                          : const Text(
                              "ADD",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.amber,
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context) => AlertDialog(
                            title: const Text("Add Photo"),
                            actions: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 50,
                                    child: TextButton(
                                      onPressed: () async {
                                        XFile? pickedFile =
                                            await _picker.pickImage(
                                                source: ImageSource.camera);
                                        setState(() {
                                          Navigator.of(context).pop();
                                          Globel.image = File(pickedFile!.path);
                                        });
                                      },
                                      child: const Text(
                                        "Take your photo\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.amber,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: TextButton(
                                      onPressed: () async {
                                        XFile? pickedFile =
                                            await _picker.pickImage(
                                          source: ImageSource.gallery,
                                        );
                                        setState(() {
                                          Navigator.of(context).pop();
                                          Globel.image = File(pickedFile!.path);
                                        });
                                      },
                                      child: const Text(
                                        "Chose Form Gallary\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.amber,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: TextButton(
                                      onPressed: () async {
                                        setState(() {
                                          Navigator.of(context).pop();
                                          Globel.image = null;
                                        });
                                      },
                                      child: Row(
                                        children: const [
                                          Icon(Icons.delete,
                                              color: Colors.amber),
                                          Text(
                                            "Delete Your Photo",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.amber,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      mini: true,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(13),
                child: Form(
                  key: contactFormkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "First Name",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        cursorColor: Colors.amber,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        keyboardType: TextInputType.name,
                        controller: firstnameController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter your first name";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          setState(() {
                            Globel.first_name = val;
                          });
                        },
                        decoration: InputDecoration(
                          hoverColor: Colors.amber,
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.amber)),
                          filled: true,
                          fillColor: Colors.grey.shade400,
                          hintStyle: const TextStyle(
                            color: Colors.black45,
                          ),
                          hintText: "First Name",
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Last Name",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        cursorColor: Colors.amber,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        keyboardType: TextInputType.name,
                        controller: lastnameController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter your last name";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          setState(() {
                            Globel.last_name = val;
                          });
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade400,
                          hoverColor: Colors.amber,
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.amber)),
                          hintStyle: const TextStyle(
                            color: Colors.black45,
                          ),
                          hintText: "Last Name",
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Phone Number",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        cursorColor: Colors.amber,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        keyboardType: TextInputType.number,
                        controller: phonenumberController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter your number first";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          setState(() {
                            Globel.phone_number = val;
                          });
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade400,
                          hoverColor: Colors.amber,
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.amber)),
                          hintStyle: const TextStyle(
                            color: Colors.black45,
                          ),
                          hintText: "Phone Number",
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Email",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        cursorColor: Colors.amber,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter your Email first";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          setState(() {
                            Globel.email = val;
                          });
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade400,
                          hoverColor: Colors.amber,
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.amber)),
                          hintStyle: const TextStyle(
                            color: Colors.black45,
                          ),
                          hintText: "E-Mail",
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Address",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        cursorColor: Colors.amber,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        keyboardType: TextInputType.streetAddress,
                        controller: addressController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter your Address first";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          setState(() {
                            Globel.address = val;
                          });
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade400,
                          hoverColor: Colors.amber,
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.amber)),
                          hintStyle: const TextStyle(
                            color: Colors.black45,
                          ),
                          hintText: "Address",
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Successfully Saved",
                                ),
                                behavior: SnackBarBehavior.floating,
                                dismissDirection: DismissDirection.horizontal,
                                duration: Duration(
                                  seconds: 5,
                                ),
                              ),
                            );
                            if (contactFormkey.currentState!.validate()) {
                              contactFormkey.currentState!.save();

                              Navigator.of(context)
                                  .pushReplacementNamed('homepage');
                            }
                            Detail d = Detail(
                              phone_number: Globel.phone_number,
                              image: Globel.image,
                              first_name: Globel.first_name,
                              last_name: Globel.last_name,
                              email: Globel.email,
                              address: Globel.address,
                            );
                            setState(() {
                              Globel.alldetail.add(d);
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 20,
                            ),
                            primary: Colors.amberAccent,
                            padding: const EdgeInsets.only(
                                right: 20, left: 20, top: 15, bottom: 15),
                            elevation: 7,
                            enableFeedback: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          child: const Text("Save"),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 20,
                            ),
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
                            contactFormkey.currentState!.reset();

                            firstnameController.clear();
                            lastnameController.clear();
                            emailController.clear();
                            phonenumberController.clear();
                            addressController.clear();

                            setState(() {
                              Globel.first_name = null;
                              Globel.last_name = null;
                              Globel.phone_number = null;
                              Globel.email = null;
                              Globel.address = null;
                            });
                          },
                          child: const Text("Clear"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
