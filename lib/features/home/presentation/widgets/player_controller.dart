import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:reddit_task/core/utility/assets.dart';
import 'package:reddit_task/core/utility/pallete.dart';
import 'package:reddit_task/features/home/application/cubit/home_cubit.dart';
import 'package:reddit_task/features/home/presentation/widgets/animated_dislike_button.dart';
import 'package:reddit_task/features/home/presentation/widgets/animated_like_button.dart';
import 'package:reddit_task/features/home/presentation/widgets/comments_button.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:svg_flutter/svg.dart';
import 'package:video_player/video_player.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayerController extends StatelessWidget {
  const PlayerController({
    super.key,
    required this.controller,
  });

  final VideoPlayerController? controller;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return SizedBox(
      width: 100.sw,
      child: Padding(
        padding: EdgeInsets.only(bottom: 4.sw, right: 4.sw, left: 4.sw),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage(Assets.piper),
                        ),
                        Gap(2.sw),
                        Text(
                          'Piper',
                          style: GoogleFonts.notoSans(
                            color: Pallete.whiteColor,
                            fontSize: 4.sw,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                    Gap(4.sw),
                    Container(
                      constraints:
                          BoxConstraints(maxWidth: 80.sw, maxHeight: 30.sw),
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        'A hungry sandpiper hatchling ventures from her nest for the first time to dig for food by the shoreline. The problem is, the food is buried in the sand where scary waves roll up.',
                        style: GoogleFonts.notoSans(
                          color: Pallete.whiteColor,
                          fontSize: 4.sw,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 6.5.sw,
                  child: Column(
                    children: [
                      AnimatedLikeButton(
                          iconSize: 5.5.sw,
                          isLiked: cubit.isLiked,
                          onPressed: () {
                            cubit.like();
                          }),
                      Gap(2.sw),
                      Text(
                        cubit.numLikes.toString(),
                        style: GoogleFonts.notoSans(
                            color: cubit.isLiked != null && cubit.isLiked!
                                ? Pallete.redColor
                                : cubit.isDisLiked != null && cubit.isDisLiked!
                                    ? Pallete.blueColor
                                    : Pallete.whiteColor,
                            fontSize: 4.sw,
                            fontWeight: FontWeight.w700),
                      ),
                      Gap(2.sw),
                      AnimatedDisLikeButton(
                          iconSize: 5.5.sw,
                          isDisLiked: cubit.isDisLiked,
                          onPressed: () {
                            cubit.disLike();
                          }),
                      Gap(3.sw),
                      const CommentsButton(),
                      Gap(2.sw),
                      Text(
                        cubit.numComments.toString(),
                        style: GoogleFonts.notoSans(
                            color: Pallete.whiteColor,
                            fontSize: 4.sw,
                            fontWeight: FontWeight.w700),
                      ),
                      Gap(8.sw),
                      SvgPicture.asset(
                        Assets.share,
                        height: 5.5.sw,
                        colorFilter: const ColorFilter.mode(
                            Pallete.whiteColor, BlendMode.srcATop),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 7.sw,
                  child: GestureDetector(
                    onTap: () {
                      BlocProvider.of<HomeCubit>(context)
                              .controller!
                              .value
                              .isPlaying
                          ? BlocProvider.of<HomeCubit>(context)
                              .controller!
                              .pause()
                          : BlocProvider.of<HomeCubit>(context)
                              .controller!
                              .play();

                      cubit.updateState();
                    },
                    child: BlocProvider.of<HomeCubit>(context)
                            .controller!
                            .value
                            .isPlaying
                        ? Icon(
                            Icons.pause,
                            size: 10.sw,
                            color: Pallete.whiteColor,
                          )
                        : Icon(
                            Icons.play_arrow,
                            size: 10.sw,
                            color: Pallete.whiteColor,
                          ),
                  ),
                ),
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    SizedBox(
                      width: 53.sw,
                      child: SizedBox(
                        height: 3.5,
                        child: VideoProgressIndicator(
                            BlocProvider.of<HomeCubit>(context).controller!,
                            padding: EdgeInsets.zero,
                            colors: const VideoProgressColors(
                                backgroundColor: Pallete.greyPlayerColor,
                                bufferedColor: Pallete.greyPlayerColor,
                                playedColor: Pallete.whiteColor),
                            allowScrubbing: true),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: ((controller!.value.position.inSeconds /
                                        controller!.value.duration.inSeconds *
                                        53.sw) -
                                    2.sw) >
                                0
                            ? ((controller!.value.position.inSeconds /
                                        controller!.value.duration.inSeconds *
                                        53.sw) -
                                    2.sw)
                                .abs()
                            : 0,
                      ),
                      child: Icon(
                        Icons.circle,
                        color: Pallete.whiteColor,
                        size: 4.sw,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10.sw,
                  child: Text(
                    "${(controller?.value.position.inMinutes.remainder(60).abs().toString().padLeft(2, "0"))}:${(controller?.value.position.inSeconds.remainder(60).abs().toString().padLeft(2, "0"))}",
                    style: GoogleFonts.notoSans(
                        color: Pallete.whiteColor,
                        fontSize: 3.5.sw,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: 7.sw,
                  child: GestureDetector(
                    onTap: () {
                      if (cubit.controller!.value.volume > 0) {
                        cubit.controller!.setVolume(0);
                      } else {
                        cubit.controller!.setVolume(100);
                      }
                      cubit.updateState();
                    },
                    child: cubit.controller!.value.volume == 0
                        ? SvgPicture.asset(
                            Assets.volume_x,
                            width: 15.sw,
                            colorFilter: const ColorFilter.mode(
                                Pallete.whiteColor, BlendMode.srcATop),
                          )
                        : SvgPicture.asset(
                            Assets.volume,
                            width: 15.sw,
                            colorFilter: const ColorFilter.mode(
                                Pallete.whiteColor, BlendMode.srcATop),
                          ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
