import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:reddit_task/core/utility/assets.dart';
import 'package:reddit_task/core/utility/pallete.dart';
import 'package:reddit_task/features/home/presentation/widgets/animated_dislike_button.dart';
import 'package:reddit_task/features/home/presentation/widgets/animated_like_button.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CommentCard extends StatelessWidget {
  final String userName;
  final String userPhoto;
  final String comment;
  final int likes;
  final bool? isLiked;
  final bool? isDisLiked;
  final bool? online;
  final String since;
  const CommentCard(
      {super.key,
      required this.userName,
      required this.userPhoto,
      required this.comment,
      this.likes = 0,
      this.isLiked,
      this.isDisLiked,
      required this.since,
      this.online = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Pallete.commentBackground,
      padding: EdgeInsets.symmetric(
        vertical: 1.sw,
        horizontal: 6.sw,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Stack(children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(
                    Assets.piper,
                  ),
                  radius: 18,
                ),
                Positioned(
                  bottom: -3,
                  right: -4,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.circle,
                        size: 3.5.sw,
                        color: Colors.black,
                      ),
                      Icon(
                        Icons.circle,
                        size: 2.sw,
                        color: online == null || !online!
                            ? Colors.red
                            : Colors.green,
                      ),
                    ],
                  ),
                )
              ]),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$userName • $since",
                        style: const TextStyle(
                          color: Pallete.userNameFontColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        comment,
                        style: const TextStyle(
                          color: Pallete.commentsFontColor,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.reply,
                  color: Pallete.commentsFontColor,
                ),
              ),
              Gap(2.sw),
              const Text(
                'Reply',
                style: TextStyle(
                  color: Pallete.commentsFontColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gap(2.sw),
              AnimatedLikeButton(
                  onPressed: () {}, iconSize: 4.sw, isLiked: isLiked),
              Gap(2.sw),
              Text(
                likes.toString(),
                style: const TextStyle(
                  color: Pallete.commentsFontColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gap(2.sw),
              AnimatedDisLikeButton(
                onPressed: () {},
                iconSize: 4.sw,
                isDisLiked: isDisLiked,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
