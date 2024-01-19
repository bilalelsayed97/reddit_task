import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:reddit_task/core/utility/assets.dart';
import 'package:reddit_task/core/utility/pallete.dart';
import 'package:reddit_task/features/home/application/cubit/home_cubit.dart';
import 'package:reddit_task/features/home/presentation/widgets/player_controller.dart';
import 'package:reddit_task/features/home/presentation/widgets/video_player.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:svg_flutter/svg.dart';
import 'package:video_player/video_player.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<HomeCubit>(context).controller =
        VideoPlayerController.asset(Assets.video)
          ..addListener(() {
            setState(() {});
          })
          ..initialize()
          ..setLooping(true)
          ..play();
  }

  @override
  void dispose() {
    BlocProvider.of<HomeCubit>(context).controller!.removeListener(() {});
    BlocProvider.of<HomeCubit>(context).controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: cubit.getScreenHeight() ?? 0,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: cubit.isBottomSheetOpen
                            ? 0
                            : cubit.getpadding() >= 0
                                ? cubit.getpadding()
                                : 0),
                    child: AspectRatio(
                        aspectRatio: cubit.controller!.value.aspectRatio,
                        child: Stack(
                          children: [
                            const CustomVideoPlayer(),
                            cubit.isBottomSheetOpen
                                ? Positioned(
                                    bottom: 2.sw,
                                    right: 4.sw,
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            BlocProvider.of<HomeCubit>(context)
                                                    .controller!
                                                    .value
                                                    .isPlaying
                                                ? BlocProvider.of<HomeCubit>(
                                                        context)
                                                    .controller!
                                                    .pause()
                                                : BlocProvider.of<HomeCubit>(
                                                        context)
                                                    .controller!
                                                    .play();

                                            cubit.updateState();
                                          },
                                          child: BlocProvider.of<HomeCubit>(
                                                      context)
                                                  .controller!
                                                  .value
                                                  .isPlaying
                                              ? Icon(
                                                  Icons.pause,
                                                  size: 8.sw,
                                                  color: Pallete.whiteColor,
                                                )
                                              : Icon(
                                                  Icons.play_arrow,
                                                  size: 8.sw,
                                                  color: Pallete.whiteColor,
                                                ),
                                        ),
                                        Gap(4.sw),
                                        GestureDetector(
                                          onTap: () {
                                            if (cubit.controller!.value.volume >
                                                0) {
                                              cubit.controller!.setVolume(0);
                                            } else {
                                              cubit.controller!.setVolume(100);
                                            }
                                            cubit.updateState();
                                          },
                                          child: cubit.controller!.value
                                                      .volume ==
                                                  0
                                              ? SvgPicture.asset(
                                                  Assets.volume_x,
                                                  width: 5.sw,
                                                  colorFilter:
                                                      const ColorFilter.mode(
                                                          Pallete.whiteColor,
                                                          BlendMode.srcATop),
                                                )
                                              : SvgPicture.asset(
                                                  Assets.volume,
                                                  width: 5.sw,
                                                  colorFilter:
                                                      const ColorFilter.mode(
                                                          Pallete.whiteColor,
                                                          BlendMode.srcATop),
                                                ),
                                        ),
                                      ],
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        )),
                  ),
                  Positioned(
                    bottom: 0,
                    child: PlayerController(
                      controller: cubit.controller,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
