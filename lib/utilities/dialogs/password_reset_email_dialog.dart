import 'package:bookmanagementsystem/utilities/dialogs/generic_dialog.dart';
import 'package:flutter/material.dart';

Future<void> showPasswordResetSentDialog(BuildContext context) {
  return showGenericDialog<void>(
    context: context,
    title: 'Password Reset',
    content: 'We have sent Password Reset Link on your email.',
    optionsBuilder: () => {'OK': null},
  );
}
