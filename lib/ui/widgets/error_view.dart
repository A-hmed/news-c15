import 'package:flutter/material.dart';
import 'package:news_c15/ui/utils/extensions.dart';

class ErrorView extends StatelessWidget {
  final String message;

  const ErrorView({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(message,style: context.textTheme.titleSmall,),
        ElevatedButton(onPressed: () {}, child: Text("Retry"))
      ],
    );
  }
}
