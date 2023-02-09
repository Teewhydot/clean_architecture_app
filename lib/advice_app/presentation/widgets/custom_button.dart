import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onTapped;
  const CustomButton({super.key, required this.onTapped});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        width: 200,
        child: ElevatedButton(
          onPressed: () {},
          onHover: (bool value) {},
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.grey,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          child: const Text('Get advice'),
        ),
      ),
    );
  }
}
