import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_comment.freezed.dart';

@freezed
class UserComment with _$UserComment {
  const UserComment._();
  const factory UserComment({
    required String userName,
    required String userPhoto,
    required String comment,
    required int likesNum,
    required bool isReply,
    required String since,
    bool? online,
    bool? isLiked,
    bool? isDisLiked,
  }) = _UserComment;
}
