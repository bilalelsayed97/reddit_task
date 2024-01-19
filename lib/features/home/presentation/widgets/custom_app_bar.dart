import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reddit_task/core/utility/assets.dart';
import 'package:reddit_task/core/utility/pallete.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:svg_flutter/svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Pallete.blackColor,
      leading: Icon(
        Icons.arrow_back,
        color: Pallete.whiteColor,
        size: 7.sw,
      ),
      title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const CircleAvatar(
          radius: 8,
          backgroundImage: AssetImage(Assets.piper),
        ),
        Gap(2.sw),
        Text.rich(TextSpan(
            text: 'r/',
            style: GoogleFonts.notoSans(
              fontSize: 4.sw,
              color: Pallete.whiteColor,
            ),
            children: [
              TextSpan(
                text: 'Piper',
                style: GoogleFonts.notoSans(
                    fontSize: 4.sw,
                    color: Pallete.whiteColor,
                    fontWeight: FontWeight.w600),
              ),
            ])),
      ]),
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 4.sw),
          child: SvgPicture.asset(
            Assets.ellipsis,
            width: 5.sw,
            colorFilter:
                const ColorFilter.mode(Pallete.whiteColor, BlendMode.srcATop),
          ),
        )
      ],
    );
  }
}
