import 'package:flutter/material.dart';

class GridViewItem extends StatelessWidget {
  final Color color;
  final String labe;
  final void Function()? onpressed;
  final IconData iconData;

  const GridViewItem(
      {required this.color,
      required this.iconData,
      required this.labe,
      required this.onpressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: color.withOpacity(.3),
              child: Icon(
                iconData,
                color: color,
                size: 40,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              labe,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            )
          ],
        ),
      ),
    );
  }
}
