import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uni/screens/datas.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var docid;
  var _name = TextEditingController();

  final _age = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _address = TextEditingController();

  Future addUserDetails(
      // String Name, String Age, String PhoneNumber, String Address
      ) async {
    final userDoc =
        FirebaseFirestore.instance.collection('user details').doc(namem);
    print('name:$docid');

    final data = {
      'Name': _name.text.trim(),
      'Age': _age.text.trim(),
      'PhoneNumber': _phoneNumber.text.trim(),
      'Address': _address.text.trim()
    };
    await userDoc.set(data);
  }

  @override
  Widget build(BuildContext context) {
    var namem = _name.toString();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await addUserDetails();
          namem = _name.text.trim();
          // print('name:$namem');
          print(namem);
          Navigator.pop(context, _name);
        },
        child: Text('Save'),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Edit Profile'),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: 'Name',
                  contentPadding: const EdgeInsets.all(10)),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.datetime,
              controller: _age,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: 'D O B',
                  contentPadding: const EdgeInsets.all(10)),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.phone,
              controller: _phoneNumber,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: 'Mobile Number',
                  contentPadding: const EdgeInsets.all(10)),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _address,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: 'Address',
                  contentPadding: const EdgeInsets.all(10)),
            ),
          ],
        ),
      ),
    );
  }
}
