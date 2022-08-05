import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/calculator.dart';
import '../shared/components.dart';
import '../shared/riverpod.dart';

class CalculatorScreen extends ConsumerWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    Calculator calculatorState= ref.watch(calculatorProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 50.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      calculatorState.result,
                      style: const TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              )
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 50.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      calculatorState.equation,
                      style: const TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              )
          ),
          const SizedBox(
            height: 20.0,
          ),
          build4ButtonRow(ref, 'AC', '<', /*'%'*/'', '÷'),
          build4ButtonRow(ref, '7', '8', '9', '⨯'),
          build4ButtonRow(ref, '4', '5', '6', '-'),
          build4ButtonRow(ref, '1', '2', '3', '+'),
          build3ButtonRow(ref, '0', '.', '='),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}

// credits: https://github.com/JohannesMilke/calculator_riverpod_example
// calculator UI: https://dribbble.com/shots/8511065--dailyui-004-Calculator/attachments/797986?mode=media
// useful links:
// https://riverpod.dev/docs/getting_started/
// https://sanjibsinha.com/riverpod-state-notifier-provider/
