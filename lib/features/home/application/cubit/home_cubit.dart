import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:video_player/video_player.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial());
  MediaQueryData? mq;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  VideoPlayerController? controller;
  int numComments = 14;
  int numLikes = 7;

  bool? isLiked;
  bool? isDisLiked;
  bool isBottomSheetOpen = false;

  double? getScreenHeight() {
    return 100.sh - AppBar().preferredSize.height - mq!.viewPadding.top;
  }

  double getpadding() {
    return (100.sh -
            AppBar().preferredSize.height -
            mq!.viewPadding.top -
            ((100.sw / controller!.value.size.width) *
                controller!.value.size.height)) /
        2;
  }

  void updateState() {
    emit(const HomeState.loading());
    emit(const HomeState.initial());
  }

  void like() {
    if (isLiked == null) {
      numLikes += 1;
      isLiked = true;
      isDisLiked = false;
    } else if (isLiked != null) {
      if (isLiked!) {
        numLikes != 0 ? numLikes -= 1 : null;
        isLiked = false;
        isDisLiked = false;
      } else if (!isLiked!) {
        if (isDisLiked!) {
          numLikes == 0 ? numLikes += 1 : numLikes += 2;
        } else if (!isDisLiked!) {
          numLikes += 1;
        }
        isLiked = true;
        isDisLiked = false;
      }
    }

    updateState();
  }

  void disLike() {
    if (isDisLiked == null) {
      numLikes > 0 ? numLikes -= 1 : null;
      isDisLiked = true;
      isLiked = false;
    } else if (isDisLiked != null) {
      if (isDisLiked!) {
        numLikes == 0 ? null : numLikes += 1;
        isDisLiked = false;
        isLiked = false;
      } else if (!isDisLiked!) {
        if (isLiked!) {
          if (numLikes > 1) {
            numLikes -= 2;
          } else if (numLikes == 1) {
            numLikes -= 1;
          }
        } else if (!isLiked!) {
          numLikes == 0 ? null : numLikes -= 1;
        }
        isLiked = false;
        isDisLiked = true;
      }
    }
    updateState();
  }
}
