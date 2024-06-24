import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants.dart';
import 'package:portfolio_flutter/data.dart';
import 'package:portfolio_flutter/screens/routes/leaderboard/components/profile.dart';
import 'package:portfolio_flutter/screens/routes/leaderboard/components/top_ranks_animation.dart';
import 'package:portfolio_flutter/screens/routes/leaderboard/leaderboard_bg.dart';

class LeaderBoardScreen extends StatefulWidget {
  static const routeName = '/leaderboard';
  const LeaderBoardScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LeaderBoardScreen> createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LeaderboardBg(
      child: Scaffold(
        body: Builder(
          builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Builder(
                    builder: (context) {
                      // appLog(name: 'rank1', log: scoreList[0].toString());
                      return const TopLeaderBoardAnimation();
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    color: const Color.fromARGB(255, 66, 68, 92),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          color: const Color(0xff2b2d42),
                          padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding,
                            vertical: defaultPadding / 2,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Rank',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.white.withOpacity(0.4),
                                    ),
                              ),
                              const SizedBox(
                                width: defaultPadding * 2,
                              ),
                              Text(
                                'User',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.white.withOpacity(0.4),
                                    ),
                              ),
                              const Spacer(),
                              Text(
                                'Score',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.white.withOpacity(0.4),
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: scoreList.length,
                            separatorBuilder: (context, index) {
                              return const SizedBox();
                              // return const Divider(
                              //   height: 2,
                              //   color: Colors.white12,
                              // );
                            },
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: defaultPadding,
                                  vertical: defaultPadding / 2,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      '#${index + 4}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: Colors.white),
                                    ),
                                    const SizedBox(
                                      width: defaultPadding * 2,
                                    ),
                                    ProfileCard(
                                      scoreList[index]['pictureUrl'],
                                    ),
                                    Text(
                                      scoreList[index]['name'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: Colors.white),
                                    ),
                                    const Spacer(),
                                    Text(
                                      scoreList[index]['score'].toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: Colors.white),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
