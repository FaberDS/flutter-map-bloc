import 'package:flutter/material.dart';

class UserMarker extends StatelessWidget {
const UserMarker({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle
        ),
        child:Icon(
          Icons.person_pin,
          color: Colors.white,
          size: 35
          )
      ),
    );
  }
}