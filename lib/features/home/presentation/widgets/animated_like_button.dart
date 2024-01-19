import 'package:flutter/material.dart';
import 'package:reddit_task/core/utility/assets.dart';
import 'package:reddit_task/core/utility/pallete.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:svg_flutter/svg.dart';

class AnimatedLikeButton extends StatefulWidget {
  final double iconSize;
  final bool? isLiked;

  final Function onPressed;
  const AnimatedLikeButton(
      {super.key,
      required this.onPressed,
      required this.iconSize,
      required this.isLiked});

  @override
  State<AnimatedLikeButton> createState() => _AnimatedLikeButtonState();
}

class _AnimatedLikeButtonState extends State<AnimatedLikeButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _movingAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));

    _movingAnimation = Tween<double>(begin: 0.sw, end: 2.2.sw).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));

    _movingAnimation.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.iconSize + (2.2.sw * 2),
      child: Padding(
        padding: EdgeInsets.only(bottom: _movingAnimation.value),
        child: Align(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              widget.onPressed();
              _controller.forward();
              Future.delayed(const Duration(milliseconds: 250), () {
                _controller.reverse();
              });
            },
            child: SvgPicture.asset(
              widget.isLiked != null && widget.isLiked!
                  ? Assets.arrow_up_solid
                  : Assets.arrow_up,
              height: widget.iconSize,
              colorFilter: ColorFilter.mode(
                  widget.isLiked != null && widget.isLiked!
                      ? Pallete.redColor
                      : Pallete.whiteColor,
                  BlendMode.srcATop),
            ),
          ),
        ),
      ),
    );
  }
}
