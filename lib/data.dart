import 'package:portfolio_flutter/screens/routes/leaderboard/leaderboard_screen.dart';
import 'package:portfolio_flutter/screens/routes/parallax.dart';
import 'package:portfolio_flutter/screens/routes/quiz/quiz_play_screen.dart';
import 'package:portfolio_flutter/screens/routes/slot_machine.dart';

final List<Map> projectsDATA = [
  {
    "title": "Qlan",
    "subtitle": "The Gamer's Social Network",
    "screenshots": [
      "assets/images/qlan/4.jpg",
      "assets/images/qlan/5.jpg",
      "assets/images/qlan/6.jpg",
      "assets/images/qlan/7.jpg",
      "assets/images/qlan/8.jpg"
    ],
    "thumbnail": [
      "assets/images/qlan/thumbnail/4_small.jpg",
      "assets/images/qlan/thumbnail/5_small.jpg",
      "assets/images/qlan/thumbnail/6_small.jpg",
      "assets/images/qlan/thumbnail/7_small.jpg",
      "assets/images/qlan/thumbnail/8_small.jpg"
    ],
    "tags": ["Flutter"],
    "link": "https://play.google.com/store/apps/details?id=com.qlan",
    "description":
        "Qlan is a social networking and chat communication app dedicated to gamers. It is suited for everyone who is looking to collaborate or network with other gamers through chat. Users can create custom profiles, sync their in-game statistics, access AI based matchmaking, build squads, share gaming content and much more.\n**Key Responsibilities:**\n\n - Full application setup.\n - Mentorship over the duration of development.",
    "year": "2022"
  },
   {
    "title": "ThinkRight",
    "subtitle": "Meditation & Sleep",
    "screenshots": [
      "assets/images/qlan/4.jpg",
      "assets/images/qlan/5.jpg",
      "assets/images/qlan/6.jpg",
      "assets/images/qlan/7.jpg",
      "assets/images/qlan/8.jpg"
    ],
    "thumbnail": [
      "assets/images/qlan/thumbnail/4_small.jpg",
      "assets/images/qlan/thumbnail/5_small.jpg",
      "assets/images/qlan/thumbnail/6_small.jpg",
      "assets/images/qlan/thumbnail/7_small.jpg",
      "assets/images/qlan/thumbnail/8_small.jpg"
    ],
    "tags": ["Flutter"],
    "link": "https://play.google.com/store/apps/details?id=in.publicam.thinkrightme&hl=en_IN",
    "description":
        "Qlan is a social networking and chat communication app dedicated to gamers. It is suited for everyone who is looking to collaborate or network with other gamers through chat. Users can create custom profiles, sync their in-game statistics, access AI based matchmaking, build squads, share gaming content and much more.\n**Key Responsibilities:**\n\n - Full application setup.\n - Mentorship over the duration of development.",
    "year": "2022"
  },
  {
    "title": "Infoflight",
    "subtitle": "Resource Management and Resume Builder Web App",
    "screenshots": [
      "assets/images/infoflight/1.png",
      "assets/images/infoflight/2.png",
      "assets/images/infoflight/3.png",
      "assets/images/infoflight/4.png",
      "assets/images/infoflight/5.png"
    ],
    "thumbnail": [
      "assets/images/infoflight/thumbnail/1_small.png",
      "assets/images/infoflight/thumbnail/2_small.png",
      "assets/images/infoflight/thumbnail/3_small.png",
      "assets/images/infoflight/thumbnail/4_small.png",
      "assets/images/infoflight/thumbnail/5_small.png"
    ],
    "tags": ["Flutter", "Firebase"],
    "description":
        "Infoflight is an In-house webapp for managing resources. It manages kinds of resource such as technology content and tutorials, Project documentation, Resume builder and employee project allocation.\nResumes can be sent to clients and can be modified at runtime.Content display is achieved using markdown.\n**Key Responsibilities:**\n\n- Full application setup with flutter and firebase.\n- UI creation.\n- Mentorship over the duration of development.\n",
    "year": "2021"
  },
  {
    "title": "TRP ",
    "subtitle": "Inventory Management App",
    "screenshots": [
      "assets/images/TRP/1.png",
      "assets/images/TRP/2.png",
      "assets/images/TRP/3.png",
      "assets/images/TRP/4.png"
    ],
    "thumbnail": [
      "assets/images/TRP/thumbnail/1_small.png",
      "assets/images/TRP/thumbnail/2_small.png",
      "assets/images/TRP/thumbnail/3_small.png",
      "assets/images/TRP/thumbnail/4_small.png"
    ],
    "tags": ["Flutter", "Firebase", "CSV"],
    "description":
        "Inventory management app for a clothing store.It Manages to store all the stock, calculate profit or loss, generate invoices and sales csv data.\n It also has a feature of custom billing calculator.",
    "year": "2020"
  },
  {
    "title": "Illustro-AI",
    "subtitle": "Convert portrait images into vector art",
    "screenshots": [
     
    ],
    "thumbnail": [
    
    ],
    "tags": ["Flutter"],
    "link":
        "https://play.google.com/store/apps/details?id=com.rattler.illustro&hl=en",
    "description": "",
    "year": "2023"
  }
];

