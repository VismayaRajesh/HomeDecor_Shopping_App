import 'package:flutter/material.dart';
import 'package:homedecor_shopping_app/constants/My_app_icon.dart';
import 'package:homedecor_shopping_app/constants/my_app_constants.dart';
import 'package:homedecor_shopping_app/view/screen/cart_screen.dart';
import 'package:homedecor_shopping_app/view/screen/payment_screen.dart';
import '../../widgets/backbutton.dart';
import '../../widgets/stepper_widget.dart';

class AddressScreen extends StatelessWidget {
  final String? userName;
  const AddressScreen({super.key, this.userName});

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
              return CartScreen(userName: userName);
            }));
          },),
        centerTitle: true,
        title: const Text(
          "Address",
          style: TextStyle(
            color: Colors.black,
            fontSize: 19,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StepperWidget(currentStep: 1),
            const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFA68B5B), // Brownish color
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              minimumSize: Size(double.infinity, 45),
            ),
            child: Text('+ Add New Address',style: TextStyle(fontWeight: FontWeight.w500),),
          ),

            const SizedBox(height: 20),
            const Text(
              "Select Delivery Address",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),

            AddressCard(
              icon: MyAppIcon.home,
              title: "Home",
              name: userName ?? 'Guest',
              address:
                  "Floral House, 123 NW Bobcat Lane\nSt. Robert, MO 645637",
              mobile: "9876543890",
            ),
            SizedBox(height: 5,),
            AddressCard(
              icon: MyAppIcon.work,
              title: "Work",
              name: userName ?? 'Guest',
              address:
                  "TechInnovation, 45 NW Bobcat Lane\nSt. Georgia, MO 645637",
              mobile: "9876543890",
            ),

            const Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                return PaymentScreen(userName: userName);
              }));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFA68B5B), // Brownish color
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              minimumSize: Size(double.infinity, 45),
            ),
            child: Text("Continue",style: TextStyle(fontWeight: FontWeight.w500),),
          ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget AddressCard({
    required IconData icon,
    required String title,
    required String name,
    required String address,
    required String mobile,
  }) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.only(left: 12,right: 12,bottom: 12,top: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(icon, color: Colors.black,size: 28,),
                    const SizedBox(width: 4),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Edit",
                    style: TextStyle(
                        color: Color.fromRGBO(144, 57, 19, 1), fontWeight: FontWeight.w700,fontSize: 16),
                  ),
                ),
              ],
            ),
            Text(
              name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(address,
                style: const TextStyle(fontSize: 14, color: Colors.black)),
            const SizedBox(height: 5),
            Text(
              "Mobile : $mobile",
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
