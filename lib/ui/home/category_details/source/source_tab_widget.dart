import 'package:flutter/material.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/ui/home/category_details/source/news/news_widget.dart';
import 'package:news/ui/home/category_details/source/source_name.dart';
import 'package:news/utils/app_colors.dart';

class SourceTabWidget extends StatefulWidget {
  List<Source> sourcesList;

  SourceTabWidget({super.key, required this.sourcesList});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        children: [
          TabBar(
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              isScrollable: true,
              indicatorColor: Theme.of(context).indicatorColor,
              dividerColor: AppColors.noColor,
              tabAlignment: TabAlignment.start,
              tabs: widget.sourcesList.map(
                (sources) {
                  return SourceName(
                    sources: sources,
                    isSelected:
                        selectedIndex == widget.sourcesList.indexOf(sources),
                  );
                },
              ).toList()),
          Expanded(
              child: NewsWidget(source: widget.sourcesList[selectedIndex]))
        ],
      ),
    );
  }
}
