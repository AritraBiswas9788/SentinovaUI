import 'package:flutter/material.dart';
import 'package:sentinova_hackfest/components/cards_row.dart';
import 'package:sentinova_hackfest/components/facebook_post.dart';
import 'package:sentinova_hackfest/components/instagram_post.dart';
import 'package:sentinova_hackfest/components/linkedin_post.dart';
import 'package:sentinova_hackfest/components/reddit_post.dart';
import 'package:sentinova_hackfest/components/twitter_post.dart';
import 'package:sentinova_hackfest/dataclass/SocialMediaPost.dart';

class SocialStream extends StatelessWidget {
  final List<SocialMediaPost> allPosts;

  const SocialStream({super.key, required this.allPosts});

  List<Widget> mapPostsToCards(List<SocialMediaPost> posts) {
    return posts.map((post) {
      switch (post.platform.toLowerCase()) {
        case 'twitter':
          return TwitterPost(post: post);
        case 'facebook':
          return FacebookPost(post: post);
        case 'instagram':
          return InstagramPost(post: post);
        case 'reddit':
          return RedditPost(post: post);
        case 'linkedin':
          return LinkedinPost(post: post);
        default:
          return const SizedBox(); // fallback
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final half = (allPosts.length / 2).ceil();
    final firstHalf = allPosts.sublist(0, half);
    final secondHalf = allPosts.sublist(half);

    final firstRowCards = mapPostsToCards(firstHalf);
    final secondRowCards = mapPostsToCards(secondHalf);

    return Column(
      children: [
        SocialCardsRow(cards: firstRowCards, scrollLeftToRight: true),
        const SizedBox(height: 16),
        SocialCardsRow(cards: secondRowCards, scrollLeftToRight: false),
      ],
    );
  }
}
