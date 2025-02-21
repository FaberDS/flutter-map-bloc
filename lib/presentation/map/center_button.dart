import 'package:flutter/material.dart';

class CenterButton extends StatelessWidget {
  final Function onPressed;
  const CenterButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            return Colors.black;
          },
        ),
      ),
      onPressed: () {
        debugPrint("Center button Pressed!");

        onPressed();
      },
      child: const Text("Center"),
    );
  }
}