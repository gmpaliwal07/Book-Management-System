import 'package:bookmanagementsystem/utilities/dialogs/generic_dialog.dart';
import 'package:flutter/material.dart';

Future<bool> showDeleteDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: 'Delete',
    content: 'Are you sure you want to Delete?',
    optionsBuilder: () => {
      'No': false,
      'Yes': true,
    },
  ).then((value) => value ?? false);
}
