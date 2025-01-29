import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StepperWidget extends StatelessWidget {
  final int currentStep;

  const StepperWidget({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        line(),
        stepItem("Cart", 0),
        SizedBox(width: 4,),
        line(),
        stepItem("Address", 1),
        SizedBox(width: 4,),
        line(),
        stepItem("Payment", 2),
      ],
    );
  }

  Widget stepItem(String title, int stepIndex) {
    bool isActive = stepIndex == currentStep;
    bool isCompleted = stepIndex < currentStep;

    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? Colors.green : (isCompleted ? Colors.green : Colors.grey[300]),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          title,
          style: TextStyle(color: isActive ? Colors.black : isCompleted ? Colors.green : Colors.grey, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget line() {
    return Container(
      width: 45,
      height: 2,
      color: Colors.grey,
    );
  }
}