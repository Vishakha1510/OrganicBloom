// ignore_for_file: file_names, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:organicbloom/Views/Screens/Add_address_screen.dart';
import 'package:organicbloom/helpers/providers/user_provider.dart';
import 'package:provider/provider.dart';

class MyAddressScreen extends StatefulWidget {
  const MyAddressScreen({super.key});

  @override
  State<MyAddressScreen> createState() => _MyAddressScreenState();
}

class _MyAddressScreenState extends State<MyAddressScreen> {
  TextEditingController flatController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final userprovider = Provider.of<UserProvider>(context, listen: false);
    final userid = userprovider.user?.id;
    return Scaffold(
      appBar: _buildappbar(),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(userid)
              .collection('addresses')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(
                child: Text("NO ADDRESSES FOUND"),
              );
            }

            final addresses = snapshot.data!.docs;
            return ListView.builder(
                itemCount: addresses.length,
                itemBuilder: (context, i) {
                  return Card(
                    shadowColor: Colors.green,
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      title: Text("FLAT: ${addresses[i]['flat']}"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("AREA: ${addresses[i]['area']}"),
                          Text("LANDMARK: ${addresses[i]['landmark']}"),
                          Text("CITY: ${addresses[i]['city']}"),
                          Text("STATE: ${addresses[i]['state']}"),
                          Text("PINCODE: ${addresses[i]['pincode']}"),
                        ],
                      ),
                      leading: IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          _showeditdialog(addresses[i].id, addresses[i].data());
                        },
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            _confirmDelete(addresses[i].id);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                    ),
                  );
                });
          }),
    );
  }

  AppBar _buildappbar() {
    return AppBar(
      backgroundColor: Color(0xFFA5CC65),
      foregroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        "MY ADDRESS",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddAddressScreen(),
              ));
            },
            icon: Icon(Icons.add_box_outlined))
      ],
    );
  }

  Future _showeditdialog(String docId, Map<String, dynamic> addressData) async {
    flatController.text = addressData['flat'];
    areaController.text = addressData['area'];
    landmarkController.text = addressData['landmark'];
    cityController.text = addressData['city'];
    stateController.text = addressData['state'];
    pincodeController.text = addressData['pincode'];
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Edit Address"),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                      controller: flatController,
                      decoration: InputDecoration(labelText: "Flat")),
                  TextField(
                      controller: areaController,
                      decoration: InputDecoration(labelText: "Area")),
                  TextField(
                      controller: landmarkController,
                      decoration: InputDecoration(labelText: "Landmark")),
                  TextField(
                      controller: cityController,
                      decoration: InputDecoration(labelText: "City")),
                  TextField(
                      controller: stateController,
                      decoration: InputDecoration(labelText: "State")),
                  TextField(
                      controller: pincodeController,
                      decoration: InputDecoration(labelText: "Pincode")),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () async {
                  final userprovider =
                      Provider.of<UserProvider>(context, listen: false);
                  final userid = userprovider.user?.id;

                  if (userid != null) {
                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(userid)
                        .collection('addresses')
                        .doc(docId)
                        .update({
                      'flat': flatController.text,
                      'area': areaController.text,
                      'landmark': landmarkController.text,
                      'city': cityController.text,
                      'state': stateController.text,
                      'pincode': pincodeController.text,
                    });

                    Navigator.of(context).pop();
                  }
                },
                child: Text("Save"),
              ),
            ],
          );
        });
  }

  void _confirmDelete(String docId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Confirm Delete"),
          content: Text("Are you sure you want to delete this address?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                final userprovider =
                    Provider.of<UserProvider>(context, listen: false);
                final userid = userprovider.user?.id;
                if (userid != null) {
                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(userid)
                      .collection('addresses')
                      .doc(docId)
                      .delete();

                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Address deleted successfully!")),
                  );
                }
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}
