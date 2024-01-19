import 'package:flutter/material.dart';
import 'package:reddit_task/core/utility/assets.dart';
import 'package:reddit_task/core/utility/pallete.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:svg_flutter/svg.dart';

class AnimatedDisLikeButton extends StatefulWidget {
  final Function onPressed;
  final double iconSize;
  final bool? isDisLiked;

  const AnimatedDisLikeButton(
      {super.key,
      required this.onPressed,
      required this.iconSize,
      required this.isDisLiked});

  @override
  State<AnimatedDisLikeButton> createState() => _AnimatedDisLikeButtonState();
}

class _AnimatedDisLikeButtonState extends State<AnimatedDisLikeButton>
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
        padding: EdgeInsets.only(top: _movingAnimation.value),
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
              widget.isDisLiked != null && widget.isDisLiked!
                  ? Assets.arrow_down_solid
                  : Assets.arrow_down,
              height: widget.iconSize,
              colorFilter: ColorFilter.mode(
                  widget.isDisLiked != null && widget.isDisLiked!
                      ? Pallete.blueColor
                      : Pallete.whiteColor,
                  BlendMode.srcATop),
            ),
          ),
        ),
      ),
    );
  }
}
