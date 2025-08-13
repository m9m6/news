import 'package:flutter/material.dart';
import 'package:news/model/SourceResponse.dart';

class SourceName extends StatelessWidget {
  bool isSelected;
  Source sources;

  SourceName({super.key, required this.sources, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Text(sources.name ?? '',
        style: isSelected
            ? Theme.of(context).textTheme.labelLarge
            : Theme.of(context).textTheme.labelMedium);
  }
}