final List<Map> showcaseLeftDATA = [
  {
    "title": "Landscape Parallax",
    "subtitle": "The Parallax effect from package: parallax",
    "routeName": Parallax.routeName,
    "image": "/images/showcase_banner/parallax_logo.png"
  },
  {
    "title": "Slot Machine",
    "subtitle": "The Parallax effect",
    "routeName": SlotMachine.routeName,
    "image": "/images/showcase_banner/slotmachine.png"
  },
  {
    "title": "Arcade Quiz",
    "subtitle": "Quiz",
    "routeName": QuizPlayScreen.routeName,
    "image": "/images/showcase_banner/quiz.png"
  },
  {
    "title": "Leaderboard",
    "subtitle": "leaderboard",
    "routeName": LeaderBoardScreen.routeName,
    "image": "/images/showcase_banner/leaderboard.png"
  },
];
final List<Map<String, dynamic>> quizQuesstion = [
  {
    "Question_id": 0,
    "Question": "Which of the following is not an OOPS concept?",
    "A": "Encapsulation",
    "B": "Polymorphism",
    "C": "Exception",
    "D": "Abstraction",
    "ANS": "Exception"
  },
  {
    "Question_id": 1,
    "Question": "Which of these is NOT a relational or logical operator?",
    "A": "=",
    "B": "||",
    "C": "==",
    "D": "!=",
    "ANS": "="
  },
  {
    "Question_id": 2,
    "Question":
        "Out of the following, which one is not valid as an if-else statement?",
    "A": "if ((char) x){}",
    "B": "if (x){}",
    "C": "if (func1 (x)){}",
    "D": "if (if (x == 1)){}",
    "ANS": "if (if (x == 1)){}"
  },
];

List scoreList = [
  {
    "name": "Vidya Chaudhry",
    "score": 23532,
    "pictureUrl": "assets/images/leaderboard/2F.jpeg",
  },
  {
    "name": "Kalpana Loke",
    "score": 22444,
    "pictureUrl": "assets/images/leaderboard/3F.jpeg",
  },
  {
    "name": "Anup Murthy",
    "score": 20235,
    "pictureUrl": "assets/images/leaderboard/1.jpeg",
  },
  {
    "name": "Gautam Sridhar",
    "score": 15023,
    "pictureUrl": "assets/images/leaderboard/5.jpeg",
  },
  {
    "name": "Gautam Sridhar",
    "score": 15023,
    "pictureUrl": "assets/images/leaderboard/6.jpeg",
  },
  {
    "name": "Ishani Prakash",
    "score": 14566,
    "pictureUrl": "assets/images/leaderboard/4F.jpeg",
  },
  {
    "name": "Nilima Khanna",
    "score": 14256,
    "pictureUrl": "assets/images/leaderboard/3F.jpeg",
  },
  {
    "name": "Vishi Agrawal",
    "score": 14000,
    "pictureUrl": "assets/images/leaderboard/2F.jpeg",
  },
  {
    "name": "Nikhil Saxena",
    "score": 12435,
    "pictureUrl": "assets/images/leaderboard/1.jpeg",
  },
];
