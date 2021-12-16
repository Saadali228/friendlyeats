import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:friendlyeats/bloc/Review/bloc/review_bloc.dart';
import 'package:friendlyeats/data_layer/models/reviews.dart';
import 'package:provider/src/provider.dart';

class ReviewCreateDialog extends StatefulWidget {
  const ReviewCreateDialog({
    Key? key,
    required this.onSave,
  }) : super(key: key);
  final Function(int, String, int) onSave;
  @override
  _ReviewCreateDialogState createState() => _ReviewCreateDialogState();
}

class _ReviewCreateDialogState extends State<ReviewCreateDialog> {
  late String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add a Review'),
      content: SizedBox(
        width: math.min(MediaQuery.of(context).size.width, 740),
        height: math.min(MediaQuery.of(context).size.height, 180),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: TextField(
                decoration: const InputDecoration.collapsed(
                    hintText: 'Type your review here.'),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                onChanged: (value) {
                  if (mounted) {
                    setState(() {
                      message = value;
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('CANCEL'),
          onPressed: () => Navigator.pop(context, null),
        ),
        ElevatedButton(
          child: const Text('SAVE'),
          onPressed: () => widget.onSave(1, message, 3),
        ),
      ],
    );
  }
}
