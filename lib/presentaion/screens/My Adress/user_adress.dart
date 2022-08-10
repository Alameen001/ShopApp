import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopx/Services/fireStore_service.dart';
import 'package:shopx/presentaion/screens/My%20Adress/Adress_screen.dart';
import 'package:shopx/presentaion/screens/Payment/payment.dart';
import 'package:shopx/presentaion/widgets/TextForm/textform.dart';

class UserAdressScreen extends StatefulWidget {
  UserAdressScreen({Key? key}) : super(key: key);

  // User? user;

  @override
  State<UserAdressScreen> createState() => _UserAdressScreenState();
}

class _UserAdressScreenState extends State<UserAdressScreen> {
  TextEditingController pincodeController = TextEditingController();

  TextEditingController cityController = TextEditingController();
   TextEditingController stateController = TextEditingController();

    TextEditingController localityController = TextEditingController();

     TextEditingController buildingController = TextEditingController();
      TextEditingController landmarkController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  // bool isLoading = false;

  final selectedvalue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 130,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "Add Adress",
                style: TextStyle(color: Colors.black),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Reset",
                    style: TextStyle(color: Colors.blue),
                  ))
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                ListView(
                  shrinkWrap: true,
                  primary: false,
                  children: [
                    Divider(
                      thickness: 3,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Contact Info"),
                    TextInputfield(
                      hinttext: "Name",
                      Tcontroller: nameController,
                    ),
                    TextInputfield(
                      hinttext: "Phone Number(+91)",
                      Tcontroller: phoneController,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      thickness: 3,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Adress Info"),
                    Row(
                      children: [
                        Expanded(
                            child: TextInputfield(
                          hinttext: "Pincode",
                          Tcontroller: pincodeController,
                        )),
                        Expanded(
                            child: TextInputfield(
                          hinttext: "City",
                          Tcontroller: cityController,
                        )),
                      ],
                    ),
                    TextInputfield(
                      hinttext: "State",
                      Tcontroller: stateController,
                    ),
                    TextInputfield(
                      hinttext: "Locality/Area/Street",
                      Tcontroller: localityController,
                    ),
                    TextInputfield(
                      hinttext: "Flat no/Building Name",
                      Tcontroller: buildingController,
                    ),
                    TextInputfield(
                      hinttext: "landMark",
                      Tcontroller: landmarkController,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      thickness: 3,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Type of Adress"),
                    SizedBox(
                      height: 20,
                    ),
                    GenderRadio(),
                    SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: SizedBox(
          width: double.maxFinite,
          child: ElevatedButton(
            onPressed: () async {
              if (nameController.text == "" || phoneController.text == ""|| pincodeController.text==""||cityController.text==""||stateController.text==""||localityController.text==""|| buildingController.text==""||    landmarkController.text=="") {
                Get.snackbar("All Feilds are required", "");
              } else {
                print('=================================');

                FirebaseAuth.instance.authStateChanges().listen((user) async {
                  if (user != null) {
                    print(user.uid);
                    await FireStoreService().InsertAddress(
                        nameController.text,
                        phoneController.text,
                        pincodeController.text,
                        cityController.text,
                        stateController.text,
                        localityController.text,
                        buildingController.text,
                        landmarkController.text,
                      
                        user.uid);
                    print('sucessful');
                    Get.to(AdressScreen(price: '',));
                  }
                });

                //      setState(() {
                //     isLoading=true;
                //        Get.to(PaymentScreen());
                // });
              }
            },
            child: Text("Save Adresss"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black)),
          ),
        ),
      ),
    );
  }

  GenderRadio() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Transform.scale(
            scale: 1.3,
            child: Radio<int>(
              value: 1,
              groupValue: selectedvalue,
              onChanged: (value) {},
            ),
          ),
          const Text(
            'Home',
            style: TextStyle(fontSize: 18),
          ),
          Transform.scale(
            scale: 1.3,
            child: Radio<int>(
              value: 2,
              groupValue: selectedvalue,
              onChanged: (value) {},
            ),
          ),
          const Text(
            'Office',
            style: TextStyle(fontSize: 18),
          ),
          Transform.scale(
            scale: 1.3,
            child: Radio<int>(
              value: 2,
              groupValue: selectedvalue,
              onChanged: (value) {},
            ),
          ),
          const Text(
            'Other',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
