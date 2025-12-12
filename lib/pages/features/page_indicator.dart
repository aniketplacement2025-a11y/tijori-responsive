import 'package:flutter/material.dart';
import '../../utils/custom_colors.dart';

class PageIndicator extends StatefulWidget {
  final int currentPage;
  final int totalPages;
  final ValueChanged<int>? onPageChanged;

  const PageIndicator({
     super.key,
    required this.currentPage,
    required this.totalPages,
    this.onPageChanged,
  });

  @override
  _PageIndicatorState createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator>{
  @override
  Widget build(BuildContext context){
   return Container(
     height: 24,
     child: Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: List.generate(widget.totalPages, (index){
          return GestureDetector(
            onTap: () {
              if(widget.onPageChanged != null){
                widget.onPageChanged!(index);
              }
            },
            child: Container(
              width: index == widget.currentPage? 10: 8,
              height: index == widget.currentPage? 10: 8,
              margin: EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                color: index == widget.currentPage
                    ? CustomColors.darkPink // Active dot color
                    : CustomColors.ghostWhite, // Inactive dot color
                shape: BoxShape.circle,
              ),
            ),
          );
       }),
     ),
   );
  }
}