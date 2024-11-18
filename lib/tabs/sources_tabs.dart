import 'package:flutter/material.dart';
import 'package:news_app/news/news_list.dart';
import 'package:news_app/tabs/tab_item.dart';

import '../models/source_response.dart';

class SourcesTabs extends StatefulWidget {
  const SourcesTabs({super.key, required this.sources});

  final List<Source> sources;

  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            tabAlignment: TabAlignment.start,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            onTap: (index) {
              selectedTabIndex = index;
              setState(() {});
            },
            isScrollable: true,
            tabs: widget.sources
                .map(
                  (source) => TabItem(
                    sourceName: source.name ?? '',
                    isSourceSelected:
                        selectedTabIndex == widget.sources.indexOf(source),
                  ),
                )
                .toList(),
          ),
        ),
        Expanded(
          child: NewsList(sourceId: widget.sources[selectedTabIndex].id!),
        ),
      ],
    );
  }
}
