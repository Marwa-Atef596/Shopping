import 'package:flutter/material.dart';

import '../../../../core/utils/text_utils.dart';

class CustomBottomContainer extends StatelessWidget {
  const CustomBottomContainer({super.key, required this.text, this.onPressed, required this.text2});
  final String text;
 final String text2;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .12,
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
              text: text,
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.normal),
          TextButton(
              onPressed: () {},
              child: TextUtils(
                text: text2,
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
              ))
        ],
      ),
    );
  }
}
