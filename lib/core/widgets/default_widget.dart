import 'package:flutter/material.dart';

class DefaultWidget extends StatelessWidget {
  final String text;
  const DefaultWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(letterSpacing: 2, color: Colors.deepOrange),
        ),
        SizedBox(height: 20),
        Navigator.canPop(context)
            ? ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Back"),
              )
            : SizedBox(),
      ],
    );
  }
}
