import 'package:flutter/material.dart';

class UserMarker extends StatefulWidget {
const UserMarker({ Key? key }) : super(key: key);

  @override
  State<UserMarker> createState() => _UserMarkerState();
}

class _UserMarkerState extends State<UserMarker> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> sizeAnimation;
  @override
  void initState(){
    animationController = AnimationController(vsync: this,duration: const Duration(seconds: 1));
    sizeAnimation = Tween<double>(begin: 40, end: 50).animate(CurvedAnimation(parent: animationController, curve: Curves.decelerate));
    animationController.repeat(reverse:true);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Center(
      child: AnimatedBuilder(
        animation: sizeAnimation,
        builder: (context,widget) {
          return Container(
            width: sizeAnimation.value,
            height: sizeAnimation.value,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle
            ),
            child: widget
          );
        },
        child: const Icon(
              Icons.person_pin,
              color: Colors.white,
              size: 35
              ),
      ),
    );
  }
}