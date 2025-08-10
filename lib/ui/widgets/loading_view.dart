import 'package:flutter/material.dart';
import 'package:news_c15/ui/utils/extensions.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: context.secondary,),
    );
  }
}
