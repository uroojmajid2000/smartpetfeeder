
import 'package:flutter/material.dart';

class scheduledDone extends StatelessWidget {
  final String work;
  final Color colorLine;
  const scheduledDone({
    super.key,
    required this.work,
    required this.colorLine,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff7588FA),
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                height: 50,
                width: 3,
                color: colorLine,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  // 'Drop Food',
                  work,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  ' 28 Oct - 08:00 PM',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
