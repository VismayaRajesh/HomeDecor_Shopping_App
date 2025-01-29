import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 134,
      width: 500,
      decoration: BoxDecoration(
          color: Color(0xFFF4F4F4),
          border: Border.all(
              color: Colors.grey,width: 2
          )
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(153, 133, 88, 1),
                    ),
                    child: Icon(Icons.local_shipping_outlined, color: Colors.white,size: 35,),
                  ),
                ),
                SizedBox(height: 6,),
                Padding(
                  padding: const EdgeInsets.only(left: 22.0),
                  child: Text('Free Delivery'),
                ),
              ],
            ),
            SizedBox(width: 41),
            Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(153, 133, 88, 1),
                  ),
                  child: Icon(Icons.refresh_outlined, color: Colors.white,size: 35,),
                ),
                SizedBox(height: 6,),
                Text('    15 Days\nReplacement'),
              ],
            ),
            SizedBox(width: 42),
            Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(153, 133, 88, 1),
                  ),
                  child: Icon(Icons.security, color: Colors.white,size: 35,),
                ),
                SizedBox(height: 6,),
                Text('  1 Year\nWarranty'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
