import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.35;
    return Container(
      color: Colors.transparent,
      child: const Center(
        child: SpinKitCircle(
          color: Colors.black26,
          size: 150,
        ),
      ),
    );
  }
}