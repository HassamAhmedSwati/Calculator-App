import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String tital;
  final Color color;
  final VoidCallback onpress;
   MyButton({Key? key, required this.tital, this.color= const Color(0xff5A5A5A),required this.onpress}):super(key: key);


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: InkWell(
          onTap: onpress,
          child: Container(
            height: 60,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              color: color,
            ),
            child: Center(
                child: Text(tital,style: TextStyle(fontSize: 20,color: Colors.white),)),
          ),
        ),
      ),
    );
  }
}