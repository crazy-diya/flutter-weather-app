
import 'package:flutter/material.dart';

class CurrentWeatherDataUnit extends StatelessWidget {
  const CurrentWeatherDataUnit({
    Key? key,
    required this.height, required this.name, required this.value,
  }) : super(key: key);

  final double height;
  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: (height * 0.02),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.cloud),
          const SizedBox(
            width: 14,
          ),
          Column(
            children:  [
              Text(name),
              const SizedBox(
                height: 8,
              ),
              Text(value),
            ],
          ),
        ],
      ),
    );
  }
}

