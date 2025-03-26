import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MarkInput extends StatefulWidget {
  @override
  _MarkInputState createState() => _MarkInputState();
}

class _MarkInputState extends State<MarkInput> {
  final _csI = TextEditingController();
  final _csP = TextEditingController();
  int? _csTotal;

  final _mathI = TextEditingController();
  final _mathP = TextEditingController();
  int? _mathTotal;

  final _statiI = TextEditingController();
  final _statiP = TextEditingController();
  int? _statiTotal;

  final _mdcI = TextEditingController();
  final _mdcP = TextEditingController();
  int? _mdcTotal;

  final _aecI = TextEditingController();
  final _aecP = TextEditingController();
  int? _aecTotal;

  String? userEmail;

  late List<String> Mark;

  Future addUserMark() async {
    _csTotal = (double.parse(_csI.text.trim()) + double.parse(_csP.text.trim()))
        .toInt();

    _mathTotal =
        (double.parse(_mathI.text.trim()) + double.parse(_mathP.text.trim()))
            .toInt();

    _statiTotal =
        (double.parse(_statiI.text.trim()) + double.parse(_statiP.text.trim()))
            .toInt();

    _mdcTotal =
        (double.parse(_mdcI.text.trim()) + double.parse(_mdcP.text.trim()))
            .toInt();

    _aecTotal =
        (double.parse(_aecI.text.trim()) + double.parse(_aecP.text.trim()))
            .toInt();
    // T = _csI. + _csP.text.trim();
    // Mark = [
    //   [_csI.text.trim(), _csP.text.trim(), _csTotal.toString()],
    //   [_mathI.text.trim(), _mathP.text.trim(), _mathTotal.toString()],
    //   [_statiI.text.trim(), _statiP.text.trim(), _statiTotal.toString()],
    //   [_mdcI.text.trim(), _mdcP.text.trim(), _mdcTotal.toString()],
    //   [_aecI.text.trim(), _aecP.text.trim(), _aecTotal.toString()],
    // ];
    Mark = [
      _csTotal.toString(),
      _mathTotal.toString(),
      _statiTotal.toString(),
      _mdcTotal.toString(),
      _aecTotal.toString(),
    ];

    print(Mark);

    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      setState(() {
        userEmail = currentUser.email;
      });
      print("useremail : $userEmail");
    } else {
      print('Document does not exist');
      return null;
    }
    // final userDoc =
    // FirebaseFirestore.instance
    //     .collection('user details')
    //     .doc(userEmail)
    //     .collection('mark')
    //     .doc("compuer science")
    //     .set({
    //   "cs": _csI.text.trim(),
    //   "practical": _csP.text.trim(),

    FirebaseFirestore.instance
        .collection('user details')
        .doc(userEmail)
        .collection('mark')
        .doc(userEmail)
        .set({
      'CsTotal': _csTotal,
      'MathTotal': _mathTotal,
      'StatiTotal': _statiTotal,
      'MdcTotal': _mdcTotal,
      'AecTotal': _aecTotal,
    });
    print("mark added");
  }

  @override
  Widget build(BuildContext context) {
    // addUserDetails(_csI, _csP);
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Compuer Science",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Internal  :"),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[800],
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(15)),
                      height: 50,
                      width: 60,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: _csI,
                        decoration: InputDecoration(
                            hintText: '00',
                            border: InputBorder.none,
                            // hintText: '00',
                            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0)),
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Text("Practical  :"),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[800],
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(15)),
                      height: 50,
                      width: 60,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: _csP,
                        decoration: InputDecoration(
                            hintText: '00',
                            border: InputBorder.none,
                            // hintText: '00',
                            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0)),
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total  :"),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[800],
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(15)),
                        height: 50,
                        width: 60,
                        child: Center(child: Text(_csTotal.toString() ?? ""))),
                  ],
                ),
              ),
              //
              //                                                           Maths
              //
              Text('Maths', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Internal  :"),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[800],
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(15)),
                      height: 50,
                      width: 60,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: _mathI,
                        decoration: InputDecoration(
                            hintText: '00',
                            border: InputBorder.none,
                            // hintText: '00',
                            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0)),
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Text("Practical  :"),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[800],
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(15)),
                      height: 50,
                      width: 60,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: _mathP,
                        decoration: InputDecoration(
                            hintText: '00',
                            border: InputBorder.none,
                            // hintText: '00',
                            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0)),
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total  :"),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[800],
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(15)),
                        height: 50,
                        width: 60,
                        child:
                            Center(child: Text(_mathTotal.toString() ?? ""))),
                  ],
                ),
              ),
              //
              //                                                          Stati
              //
              Text('Statistics', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Internal  :"),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[800],
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(15)),
                      height: 50,
                      width: 60,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: _statiI,
                        decoration: InputDecoration(
                            hintText: '00',
                            border: InputBorder.none,
                            // hintText: '00',
                            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0)),
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Text("Practical  :"),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[800],
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(15)),
                      height: 50,
                      width: 60,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: _statiP,
                        decoration: InputDecoration(
                            hintText: '00',
                            border: InputBorder.none,
                            // hintText: '00',
                            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0)),
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total  :"),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[800],
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(15)),
                        height: 50,
                        width: 60,
                        child:
                            Center(child: Text(_statiTotal.toString() ?? ""))),
                  ],
                ),
              ),
              //
              //                                                          Aec
              //
              Text("AEC", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Internal  :"),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[800],
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(15)),
                      height: 50,
                      width: 60,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: _aecI,
                        decoration: InputDecoration(
                            hintText: '00',
                            border: InputBorder.none,
                            // hintText: '00',
                            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0)),
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Text("Practical  :"),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[800],
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(15)),
                      height: 50,
                      width: 60,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: _aecP,
                        decoration: InputDecoration(
                            hintText: '00',
                            border: InputBorder.none,
                            // hintText: '00',
                            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0)),
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total  :"),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[800],
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(15)),
                        height: 50,
                        width: 60,
                        child: Center(child: Text(_aecTotal.toString() ?? ""))),
                  ],
                ),
              ),
              //
              //                                                            MDC
              //

              Text("MDC", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Internal  :"),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[800],
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(15)),
                      height: 50,
                      width: 60,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: _mdcI,
                        decoration: InputDecoration(
                            hintText: '00',
                            border: InputBorder.none,
                            // hintText: '00',
                            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0)),
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Text("Practical  :"),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[800],
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(15)),
                      height: 50,
                      width: 60,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: _mdcP,
                        decoration: InputDecoration(
                            hintText: '00',
                            border: InputBorder.none,
                            // hintText: '00',
                            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0)),
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total  :"),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[800],
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(15)),
                        height: 50,
                        width: 60,
                        child: Center(child: Text(_mdcTotal.toString() ?? ""))),
                  ],
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: addUserMark,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: []),
                        padding: const EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width,
                        child: const Center(
                          child: Text('Save',
                              style: TextStyle(
                                  letterSpacing: 3,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.white)),
                        )),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
