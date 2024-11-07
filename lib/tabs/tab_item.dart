import 'package:flutter/material.dart';

import '../utils/app_theme.dart';

class TabItem extends StatelessWidget {
  const TabItem(
      {super.key, required this.sourceName, required this.isSourceSelected});

  final String sourceName;
  final bool isSourceSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: isSourceSelected ? AppTheme.primaryColor : AppTheme.white,
        border: Border.all(color: AppTheme.primaryColor, width: 2),
      ),
      child: Text(
        sourceName,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: isSourceSelected ? AppTheme.white : AppTheme.primaryColor,
              fontSize: 14,
            ),
      ),
    );
  }
}
