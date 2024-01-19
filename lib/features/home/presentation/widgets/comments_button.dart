import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:reddit_task/core/utility/assets.dart';
import 'package:reddit_task/core/utility/pallete.dart';
import 'package:reddit_task/features/home/application/cubit/home_cubit.dart';
import 'package:reddit_task/features/home/application/infrastructure/dummy_data.dart';
import 'package:reddit_task/features/home/presentation/widgets/comment_card.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:svg_flutter/svg.dart';

class CommentsButton extends StatelessWidget {
  const CommentsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return GestureDetector(
      onTap: () {
        Widget buildBottomSheet(
          BuildContext context,
          ScrollController scrollController,
          double bottomSheetOffset,
        ) {
          return Material(
            child: Stack(
              children: [
                Container(
                  color: Pallete.commentsCardColor,
                  child: ListView(
                    controller: scrollController,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        color: Pallete.commentsCardHeaderColor,
                        height: 8.sw,
                        width: 100.sw,
                        child: Container(
                          height: 1.sw,
                          width: 10.sw,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Pallete.commentsCardHeaderCenterLineColor),
                        ),
                      ),
                      ...DummyData.userComments.map(
                        (comment) => Padding(
                          padding: EdgeInsets.only(
                            bottom: 10.sw,
                          ),
                          child: Column(
                            children: [
                              CommentCard(
                                userName: comment.userName,
                                comment: comment.comment,
                                userPhoto: comment.userPhoto,
                                likes: comment.likesNum,
                                isDisLiked: comment.isDisLiked,
                                isLiked: comment.isLiked,
                                since: comment.since,
                                online: comment.online,
                              ),
                              Divider(
                                color: Colors.black,
                                height: 2.sw,
                                thickness: 2.sw,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.sw),
                    child: SizedBox(
                        height: 10.sw,
                        width: 100.sw,
                        child: Row(
                          children: [
                            Flexible(
                              flex: 10,
                              child: TextFormField(
                                maxLines: 1,
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 8),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6),
                                        borderSide: BorderSide.none),
                                    suffixIcon: SizedBox(
                                      width: 18.sw,
                                      child: Row(
                                        children: [
                                          Gap(2.sw),
                                          const Icon(
                                            Icons.reddit,
                                            color: Pallete.blueIconColor,
                                          ),
                                          Gap(2.sw),
                                          const Icon(
                                            Icons.photo,
                                            color: Pallete.blueIconColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                    constraints: BoxConstraints(
                                      maxHeight: 10.sw,
                                    ),
                                    hintText: 'Add a comment',
                                    hintStyle:
                                        const TextStyle(color: Colors.grey),
                                    floatingLabelAlignment: null,
                                    floatingLabelBehavior: null,
                                    filled: true,
                                    fillColor: Pallete.commentsCardHeaderColor),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.arrow_downward)),
                            )
                          ],
                        )),
                  ),
                )
              ],
            ),
          );
        }

        cubit.isBottomSheetOpen = true;
        cubit.updateState();
        showFlexibleBottomSheet(
          isDismissible: false,
          isCollapsible: true,
          isModal: false,
          bottomSheetBorderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.sw), topRight: Radius.circular(8.sw)),
          bottomSheetColor: Pallete.commentsCardColor,
          minHeight: 0,
          initHeight:
              ((cubit.getpadding() * 2 + AppBar().preferredSize.height) /
                  100.sh),
          maxHeight: 1,
          context: context,
          builder: buildBottomSheet,
          anchors: [
            0,
            (cubit.getpadding() * 2 + AppBar().preferredSize.height) / 100.sh,
            1
          ],
          isSafeArea: false,
        ).then((value) {
          cubit.isBottomSheetOpen = false;

          cubit.updateState();
        });
      },
      child: SvgPicture.asset(
        Assets.message,
        height: 5.sw,
        colorFilter:
            const ColorFilter.mode(Pallete.whiteColor, BlendMode.srcATop),
      ),
    );
  }
}
