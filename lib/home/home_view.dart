import 'package:blooddonation/home/get_inspired.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Entrance page, also functioning as the home page.
class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;

    return const GetInspired();
  }
}
