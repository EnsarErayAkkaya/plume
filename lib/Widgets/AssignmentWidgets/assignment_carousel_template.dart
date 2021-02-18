import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:plume/Models/assignment.dart';
import 'file:///C:/Eray/Flutter/plume/lib/Widgets/AssignmentWidgets/assignment_carousel_item_template.dart';

class AssignmentCarouselTemplate extends StatelessWidget {
  final List<Assignment> assignments;

  const AssignmentCarouselTemplate({Key key, this.assignments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CarouselSlider(
      options: CarouselOptions(
        height: size.height * 0.35,
        autoPlay: false,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        aspectRatio: 2.0,
        initialPage: 2,
      ),
      items: assignments.map((e) => AssignmentCarouselItemTemplate(assignment: e,)).toList(),
    );
  }
}
