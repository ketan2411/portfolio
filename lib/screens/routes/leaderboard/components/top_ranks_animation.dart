import 'package:portfolio_flutter/constants.dart';

import 'profile.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class TopLeaderBoardAnimation extends StatefulWidget {
  const TopLeaderBoardAnimation({
    Key? key,
  }) : super(key: key);

  @override
  State<TopLeaderBoardAnimation> createState() =>
      _TopLeaderBoardAnimationState();
}

class _TopLeaderBoardAnimationState extends State<TopLeaderBoardAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..forward();
  Animation<Offset> anima(int rank) {
    return Tween<Offset>(
      end: Offset(0, 0.3 + (rank / 10)),
      begin: const Offset(0, 1),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );
  }

  late final AnimationController _kcontroller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..forward();

  @override
  void dispose() {
    _controller.dispose();
    _kcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: quizWidthDesktop,
      width: quizWidthDesktop,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            color: const Color.fromARGB(255, 143, 145, 172),
            // color: const Color(0xffedf2f4),
            height: MediaQuery.of(context).size.width,
            child: ClipRect(
              clipBehavior: Clip.antiAlias,
              child: RotationTransition(
                turns: Tween(
                  begin: 0.0,
                  end: 0.2,
                ).animate(
                  CurvedAnimation(
                    parent: _kcontroller,
                    curve: Curves.easeOutCubic,
                  ),
                ),
                child: Transform.scale(
                  scale: 1.7,
                  child: SvgPicture.string(
                    bg,
                    fit: BoxFit.cover,
                    // width: 200,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              height: MediaQuery.of(context).size.width,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  rankBlock(
                    rank: 3,
                    name: 'Vijaya Mishra',
                    imgThumbnail: "assets/images/leaderboard/2F.jpeg",
                  ),
                  rankBlock(
                    rank: 1,
                    name: 'Shweta Chowdhury',
                    imgThumbnail: "assets/images/leaderboard/4F.jpeg",
                  ),
                  rankBlock(
                    rank: 2,
                    name: "Apurva Deol",
                    imgThumbnail: "assets/images/leaderboard/6.jpeg",
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget rankBlock({
    required int rank,
    required String name,
    String? imgThumbnail,
  }) {
    return SlideTransition(
      position: anima(rank),
      child: ClipRect(
        clipBehavior: Clip.none,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  const Icon(
                    Icons.star,
                    size: 92,
                    color: Colors.amber,
                  ),
                  ProfileCard(imgThumbnail!),
                ],
              ),
              Text(
                '#$rank Rank',
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              Container(
                constraints: const BoxConstraints(maxWidth: 110),
                child: Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SvgPicture.string(
                block,
                height: 245,
                fit: BoxFit.fill,
                // cacheColorFilter: false,
                // color: Colors.amber,
                // colorFilter:
                //     ColorFilter.mode(Colors.amber, BlendMode.),
                // width: 350,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const bg = """
<svg width="519" height="517" viewBox="0 0 519 517" fill="none" xmlns="http://www.w3.org/2000/svg">
<g clip-path="url(#clip0_3257_3199)">
<path d="M259.366 258.351L153.512 495.084L117.96 475.727L259.366 258.351Z" fill="white" fill-opacity="0.1"/>
<path d="M259.366 258.352L236.116 516.629L196.2 509.868L259.366 258.352Z" fill="white" fill-opacity="0.1"/>
<path d="M259.366 258.352L321.243 510.182L281.29 516.746L259.366 258.352Z" fill="white" fill-opacity="0.1"/>
<path d="M259.366 258.352L399.659 476.454L364.009 495.631L259.366 258.352Z" fill="white" fill-opacity="0.1"/>
<path d="M259.366 258.352L462.873 419.078L435.374 448.796L259.366 258.352Z" fill="white" fill-opacity="0.1"/>
<path d="M259.366 258.351L504.035 344.297L487.678 381.322L259.366 258.351Z" fill="white" fill-opacity="0.1"/>
<path d="M259.366 258.352L518.687 260.194L515.241 300.526L259.366 258.352Z" fill="white" fill-opacity="0.1"/>
<path d="M259.366 258.352L505.23 175.896L515.071 215.162L259.366 258.352Z" fill="white" fill-opacity="0.1"/>
<path d="M259.366 258.351L465.14 100.528L487.191 134.476L259.366 258.351Z" fill="white" fill-opacity="0.1"/>
<path d="M259.366 258.351L402.744 42.2669L434.628 67.2107L259.366 258.351Z" fill="white" fill-opacity="0.1"/>
<path d="M259.365 258.351L324.811 7.41628L363.073 20.6665L259.365 258.351Z" fill="white" fill-opacity="0.1"/>
<path d="M259.366 258.352L239.788 -0.233356L280.277 -0.128443L259.366 258.352Z" fill="white" fill-opacity="0.1"/>
<path d="M259.366 258.351L156.886 20.1321L195.208 7.09009L259.366 258.351Z" fill="white" fill-opacity="0.1"/>
<path d="M259.366 258.352L85.0914 66.3123L117.107 41.536L259.366 258.352Z" fill="white" fill-opacity="0.1"/>
<path d="M259.366 258.351L32.1825 133.308L54.4065 99.4763L259.366 258.351Z" fill="white" fill-opacity="0.1"/>
<path d="M259.366 258.351L3.89002 213.855L13.9297 174.63L259.366 258.351Z" fill="white" fill-opacity="0.1"/>
<path d="M259.366 258.352L3.28508 299.219L0.0469127 258.867L259.366 258.352Z" fill="white" fill-opacity="0.1"/>
<path d="M259.366 258.352L30.4272 380.152L14.26 343.031L259.366 258.352Z" fill="white" fill-opacity="0.1"/>
<path d="M259.366 258.352L82.3787 447.893L55.0389 418.033L259.366 258.352Z" fill="white" fill-opacity="0.1"/>
<path d="M259.32 258.34L279.56 516.87H239.08L259.32 258.34Z" fill="black" fill-opacity="0.1"/>
<path d="M259.32 258.34L362.41 496.29L324.12 509.44L259.32 258.34Z" fill="black" fill-opacity="0.1"/>
<path d="M259.32 258.34L434.09 449.92L402.14 474.79L259.32 258.34Z" fill="black" fill-opacity="0.1"/>
<path d="M259.32 258.34L486.83 382.8L464.69 416.69L259.32 258.34Z" fill="black" fill-opacity="0.1"/>
<path d="M259.32 258.34L514.91 302.18L504.97 341.43L259.32 258.34Z" fill="black" fill-opacity="0.1"/>
<path d="M259.32 258.34L515.3 216.82L518.64 257.16L259.32 258.34Z" fill="black" fill-opacity="0.1"/>
<path d="M259.32 258.34L487.95 135.95L504.21 173.02L259.32 258.34Z" fill="black" fill-opacity="0.1"/>
<path d="M259.32 258.34L435.82 68.3501L463.24 98.1301L259.32 258.34Z" fill="black" fill-opacity="0.1"/>
<path d="M259.32 258.34L364.57 21.3301L400.17 40.6001L259.32 258.34Z" fill="black" fill-opacity="0.1"/>
<path d="M259.32 258.34L281.91 0L321.84 6.66L259.32 258.34Z" fill="black" fill-opacity="0.1"/>
<path d="M259.32 258.34L196.8 6.66L236.74 0L259.32 258.34Z" fill="black" fill-opacity="0.1"/>
<path d="M259.32 258.34L118.47 40.6001L154.08 21.3301L259.32 258.34Z" fill="black" fill-opacity="0.1"/>
<path d="M259.32 258.34L55.3999 98.1301L82.8199 68.3501L259.32 258.34Z" fill="black" fill-opacity="0.1"/>
<path d="M259.32 258.34L14.4302 173.02L30.7002 135.95L259.32 258.34Z" fill="black" fill-opacity="0.1"/>
<path d="M259.32 258.34L0 257.16L3.34 216.82L259.32 258.34Z" fill="black" fill-opacity="0.1"/>
<path d="M259.32 258.34L13.67 341.43L3.72998 302.18L259.32 258.34Z" fill="black" fill-opacity="0.1"/>
<path d="M259.32 258.34L53.9598 416.69L31.8198 382.8L259.32 258.34Z" fill="black" fill-opacity="0.1"/>
<path d="M259.32 258.34L116.5 474.79L84.5498 449.92L259.32 258.34Z" fill="black" fill-opacity="0.1"/>
<path d="M259.32 258.34L194.52 509.44L156.23 496.29L259.32 258.34Z" fill="black" fill-opacity="0.1"/>
</g>
<defs>
<clipPath id="clip0_3257_3199">
<rect width="518.64" height="516.87" fill="white"/>
</clipPath>
</defs>
</svg>

""";
const block = """
<svg width="82" height="344" viewBox="0 0 82 344" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M22.7395 4H82L59.2605 18H0L22.7395 4Z" fill="#d90429"/>
<path d="M82 344V4L59 17.8458V344H82Z" fill="#9d0b24"/>
<path d="M0 344L0.000660062 18H59.0007L59 344H0Z" fill="#d90429"/>
<g style="mix-blend-mode:overlay" opacity="0.85">
<ellipse cx="40.5" cy="11" rx="39.5" ry="11" fill="url(#paint0_radial_3562_3274)"/>
</g>
<defs>
<radialGradient id="paint0_radial_3562_3274" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse" gradientTransform="translate(40.5 11) rotate(90) scale(11 39.5)">
<stop stop-color="white"/>
<stop offset="1" stop-color="white" stop-opacity="0"/>
</radialGradient>
</defs>
</svg>

""";
