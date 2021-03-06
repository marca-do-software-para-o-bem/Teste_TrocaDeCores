import 'package:flutter/material.dart';
import 'package:teste_app/shapesClasses.dart';

class SpBIcons {
  Square square = new Square();
  SquareRounded squareRounded = new SquareRounded();
  Circle circle = new Circle();
  int x;
  Widget spbIconsRow(int valid, int validXPosition, int validYPosition,
      int zIndex, int validZPosition) {
    if (validZPosition == 1) {
      x = random.nextInt(3);
      zIndex = x;
    } else if (validZPosition == 0) {
      zIndex = 0;
    } else if (zIndex == 3) {
      zIndex = x;
    }
    if (zIndex == 0) {
      return Stack(
        children: [
          Container(
            color: Colors.white,
            width: 300,
            height: 80,
          ),
          square.generateSquare(valid, validXPosition, validYPosition),
          squareRounded.generateSquareRounded(
              valid, validXPosition, validYPosition),
          circle.generateCircle(valid, validXPosition, validYPosition)
        ],
      );
    } else if (zIndex == 1) {
      return Stack(
        children: [
          Container(
            color: Colors.white,
            width: 300,
            height: 80,
          ),
          square.generateSquare(valid, validXPosition, validYPosition),
          circle.generateCircle(valid, validXPosition, validYPosition),
          squareRounded.generateSquareRounded(
              valid, validXPosition, validYPosition),
        ],
      );
    } else if (zIndex == 2) {
      return Stack(
        children: [
          Container(
            color: Colors.white,
            width: 300,
            height: 80,
          ),
          squareRounded.generateSquareRounded(
              valid, validXPosition, validYPosition),
          circle.generateCircle(valid, validXPosition, validYPosition),
          square.generateSquare(valid, validXPosition, validYPosition),
        ],
      );
    }
  }
}
