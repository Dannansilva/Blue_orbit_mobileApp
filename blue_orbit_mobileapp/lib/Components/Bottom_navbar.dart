import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final List<IconData> icons;
  final List<Function()> onPressed;
  final int currentIndex;

  const BottomNavBar({
    required this.icons,
    required this.onPressed,
    required this.currentIndex,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Container(
        height: 56,
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.8),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            icons.length,
            (index) => IconButton(
              onPressed: () => onPressed[index](),
              icon: Icon(
                icons[index],
                size: 30,
                color: currentIndex == index
                    ? Colors.deepPurpleAccent
                    : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
