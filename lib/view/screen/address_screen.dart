import 'package:flutter/material.dart';
import 'package:homedecor_shopping_app/constants/My_app_icon.dart';
import 'package:homedecor_shopping_app/view/screen/cart_screen.dart';
import 'package:homedecor_shopping_app/view/screen/payment_screen.dart';
import '../../widgets/backbutton.dart';
import '../../widgets/stepper_widget.dart';

class AddressScreen extends StatefulWidget {
  final String? userName;
  const AddressScreen({super.key, this.userName});

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  int? selectedAddressIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          child: BackbuttonWidget(),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) {
                      return CartScreen(userName: widget.userName);
                    }));
          },
        ),
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
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFA68B5B),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                minimumSize: Size(double.infinity, 45),
              ),
              child: Text(
                '+ Add New Address',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Select Delivery Address",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedAddressIndex = 0;
                });
              },
              child: AddressCard(
                icon: MyAppIcon.home,
                title: "Home",
                name: widget.userName ?? 'Guest',
                address:
                "Floral House, 123 NW Bobcat Lane\nSt. Robert, MO 645637",
                mobile: "9876543890",
                isSelected: selectedAddressIndex == 0,
              ),
            ),
            SizedBox(height: 5),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedAddressIndex = 1;
                });
              },
              child: AddressCard(
                icon: MyAppIcon.work,
                title: "Work",
                name: widget.userName ?? 'Guest',
                address:
                "TechInnovation, 45 NW Bobcat Lane\nSt. Georgia, MO 645637",
                mobile: "9876543890",
                isSelected: selectedAddressIndex == 1,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: selectedAddressIndex != null
                  ? () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) {
                          return PaymentScreen(userName: widget.userName);
                        }));
              }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedAddressIndex != null
                    ? Color(0xFFA68B5B)
                    : Colors.grey,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                minimumSize: Size(double.infinity, 45),
              ),
              child: Text(
                "Continue",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
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
    required bool isSelected,
  }) {
    return Card(
      color: isSelected ? Color(0xFFE6D5B8) : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: isSelected
            ? BorderSide(color: Color(0xFFA68B5B), width: 2)
            : BorderSide.none,
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12, top: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(icon, color: Colors.black, size: 28),
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
                        color: Color.fromRGBO(144, 57, 19, 1),
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                ),
              ],
            ),
            Text(
              name,
              style:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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