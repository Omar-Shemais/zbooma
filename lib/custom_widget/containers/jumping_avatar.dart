import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zbooma/style/size.dart';

class JumpingAvatar extends StatefulWidget {
  const JumpingAvatar({super.key});

  @override
  State<JumpingAvatar> createState() => _JumpingAvatarState();
}

class _JumpingAvatarState extends State<JumpingAvatar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);

    _offsetAnimation = Tween<Offset>(
      begin: Offset(0, 0), // Start at normal position
      end: Offset(0, -0.09), // Move slightly up
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut, // Smooth bounce
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        margin: EdgeInsets.only(top: 10.h),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.green, width: 2),
        ),
        child: CircleAvatar(
          radius: 28.r,
          backgroundImage: AssetImage('assets/datai.png'),
        ),
      ),
    );
  }
}

class JumpingBird extends StatefulWidget {
  const JumpingBird({super.key});

  @override
  _JumpingBirdState createState() => _JumpingBirdState();
}

class _JumpingBirdState extends State<JumpingBird>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);

    _offsetAnimation = Tween<Offset>(
      begin: Offset(0, 0), // Start at normal position
      end: Offset(0, -0.09), // Move slightly up
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut, // Smooth bounce
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Image.asset(
        'assets/Component.png',
        width: width(context, .40).w,
        height: height(context, .20).h,
      ),
    );
  }
}
