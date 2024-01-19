import 'package:reddit_task/features/home/domain/user_comment.dart';

class DummyData {
  static const List<UserComment> userComments = [
    UserComment(
        userName: 'John Doe',
        userPhoto: 'john_doe.jpg',
        comment: 'This is a great comment!',
        likesNum: 15,
        isReply: false,
        isLiked: true,
        isDisLiked: false,
        online: false,
        since: '10h'),
    UserComment(
        userName: 'Jane Smith',
        userPhoto: 'jane_smith.png',
        comment: 'I disagree with this.',
        likesNum: 3,
        isReply: true,
        isLiked: false,
        isDisLiked: true,
        since: '2d'),
    UserComment(
        userName: 'Bob Johnson',
        userPhoto: 'bob_johnson.jpeg',
        comment: 'Interesting perspective.',
        likesNum: 8,
        isReply: false,
        isLiked: false,
        isDisLiked: false,
        online: false,
        since: '1h'),
    UserComment(
        userName: 'Emily Davis',
        userPhoto: 'emily_davis.jpg',
        comment: 'This makes a lot of sense.',
        likesNum: 12,
        isReply: false,
        isLiked: true,
        isDisLiked: false,
        online: true,
        since: '5m'),
    UserComment(
        userName: 'Michael Lee',
        userPhoto: 'michael_lee.png',
        comment: 'I learned something new today.',
        likesNum: 20,
        isReply: false,
        isLiked: true,
        isDisLiked: false,
        online: true,
        since: '3h'),
    UserComment(
        userName: 'Sarah Wilson',
        userPhoto: 'sarah_wilson.jpeg',
        comment: 'Thanks for sharing!',
        likesNum: 7,
        isReply: true,
        isLiked: false,
        isDisLiked: false,
        online: true,
        since: '1d'),
    UserComment(
        userName: 'Chris Martin',
        userPhoto: 'chris_martin.jpg',
        comment: 'This is really helpful.',
        likesNum: 10,
        isReply: false,
        isLiked: true,
        isDisLiked: false,
        online: false,
        since: '12m'),
    UserComment(
        userName: 'Jessica Moore',
        userPhoto: 'jessica_moore.png',
        comment: 'What do you think about this?',
        likesNum: 4,
        isReply: true,
        isLiked: false,
        isDisLiked: false,
        online: true,
        since: '6h'),
    UserComment(
        userName: 'Matthew Davis',
        userPhoto: 'matthew_davis.jpeg',
        comment: 'I have a different opinion.',
        likesNum: 2,
        isReply: true,
        isLiked: false,
        isDisLiked: true,
        since: '15h'),
    UserComment(
        userName: 'Jennifer Thomas',
        userPhoto: 'jennifer_thomas.jpg',
        comment: 'Interesting idea!',
        likesNum: 11,
        isReply: false,
        isLiked: true,
        isDisLiked: false,
        online: true,
        since: '9h'),
    UserComment(
        userName: 'William Rodriguez',
        userPhoto: 'william_rodriguez.png',
        comment: 'I never considered that.',
        likesNum: 7,
        isReply: false,
        isLiked: false,
        isDisLiked: false,
        online: true,
        since: '20m'),
    UserComment(
        userName: 'Elizabeth Lewis',
        userPhoto: 'elizabeth_lewis.jpeg',
        comment: 'You make a good point.',
        likesNum: 9,
        isReply: false,
        isLiked: true,
        isDisLiked: false,
        online: false,
        since: '1m'),
    UserComment(
        userName: 'Anthony Brown',
        userPhoto: 'anthony_brown.jpg',
        comment: 'Thanks for the advice!',
        likesNum: 6,
        isReply: false,
        isLiked: false,
        isDisLiked: false,
        online: true,
        since: '18h'),
    UserComment(
        userName: 'Lisa Walker',
        userPhoto: 'lisa_walker.png',
        comment: 'I appreciate your perspective.',
        likesNum: 13,
        isReply: true,
        isLiked: true,
        isDisLiked: false,
        online: true,
        since: '4h'),
    UserComment(
        userName: 'Steven Williams',
        userPhoto: 'steven_williams.jpeg',
        comment: 'You raised some good points.',
        likesNum: 5,
        isReply: true,
        isLiked: false,
        isDisLiked: false,
        online: true,
        since: '2h'),
    UserComment(
        userName: 'Michelle Robinson',
        userPhoto: 'michelle_robinson.jpg',
        comment: 'I learned a lot, thanks!',
        likesNum: 17,
        isReply: false,
        isLiked: true,
        isDisLiked: false,
        online: false,
        since: '30m'),
    UserComment(
        userName: 'David Anderson',
        userPhoto: 'david_anderson.png',
        comment: 'This was really insightful.',
        likesNum: 11,
        isReply: false,
        isLiked: true,
        isDisLiked: false,
        online: true,
        since: '14h'),
    UserComment(
        userName: 'Ashley Turner',
        userPhoto: 'ashley_turner.jpeg',
        comment: 'Appreciate you sharing this.',
        likesNum: 8,
        isReply: false,
        isLiked: false,
        isDisLiked: false,
        online: false,
        since: '10m'),
    UserComment(
        userName: 'Brandon White',
        userPhoto: 'brandon_white.jpg',
        comment: 'Thanks, this was helpful!',
        likesNum: 10,
        isReply: false,
        isLiked: true,
        isDisLiked: false,
        online: true,
        since: '5h'),
    UserComment(
        userName: 'Daniel Rodriguez',
        userPhoto: 'daniel_rodriguez.png',
        comment: 'I never thought of it that way!',
        likesNum: 12,
        isReply: false,
        isLiked: true,
        isDisLiked: false,
        online: false,
        since: '2d'),
    UserComment(
        userName: 'Samantha Harris',
        userPhoto: 'samantha_harris.jpeg',
        comment: 'Interesting viewpoint.',
        likesNum: 5,
        isReply: true,
        isLiked: false,
        isDisLiked: false,
        online: true,
        since: '16h'),
    UserComment(
        userName: 'Jacob Martinez',
        userPhoto: 'jacob_martinez.jpg',
        comment: 'Thanks for the useful info.',
        likesNum: 9,
        isReply: false,
        isLiked: true,
        isDisLiked: false,
        online: true,
        since: '1h'),
    UserComment(
        userName: 'Sophia Garcia',
        userPhoto: 'sophia_garcia.png',
        comment: 'I really enjoyed this.',
        likesNum: 11,
        isReply: false,
        isLiked: true,
        isDisLiked: false,
        online: false,
        since: '3m'),
    UserComment(
        userName: 'Joseph Lee',
        userPhoto: 'joseph_lee.jpeg',
        comment: 'You changed my perspective.',
        likesNum: 7,
        isReply: false,
        isLiked: false,
        isDisLiked: false,
        online: true,
        since: '1d'),
    UserComment(
        userName: 'Isabella Rodriguez',
        userPhoto: 'isabella_rodriguez.jpg',
        comment: 'Thanks for explaining!',
        likesNum: 8,
        isReply: true,
        isLiked: false,
        isDisLiked: false,
        online: true,
        since: '4h'),
    UserComment(
        userName: 'Alexander Wilson',
        userPhoto: 'alexander_wilson.png',
        comment: 'I appreciate you taking the time.',
        likesNum: 6,
        isReply: false,
        isLiked: false,
        isDisLiked: false,
        online: false,
        since: '15m'),
    UserComment(
        userName: 'Gabriella Lewis',
        userPhoto: 'gabriella_lewis.jpeg',
        comment: 'Food for thought.',
        likesNum: 4,
        isReply: false,
        isLiked: false,
        isDisLiked: false,
        online: false,
        since: '2h'),
    UserComment(
        userName: 'Jayden Walker',
        userPhoto: 'jayden_walker.jpg',
        comment: 'Thanks for the great info!',
        likesNum: 10,
        isReply: false,
        isLiked: true,
        isDisLiked: false,
        online: true,
        since: '5d'),
    UserComment(
        userName: 'Avery Davis',
        userPhoto: 'avery_davis.png',
        comment: 'Appreciate the insight.',
        likesNum: 3,
        isReply: true,
        isLiked: false,
        isDisLiked: false,
        online: true,
        since: '12h'),
    UserComment(
        userName: 'Elijah Miller',
        userPhoto: 'elijah_miller.jpeg',
        comment: 'Learned something new today.',
        likesNum: 11,
        isReply: false,
        isLiked: true,
        isDisLiked: false,
        online: false,
        since: '30m'),
    UserComment(
        userName: 'Benjamin Moore',
        userPhoto: 'benjamin_moore.jpg',
        comment: 'Great perspective, thanks!',
        likesNum: 9,
        isReply: false,
        isLiked: true,
        isDisLiked: false,
        online: true,
        since: '1h'),
    UserComment(
        userName: 'Ava Thompson',
        userPhoto: 'ava_thompson.png',
        comment: 'I see what you mean.',
        likesNum: 7,
        isReply: true,
        isLiked: false,
        isDisLiked: false,
        online: true,
        since: '1m'),
    UserComment(
        userName: 'Mason Anderson',
        userPhoto: 'mason_anderson.jpeg',
        comment: 'Appreciate you sharing!',
        likesNum: 13,
        isReply: false,
        isLiked: true,
        isDisLiked: false,
        online: false,
        since: '17h'),
    UserComment(
        userName: 'Charlotte Smith',
        userPhoto: 'charlotte_smith.jpg',
        comment: 'Thanks for the insight!',
        likesNum: 6,
        isReply: false,
        isLiked: false,
        isDisLiked: false,
        online: false,
        since: '2d'),
    UserComment(
        userName: 'Oliver Jones',
        userPhoto: 'oliver_jones.png',
        comment: 'Good food for thought.',
        likesNum: 8,
        isReply: false,
        isLiked: false,
        isDisLiked: false,
        online: true,
        since: '3h'),
    UserComment(
        userName: 'Isaiah Garcia',
        userPhoto: 'isaiah_garcia.jpeg',
        comment: 'Appreciate you sharing this perspective.',
        likesNum: 10,
        isReply: true,
        isLiked: true,
        isDisLiked: false,
        online: true,
        since: '5m'),
    UserComment(
        userName: 'Amelia Davis',
        userPhoto: 'amelia_davis.jpg',
        comment: 'Thanks, learned something new!',
        likesNum: 11,
        isReply: false,
        isLiked: true,
        isDisLiked: false,
        online: true,
        since: '4d')
  ];
}
