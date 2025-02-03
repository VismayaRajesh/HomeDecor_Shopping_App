import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:homedecor_shopping_app/view/screen/address_screen.dart';
import '../../widgets/backbutton.dart';
import '../../widgets/furniture/paymentmethod_widget.dart';
import '../../widgets/stepper_widget.dart';
import '../view_model/paymet_bloc/payment_bloc.dart';

class PaymentScreen extends StatelessWidget {
  final String? userName;
  const PaymentScreen({super.key, this.userName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: InkWell(
            child: BackbuttonWidget(),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddressScreen(userName: userName)),
              );
            },
          ),
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
        body: BlocListener<PaymentBloc, PaymentState>(
          listener: (context, state) {
            if (state is PaymentSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Payment Successful: ${state.response.paymentId}")),
              );
            } else if (state is PaymentFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Payment Failed: ${state.error}")),
              );
            }
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StepperWidget(currentStep: 2),
                const SizedBox(height: 24),
                _buildPaymentMethods(),
                const SizedBox(height: 15),
                _buildGiftCardSection(),
                const SizedBox(height: 16),
                PriceDetails(),
                const SizedBox(height: 25),
                BlocBuilder<PaymentBloc, PaymentState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(153, 133, 88, 1),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      onPressed: () {
                        BlocProvider.of<PaymentBloc>(context).add(
                          StartPayment(
                            amount: 8200,
                            name: "Home Decor Purchase",
                            description: "Order Payment",
                            contact: "9876543210",
                            email: "test@example.com",
                          ),
                        );
                      },
                      child: state is PaymentLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : const Text("Pay Now", style: TextStyle(fontSize: 19, color: Colors.white)),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethods() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 16.0, bottom: 16, right: 90),
            child: Text("Select Your Payment Method", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ),
          Divider(height: 1, color: Colors.black),
          PaymentmethodWidget(title: "Cash on delivery (cash/UPI)", icon: Icons.account_balance_wallet_outlined, isRadio: true),
          Divider(height: 1, color: Colors.black26),
          PaymentmethodWidget(title: "PhonePe/Google Pay/UPI", icon: Icons.account_balance_wallet_outlined, isRadio: true,),
          Divider(height: 1, color: Colors.black26),
          PaymentmethodWidget(title: "Credit/Debit card", icon: Icons.credit_card),
          Divider(height: 1, color: Colors.black26),
          PaymentmethodWidget(title: "Wallets", icon: Icons.account_balance_wallet),
          Divider(height: 1, color: Colors.black26),
          PaymentmethodWidget(title: "Net Banking", icon: Icons.account_balance),
        ],
      ),
    );
  }

  Widget _buildGiftCardSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 3, offset: Offset(0, 0)),
        ],
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
          const Text("Apply", style: TextStyle(color: Color.fromRGBO(144, 57, 19, 1), fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget PriceDetails() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 3, offset: Offset(0, 0)),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(12),
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
            children: const [
              Text("Total Amount", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              Text("\$82.00", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }

  Widget PriceRow(String label, String value, {bool isSavings = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.w400, color: isSavings ? Colors.blue : Colors.black),
          ),
        ],
      ),
    );
  }
}
