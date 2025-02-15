import 'package:flutter/material.dart';
import 'package:news_app/news/view/widgets/news_list.dart';
import 'package:news_app/sources/view/widgets/tab_item.dart';

import '../../data/models/source_response.dart';

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
              if (index == selectedTabIndex) return;
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
          child: NewsList(
              key: ValueKey(widget.sources[selectedTabIndex].id),
              sourceId: widget.sources[selectedTabIndex].id!),
        ),
      ],
    );
  }
}
