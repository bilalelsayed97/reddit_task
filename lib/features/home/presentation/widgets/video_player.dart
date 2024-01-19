import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_task/features/home/application/cubit/home_cubit.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({super.key});

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return VideoPlayer(BlocProvider.of<HomeCubit>(context).controller!);
  }
}
