import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homedecor_shopping_app/view/screen/address_screen.dart';
import '../../widgets/backbutton.dart';
import '../../widgets/furniture/paymentmethod_widget.dart';
import '../../widgets/stepper_widget.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(child: BackbuttonWidget(),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
              return AddressScreen();
            }));
          },),
        centerTitle: true,
        title: const Text(
          "Payment Method",
          style: TextStyle(
            color: Colors.black,
            fontSize: 19,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StepperWidget(currentStep: 2),
            const SizedBox(height: 24),

            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0,bottom: 16,right: 90),
                    child: const Text(
                      "Select Your Payment Method",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                   Divider(height: 1, color: Colors.black),
                  PaymentmethodWidget(title: "Cash on delivery (cash/UPI)", icon: Icons.account_balance_wallet_outlined,iconcolor:  Colors.green, isRadio: true),
                  Divider(height: 1, color: Colors.black26),
                  PaymentmethodWidget(title: "PhonePe/Google Pay/UPI",icon:  Icons.account_balance_wallet_outlined,iconcolor:  Colors.black),
                   Divider(height: 1, color: Colors.black26),
                  PaymentmethodWidget(title: "Credit/Debit card", icon:  Icons.credit_card,iconcolor:  Colors.black),
                   Divider(height: 1, color: Colors.black26),
                  PaymentmethodWidget(title: "Wallets",icon:  Icons.account_balance_wallet,iconcolor:  Colors.black),
                   Divider(height: 1, color: Colors.black26),
                  PaymentmethodWidget(title: "Net Banking",icon:  Icons.account_balance,iconcolor:  Colors.black),
                ],
              ),
            ),

            const SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3,
                    offset: Offset(0, 0), // Adds slight vertical shadow
                  ),],
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.card_giftcard_outlined, color: Color.fromRGBO(144, 57, 19, 1)),
                      SizedBox(width: 8),
                      Text("Have a Gift Card?"),
                    ],
                  ),
                  const Text("Apply", style: TextStyle(color: Color.fromRGBO(144, 57, 19, 1),fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            PriceDetails(),
            const SizedBox(height: 25),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(153, 133, 88, 1),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {},
              child: const Text("Pay Now", style: TextStyle(fontSize: 19, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }


  Widget PriceDetails() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 3,
            offset: Offset(0, 0), // Adds slight vertical shadow
          ),],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.only(top: 14,bottom: 14,left: 12,right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Price Details (1 product)", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 10),
          PriceRow("Order Amount", "\$95.00"),
          PriceRow("Order Savings", "\$15.00", isSavings: true),
          PriceRow("Platform Fee", "\$2.00"),
          PriceRow("Shipping Fee", "FREE", isSavings: true),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total Amount",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),

              Text("\$82.00",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600))
            ],
          )
        ],
      ),
    );
  }

  Widget PriceRow(String label, String value, { bool isSavings = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.w400,color: isSavings ? Colors.blue : Colors.black),
          ),
        ],
      ),
    );
  }
}
