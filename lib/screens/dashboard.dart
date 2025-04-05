import 'package:flutter/material.dart';
import 'package:sentinova_hackfest/components/cards_row.dart';
import 'package:sentinova_hackfest/components/corner_painter.dart';
import 'package:sentinova_hackfest/components/glassmorphic_button.dart';
import 'package:sentinova_hackfest/components/share_row.dart';
import 'package:sentinova_hackfest/components/social_stream.dart';
import 'package:sentinova_hackfest/components/twitter_post.dart';
import 'package:sentinova_hackfest/components/reddit_post.dart';
import 'package:sentinova_hackfest/components/linkedin_post.dart';
import 'package:sentinova_hackfest/components/facebook_post.dart';
import 'package:sentinova_hackfest/components/instagram_post.dart';
import 'package:sentinova_hackfest/components/leave_feedback.dart';

import 'package:sentinova_hackfest/dataclass/SocialMediaPost.dart';

import '../components/facebook_card.dart';
import '../components/instagram_card.dart';
import '../components/issue_button.dart';
import '../components/linkedin_card.dart';
import '../components/reddit_card.dart';
import '../components/twitter_card.dart';
import '../dataclass/event_model.dart';

class Dashboard extends StatefulWidget {
  final Event event;

  const Dashboard({super.key, required this.event});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  List<SocialMediaPost> dummyPosts = [
    SocialMediaPost(
      platform: 'Reddit',
      postId: 'r1',
      username: 'u/redditUser123',
      text: 'Just discovered Dart and Flutter – absolutely loving it!',
      timestamp: DateTime.parse('2025-04-01T14:30:00Z'),
      likes: 120,
      comments: 15,
      shares: 3,
      url: 'https://reddit.com/r/flutterdev/post1',
      sentiment: 'positive',
    ),
    SocialMediaPost(
      platform: 'Twitter',
      postId: 't1',
      username: '@flutterFan',
      text: 'Flutter 4.0 just dropped! Can’t wait to try the new features.',
      timestamp: DateTime.parse('2025-04-02T10:15:00Z'),
      likes: 340,
      comments: 60,
      shares: 89,
      url: 'https://twitter.com/flutterFan/status/123',
      sentiment: 'positive',
    ),
    SocialMediaPost(
      platform: 'Facebook',
      postId: 'f1',
      username: 'Jane Doe',
      text: 'Not sure how I feel about the new Facebook layout. Thoughts?',
      timestamp: DateTime.parse('2025-04-03T09:00:00Z'),
      likes: 45,
      comments: 12,
      shares: 5,
      url: 'https://facebook.com/post/456',
      sentiment: 'neutral',
    ),
    SocialMediaPost(
      platform: 'Instagram',
      postId: 'i1',
      username: '@photo_addict',
      text: 'Sunsets and Flutter code 🌅💻 #codinglife #flutter',
      timestamp: DateTime.parse('2025-04-04T18:45:00Z'),
      likes: 890,
      comments: 78,
      shares: 20,
      url: 'https://instagram.com/p/flutterlife',
      sentiment: 'positive',
    ),
    SocialMediaPost(
      platform: 'LinkedIn',
      postId: 'l1',
      username: 'John Smith',
      text: 'Excited to announce I’ve joined a new team as a Flutter Developer!',
      timestamp: DateTime.parse('2025-04-05T08:00:00Z'),
      likes: 150,
      comments: 22,
      shares: 10,
      url: 'https://linkedin.com/in/johnsmith/post/flutter-journey',
      sentiment: 'positive',
    ),
    SocialMediaPost(
      platform: 'Twitter',
      postId: 't2',
      username: '@tech_guru',
      text: 'AI + Flutter = the future. Can’t wait to build smarter apps!',
      timestamp: DateTime.parse('2025-04-05T12:00:00Z'),
      likes: 256,
      comments: 31,
      shares: 74,
      url: 'https://twitter.com/tech_guru/status/456',
      sentiment: 'positive',
    ),
    SocialMediaPost(
      platform: 'Reddit',
      postId: 'r2',
      username: 'u/throwaway_dev',
      text: 'Why does Flutter still lack good desktop support? Am I missing something?',
      timestamp: DateTime.parse('2025-04-04T21:10:00Z'),
      likes: 67,
      comments: 18,
      shares: 2,
      url: 'https://reddit.com/r/flutter/comments/456',
      sentiment: 'negative',
    ),
    SocialMediaPost(
      platform: 'Facebook',
      postId: 'f2',
      username: 'Chris Evans',
      text: 'Finally finished my first mobile app using Flutter! 🎉',
      timestamp: DateTime.parse('2025-04-03T15:40:00Z'),
      likes: 190,
      comments: 24,
      shares: 8,
      url: 'https://facebook.com/post/flutter-success',
      sentiment: 'positive',
    ),
    SocialMediaPost(
      platform: 'Instagram',
      postId: 'i2',
      username: '@codeandcoffee',
      text: 'Nothing like debugging at sunset 🌇☕ #flutterdev #mood',
      timestamp: DateTime.parse('2025-04-02T17:30:00Z'),
      likes: 1023,
      comments: 55,
      shares: 12,
      url: 'https://instagram.com/p/debugsunset',
      sentiment: 'positive',
    ),
    SocialMediaPost(
      platform: 'LinkedIn',
      postId: 'l2',
      username: 'Lisa Tran',
      text: 'Flutter is transforming cross-platform development. Proud to be part of this revolution!',
      timestamp: DateTime.parse('2025-04-01T09:25:00Z'),
      likes: 215,
      comments: 33,
      shares: 15,
      url: 'https://linkedin.com/in/lisatran/post/flutter-talk',
      sentiment: 'positive',
    ),
    SocialMediaPost(
      platform: 'Reddit',
      postId: 'r3',
      username: 'u/debugmaster',
      text: 'Can someone explain why my layout breaks in Flutter web but works on mobile?',
      timestamp: DateTime.parse('2025-04-04T13:10:00Z'),
      likes: 58,
      comments: 19,
      shares: 0,
      url: 'https://reddit.com/r/flutterhelp/comments/789',
      sentiment: 'neutral',
    ),
    SocialMediaPost(
      platform: 'Twitter',
      postId: 't3',
      username: '@open_source_dev',
      text: 'Open sourcing my Flutter project today! Hope it helps others 💙',
      timestamp: DateTime.parse('2025-04-05T07:10:00Z'),
      likes: 402,
      comments: 61,
      shares: 98,
      url: 'https://twitter.com/open_source_dev/status/789',
      sentiment: 'positive',
    ),
    SocialMediaPost(
      platform: 'Instagram',
      postId: 'i3',
      username: '@code.n.coffee',
      text: 'When you realize your Flutter app looks the same on Android *and* iOS 😍',
      timestamp: DateTime.parse('2025-04-04T10:00:00Z'),
      likes: 888,
      comments: 44,
      shares: 5,
      url: 'https://instagram.com/p/sameonboth',
      sentiment: 'positive',
    ),
    SocialMediaPost(
      platform: 'Facebook',
      postId: 'f3',
      username: 'Emily Clark',
      text: 'I’m struggling with Flutter state management. Any tips?',
      timestamp: DateTime.parse('2025-04-03T11:30:00Z'),
      likes: 34,
      comments: 17,
      shares: 1,
      url: 'https://facebook.com/groups/flutterhelp/post789',
      sentiment: 'neutral',
    ),
    SocialMediaPost(
      platform: 'LinkedIn',
      postId: 'l3',
      username: 'Rajiv Mehta',
      text: 'Gave a talk at DevCon about scalable Flutter architecture. Slides coming soon!',
      timestamp: DateTime.parse('2025-04-02T20:30:00Z'),
      likes: 178,
      comments: 26,
      shares: 11,
      url: 'https://linkedin.com/in/rajivmehta/post/devcon2025',
      sentiment: 'positive',
    ),
    SocialMediaPost(
      platform: 'Twitter',
      postId: 't4',
      username: '@devlife',
      text: 'Debugging Flutter UI like 😵‍💫',
      timestamp: DateTime.parse('2025-04-01T18:15:00Z'),
      likes: 122,
      comments: 10,
      shares: 7,
      url: 'https://twitter.com/devlife/status/123456',
      sentiment: 'neutral',
    ),
    SocialMediaPost(
      platform: 'Reddit',
      postId: 'r4',
      username: 'u/okflutter',
      text: 'Riverpod vs. Bloc – which one do you prefer?',
      timestamp: DateTime.parse('2025-04-01T11:00:00Z'),
      likes: 210,
      comments: 58,
      shares: 4,
      url: 'https://reddit.com/r/flutter/comments/riverpodbloc',
      sentiment: 'neutral',
    ),
    SocialMediaPost(
      platform: 'Facebook',
      postId: 'f4',
      username: 'Carlos Gomez',
      text: 'Flutter finally clicked for me this weekend 🔥',
      timestamp: DateTime.parse('2025-04-05T19:45:00Z'),
      likes: 142,
      comments: 29,
      shares: 6,
      url: 'https://facebook.com/post/flutter-breakthrough',
      sentiment: 'positive',
    ),
    SocialMediaPost(
      platform: 'Instagram',
      postId: 'i4',
      username: '@pixelperfect',
      text: 'Clean UI, clean code 😎✨ #flutterui',
      timestamp: DateTime.parse('2025-04-04T22:00:00Z'),
      likes: 1011,
      comments: 40,
      shares: 18,
      url: 'https://instagram.com/p/pixelperfection',
      sentiment: 'positive',
    ),
    SocialMediaPost(
      platform: 'LinkedIn',
      postId: 'l4',
      username: 'Anita Dev',
      text: 'Just wrapped up a Flutter bootcamp – excited to build my first app!',
      timestamp: DateTime.parse('2025-04-03T16:20:00Z'),
      likes: 230,
      comments: 37,
      shares: 9,
      url: 'https://linkedin.com/in/anitadev/post/flutterbootcamp',
      sentiment: 'positive',
    ),
    SocialMediaPost(
      platform: 'Reddit',
      postId: 'r5',
      username: 'u/darkthemeplease',
      text: 'Dark mode in Flutter is life. Don’t @ me.',
      timestamp: DateTime.parse('2025-04-02T08:40:00Z'),
      likes: 95,
      comments: 10,
      shares: 1,
      url: 'https://reddit.com/r/flutter/comments/darkmode',
      sentiment: 'negative',
    ),
    SocialMediaPost(
      platform: 'Twitter',
      postId: 't5',
      username: '@uxflutter',
      text: 'When the client asks for “just one more screen”… 😩',
      timestamp: DateTime.parse('2025-04-05T06:30:00Z'),
      likes: 275,
      comments: 19,
      shares: 47,
      url: 'https://twitter.com/uxflutter/status/888',
      sentiment: 'negative',
    ),
    SocialMediaPost(
      platform: 'Facebook',
      postId: 'f5',
      username: 'Nina Patel',
      text: 'Do Flutter devs hang out in any Slack or Discord groups?',
      timestamp: DateTime.parse('2025-04-01T13:50:00Z'),
      likes: 67,
      comments: 14,
      shares: 3,
      url: 'https://facebook.com/groups/fluttercommunity/post123',
      sentiment: 'neutral',
    ),
    SocialMediaPost(
      platform: 'Instagram',
      postId: 'i5',
      username: '@flutter.gallery',
      text: 'Sneak peek of our new app design! What do you think? 😍',
      timestamp: DateTime.parse('2025-04-03T12:10:00Z'),
      likes: 1140,
      comments: 88,
      shares: 25,
      url: 'https://instagram.com/p/appdesign',
      sentiment: 'positive',
    ),
    SocialMediaPost(
      platform: 'LinkedIn',
      postId: 'l5',
      username: 'Marcus Lin',
      text: 'Hiring Flutter devs for an exciting startup – remote friendly!',
      timestamp: DateTime.parse('2025-04-02T14:30:00Z'),
      likes: 312,
      comments: 48,
      shares: 22,
      url: 'https://linkedin.com/in/marcuslin/post/flutterjob',
      sentiment: 'positive',
    ),
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(0.2, -0.5), // Adjust for an offset effect
              radius: 1.5, // Adjust the spread
              colors: [
                Color(0xFF190B34), // Purple
                Color(0xFF0A0A0E), // Dark Purple / Black
              ],
              stops: [0.3, 1.0], // Control how colors blend
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 70,
                    child: Row(
                      children: [
                        Container(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.white.withOpacity(0.1),
                                  border: Border.all(
                                      color: Colors.white.withOpacity(0.2))),
                              height: 50,
                              width: 50,
                              child: Center(
                                child: Icon(
                                  Icons.notifications_active_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 35),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Container(
                              child: Center(
                                child: Text(
                                  "SENTINOVA",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.white.withOpacity(0.1),
                                  border: Border.all(
                                      color: Colors.white.withOpacity(0.2))),
                              height: 50,
                              width: 50,
                              child: Center(
                                child: Icon(
                                  Icons.person_2_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 7,
                          ),
                          Row(
                            children: [
                              // GlowingCard(
                              //   text: 'My Glowing Card',
                              //   glowColor: Colors.blue, // Change glow color
                              //   gradientColors: [
                              //     Color(0xFF6A00F4),
                              //     Color(0xFF20002c)
                              //   ], // Custom gradient
                              // ),

                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(child: SocialCardsRow(
                                  scrollLeftToRight: true,
                                  cards: [
                                    FacebookCard(count: "25+"),
                                    InstagramCard(count: "25+"),
                                    RedditCard(count: "10+"),
                                    LinkedinCard(count: "15+"),
                                    TwitterCard(count: "200+"),
                                  ],
                                ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),

                              //MediaCard(icon: Icons.facebook, title: "Facebook", count: "15", primaryColor: Colors.blue)
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 35.0),
                            child: Divider(
                              color: Colors.white,
                              height: 2,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: CustomPaint(
                              painter: CornerBorderPainter(),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.25),
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  height: 300,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          GlassmorphicButton(
                              text: "JOIN THE COMMUNITY",
                              icon: Icons.message,
                              onPressed: () {}),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Report a problem",
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                          SizedBox(
                            height: 15,
                          ),

                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 35.0),
                            child: Divider(
                              color: Colors.white,
                              height: 2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SizedBox(height: 12,),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IssueButton(
                                      label: 'Overcrowding',
                                      icon: ImageIcon(AssetImage('assets/overcrowding.png',), color: Colors.white,), // You can customize per button
                                      onTap: () {
                                        print('Button ${0 + 1} tapped!');
                                      },
                                    ),
                                    IssueButton(
                                      label: 'Long lines',
                                      icon: ImageIcon(AssetImage('assets/queue.png',), color: Colors.white,), // You can customize per button
                                      onTap: () {
                                        print('Button ${0 + 1} tapped!');
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16,),

                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IssueButton(
                                      label: 'Food Issues',
                                      icon: ImageIcon(AssetImage('assets/foodproblems.png',), color: Colors.white,), // You can customize per button
                                      onTap: () {
                                        print('Button ${0 + 1} tapped!');
                                      },
                                    ),
                                    IssueButton(
                                      label: 'Speaker issues',
                                      icon: ImageIcon(AssetImage('assets/speakerissue.png',), color: Colors.white,), // You can customize per button
                                      onTap: () {
                                        print('Button ${0 + 1} tapped!');
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16,),

                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IssueButton(
                                      label: 'Tech Glitches',
                                      icon: ImageIcon(AssetImage('assets/marketing.png',), color: Colors.white,), // You can customize per button
                                      onTap: () {
                                        print('Button ${0 + 1} tapped!');
                                      },
                                    ),
                                    IssueButton(
                                      label: 'Other...',
                                      icon: Icon(Icons.circle, color: Colors.white,) ,// You can customize per button
                                      onTap: () {
                                        print('Button ${0 + 1} tapped!');
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12,),
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 35.0),
                            child: Divider(
                              color: Colors.white,
                              height: 2,
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Share about us!",
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                          SizedBox(
                            height: 15,
                          ),

                          ShareRow(),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Live Posts",
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 35.0),
                            child: Divider(
                              color: Colors.white,
                              height: 2,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SocialStream(allPosts: dummyPosts),
                          SizedBox(
                            height: 25,
                          ),

                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 35.0),
                            child: Divider(
                              color: Colors.white,
                              height: 2,
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Leave us some feedback",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromRGBO(255, 255, 255, 0.5), // glow
                                    blurRadius: 15,
                                    spreadRadius: 2,
                                    offset: const Offset(0, 0),
                                    blurStyle: BlurStyle.outer
                                  ),
                                ],
                              ),
                              child: ExpandableTextField(
                                label: "Description",
                                hint: "Type your text here...",
                                controller: TextEditingController(),

                              ),
                            ),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Text(
                            "With ❤️ by Team Runtime Error",
                            style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),
                          ),


                          // Padding(
                          //   padding: const EdgeInsets.all(16.0),
                          //   child: GridView.count(
                          //     shrinkWrap: true,
                          //     crossAxisCount: 2,
                          //     crossAxisSpacing: 16,
                          //     mainAxisSpacing: 16,
                          //     controller: null,
                          //     children: List.generate(6, (index) {
                          //       return GlassmorphicIconButton(
                          //         label: 'Btn ${index + 1}',
                          //         icon: Icons.star, // You can customize per button
                          //         onTap: () {
                          //           print('Button ${index + 1} tapped!');
                          //         },
                          //       );
                          //     }),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
