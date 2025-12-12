import 'package:flutter/material.dart';

class LogoContainer extends StatelessWidget {
  final double? width; // width of logo
  final double? height; // height of logo
  final String logoAsset;

 const LogoContainer({
    super.key,
   required this.width,
   required this.height,
   required this.logoAsset,
 });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: width,
      height: height,
      // If you have the actual image asset:
      child: Image.asset(
        logoAsset, // Replace with your actual image path
        fit: BoxFit.contain,
      ),
      // OR if you need to create it as a custom widget:
      // child: CustomTijoriIcon(),
    );
  }
}