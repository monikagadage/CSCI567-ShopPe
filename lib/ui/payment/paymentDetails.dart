// ignore_for_file: deprecated_member_use

import 'package:awesome_card/awesome_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:signup/ui/payment/constant.dart';
// import 'package:signup/ui/payment/defaultAppBar.dart';
// import 'package:signup/ui/payment/defaultBackButton.dart';
// import 'package:signup/ui/payment/stickyLabel.dart';
import 'package:flutter/material.dart';
// import 'package:signup/ui/payment/constant.dart';
import 'package:signup/ui/payment/paymentModal.dart';

class PaymentDetails extends StatefulWidget {
  PaymentDetails({Key? key}) : super(key: key);

  @override
  _PaymentDetailsState createState() => _PaymentDetailsState();
}

class StickyLabel extends StatelessWidget {
  final String text;
  final Color textColor;
  StickyLabel({
    Key? key,
    required this.text,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(
        left: 24.0,
        top: 16,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 20.0,
        ),
      ),
    );
  }
}

class _PaymentDetailsState extends State<PaymentDetails> {
  @override
  void initState() {
    super.initState();
    fetch_card();
  }

  late String cardNumber = " ",
      cardExpiry = " ",
      cardHolderName = " ",
      bankName = " ",
      cvv = " ";
  List card_items = [];
  fetch_card() async {
    var _firestoreInstance = FirebaseFirestore.instance;
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;

    DocumentSnapshot<Map<String, dynamic>> qn = await _firestoreInstance
        .collection("payment")
        .doc(currentUser!.email)
        .get();

    setState(() {
      // for (int i = 0; i < qn.docs.length; i++) {
      cardNumber = qn['cardNumber'];
      cardExpiry = qn['cardExpiry'];
      cardHolderName = qn['cardHolderName'];
      bankName = qn['bankName'];
      cvv = qn['cvv'];
      print("cardNumber ${cardNumber}");
    });

    return qn;
  }

  @override
  Widget build(BuildContext context) {
    final paymentDetailList = [
      PaymentModal(
          date: "Jan 01",
          details: "Buy IPhoneX",
          amount: 1000.0,
          textColor: Colors.red),
      PaymentModal(
          date: "Aug 15",
          details: "Flat ₹650 off",
          amount: 650.0,
          textColor: Colors.green),
      PaymentModal(
          date: "Dec 03",
          details: "Congrats! Flat ₹180",
          amount: 180.0,
          textColor: Colors.green),
      PaymentModal(
          date: "Feb 14",
          details: "Buy Shoes Upto 50% Off",
          amount: 540.0,
          textColor: Colors.red),
      PaymentModal(
          date: "Sep 08",
          details: "Buy Footwear on Discount",
          amount: 210.0,
          textColor: Colors.red),
      PaymentModal(
          date: "Apr 18",
          details: "Congrats! ₹375 Rewarded",
          amount: 375.0,
          textColor: Colors.green),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          " Saved Payment",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CreditCard(
              cardNumber: cardNumber,
              cardExpiry: cardExpiry,
              cardHolderName: cardHolderName,
              bankName: bankName,
              cvv: cvv,
              // showBackSide: true,
              frontBackground: CardBackgrounds.black,
              backBackground: CardBackgrounds.white,
              cardType: CardType.masterCard,
              showShadow: true,
            ),
            StickyLabel(
              text: "Card Information",
              textColor: Colors.black,
            ),
            SizedBox(height: 8.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 0.5,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("My Perosnal Card",
                            style: TextStyle(fontSize: 18.0)),
                        Container(
                            width: 60.0,
                            child: Icon(Icons.payment,
                                color: Color(0xFFFF8084), size: 40.0)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Card Number",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              cardNumber,
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        Container(
                          width: 45.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Exp.",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                cardExpiry,
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Card Name",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              cardHolderName,
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        Container(
                          width: 45.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "CVV",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                cvv,
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 48.0,
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                      ),
                      color: Color.fromARGB(255, 44, 34, 34).withOpacity(0.2),
                      child: Text(
                        "Edit Detail",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      onPressed: () => print("Edit Detail"),
                    ),
                  ),
                ],
              ),
            ),
            StickyLabel(text: "Transaction Details", textColor: Colors.black),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 0.5,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: paymentDetailList.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        paymentDetailList[index].date,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xFF808080),
                        ),
                      ),
                      Container(
                        width: 190.0,
                        child: Text(
                          paymentDetailList[index].details,
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      Container(
                        width: 70.0,
                        child: Text(
                          "\$ ${paymentDetailList[index].amount}",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: paymentDetailList[index].textColor,
                          ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(thickness: 0.5, color: Colors.grey);
                },
              ),
            ),
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}