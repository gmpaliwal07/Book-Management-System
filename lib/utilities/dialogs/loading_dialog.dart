import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

typedef CloseDialog = void Function();
CloseDialog showLoadingDialog({
  required BuildContext context,
  required String text,
  double width = 300, // Set the desired width
  double height = 300, // Set the desired height
}) {
  final dialog = AlertDialog(
    content: SizedBox(
      width: width,
      height: height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset('assets/animations/loading.json'),
          const SizedBox(
            height: 50,
            width: 50,
          ),
          Text(text,
              style: GoogleFonts.robotoMono(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff4B6CD0))),
        ],
      ),
    ),
  );

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => dialog,
  );

  return () => Navigator.of(context).pop();
}
