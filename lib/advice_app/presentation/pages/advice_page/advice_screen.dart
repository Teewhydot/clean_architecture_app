import 'package:clean_architecture_app/advice_app/presentation/bloc/advice_bloc.dart';
import 'package:clean_architecture_app/advice_app/presentation/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdvicerPageWrapperProvider extends StatelessWidget {
  const AdvicerPageWrapperProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AdviceBloc(), child: const AdviceScreen());
  }
}

class AdviceScreen extends StatelessWidget {
  const AdviceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blocProvider = BlocProvider.of<AdviceBloc>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Advice Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocBuilder<AdviceBloc, AdviceState>(
          builder: (context, state) {
            if (state is AdviceStateLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AdviceStateLoaded) {
              return Expanded(
                flex: 9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        state.advice.advice,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'This advice will be removed after 3 seconds',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              );
            } else if (state is AdviceStateError) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: const TextStyle(
                      color: Colors.redAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              );
            } else if (state is AdviceStateInitial) {
              return Column(
                children: [
                  const Expanded(
                      flex: 9,
                      child: Center(
                        child: Text(
                          'Your advice is waiting',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Center(
                        child: CustomButton(
                          onTapped: () => blocProvider.add(AdviceRequested()),
                        ),
                      )),
                ],
              );
            } else {
              return const Expanded(flex: 9, child: SizedBox());
            }
          },
        ),
      ),
    );
  }
}
