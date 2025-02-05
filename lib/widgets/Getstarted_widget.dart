import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetstartedWidget extends StatelessWidget {
  final String name;
  final VoidCallback? onPressed;
  const GetstartedWidget({super.key, required this.name, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 40,
      child: ElevatedButton(onPressed: onPressed, child: Text(name, style: TextStyle(color: Colors.white),),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(153, 133, 88, 1),
        ),
      ),
    );
  }
}
