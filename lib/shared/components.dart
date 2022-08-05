import '../shared/riverpod.dart';
import '../shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget calculatorButton({
  required String label,
  required Function() onClicked,
  required Function() onLongClicked,
  Color buttonColor = Colors.white,
  Color buttonShadowColor = Colors.white70,
  double buttonWidth = 75,
  double buttonHeight = 75,
}) => Expanded(
  child: Padding(
    padding: const EdgeInsets.all(5.0),
    child: ElevatedButton(
      onPressed: onClicked,
      onLongPress: onLongClicked,
      style: ElevatedButton.styleFrom(
        primary: Utils.isOperator(label)?Colors.white12:buttonColor,
        fixedSize: Size(buttonWidth,buttonHeight),
        shape: const CircleBorder(),
        shadowColor: Utils.isOperator(label)?Colors.black54:buttonShadowColor,
      ),
      child: label == '<'
          ? const Icon(Icons.backspace_outlined, color: Colors.black45, size: 28.0,)
          :
      Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 28.0,
          color: Utils.isOperator(label) || label == 'AC' ?Colors.orange:Colors.black45,
        ),
      ),
    ),
  ),
);

Widget build4ButtonRow(
    WidgetRef ref,
    String first,
    String second,
    String third,
    String fourth,
    ){
  final row = [first, second, third, fourth];

  return Expanded(
      child: Row(
        children: row.map(
                (text) => calculatorButton(
              label: text,
              onClicked: () => onClickedButton(ref,text),
              onLongClicked: () => onLongClickedButton(ref,text),
            )).toList(),
      )
  );
}

Widget build3ButtonRow(
    WidgetRef ref,
    String first,
    String second,
    String third,
    ){
  final row = [first, second];

  return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: row.map(
                      (text) => calculatorButton(
                    label: text,
                    onClicked: () => onClickedButton(ref,text),
                    onLongClicked: () => onLongClickedButton(ref,text),
                  )).toList(),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 5.0,
                bottom: 5.0,
                left: 5.0,
                right: 15.0,
              ),
              child: SizedBox(
                height: 75,
                child: ElevatedButton(
                  onPressed: () => onClickedButton(ref,third),
                  onLongPress: () => onLongClickedButton(ref,third),
                  style: ElevatedButton.styleFrom(
                    primary: Utils.isOperator(third)?Colors.white12:Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(120),
                    ),
                    shadowColor: Utils.isOperator(third)?Colors.black54:Colors.white70,
                  ),
                  child: Text(
                    third,
                    style: TextStyle(
                      color: Utils.isOperator(third) || third == 'AC' ?Colors.orange:Colors.black45,
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      )
  );
}

void onClickedButton(ref,String buttonText) {
  final calculator = ref.read(calculatorProvider.notifier);

  switch (buttonText) {
    case 'AC':
      calculator.reset();
      break;
    case '=':
      calculator.equals();
      break;
    case '<':
      calculator.delete();
      break;
    default:
      calculator.append(buttonText);
      break;
  }
}

void onLongClickedButton(ref,String text) {
  final calculator = ref.read(calculatorProvider.notifier);

  if (text == '<') {
    calculator.reset();
  }
}
