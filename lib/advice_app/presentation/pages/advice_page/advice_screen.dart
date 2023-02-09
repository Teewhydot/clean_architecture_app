import 'package:clean_architecture_app/advice_app/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class AdviceScreen extends StatelessWidget {
  const AdviceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Advice Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const Expanded(
                flex: 9, child: Center(child: Text("Your advice is here"))),
            const SizedBox(
              height: 15,
            ),
            Expanded(
                flex: 1,
                child: CustomButton(
                  onTapped: () {},
                )),
          ],
        ),
      ),
    );
  }
}
