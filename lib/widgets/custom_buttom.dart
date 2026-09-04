import 'package:flutter/material.dart';
import 'package:notes_app/widgets/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 55,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(
          name,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
