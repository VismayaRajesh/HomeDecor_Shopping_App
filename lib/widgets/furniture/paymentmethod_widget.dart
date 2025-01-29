import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentmethodWidget extends StatelessWidget {
  final IconData icon;
  final Color iconcolor;
  final String title;
  final bool isRadio;
  const PaymentmethodWidget({super.key, required this.icon, required this.iconcolor, required this.title, this.isRadio = false});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12,vertical: 3),
      leading: Container(
          height: 34,
          width: 38,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8)
          ),
          child: Icon(icon, color: iconcolor)),
      title: Text(title,style: TextStyle(fontSize: 15),),
      trailing: isRadio ? Icon(Icons.radio_button_off,color: Colors.black,) : Icon(Icons.expand_more,color: Color.fromRGBO(144, 57, 19, 1),),
    );
  }
}
