import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class BottomSide extends StatelessWidget {
  const BottomSide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: DottedBorder(
        color: Colors.grey,
        strokeCap: StrokeCap.round,
        strokeWidth: 2,
        dashPattern: const [10, 15],
        borderType: BorderType.RRect,
        radius: const Radius.circular(12),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'text : ',
                  style: TextStyle(fontSize: 30),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const SizedBox(
                    height: 50,
                    child: Center(
                      child: Text(
                        'PROCEED TO CHECKOUT',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
