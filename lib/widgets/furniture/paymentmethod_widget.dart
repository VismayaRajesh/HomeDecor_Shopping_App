import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentmethodWidget extends StatefulWidget {
  final IconData icon;
  final String title;
  final bool isRadio;
  const PaymentmethodWidget({
    super.key,
    required this.icon,
    required this.title,
    this.isRadio = false,
  });

  @override
  _PaymentmethodWidgetState createState() => _PaymentmethodWidgetState();
}

class _PaymentmethodWidgetState extends State<PaymentmethodWidget> {
  bool isSelected = false; // Track the radio button's state

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      leading: Container(
        height: 34,
        width: 38,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(widget.icon, color: Colors.black),
      ),
      title: Text(
        widget.title,
        style: TextStyle(fontSize: 15),
      ),
      trailing: widget.isRadio
          ? GestureDetector(
        onTap: () {
          setState(() {
            isSelected = !isSelected; // Toggle the radio button state
          });
        },
        child: Icon(
          isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
          color: isSelected ? Colors.green : Colors.black,
        ),
      )
          : Icon(
        Icons.expand_more,
        color: Color.fromRGBO(144, 57, 19, 1),
      ),
    );
  }
}
