import 'package:flutter/material.dart';

class ShareRow extends StatelessWidget {
  const ShareRow({super.key});

  @override
  Widget build(BuildContext context) {
    final shareButtons = [
      {
        'path': 'assets/facebook_share.png',
        'onTap': () => print('Share to Facebook')
      },
      {'path': 'assets/x_share.png', 'onTap': () => print('Share to Twitter')},
      {
        'path': 'assets/instagram_share.png',
        'onTap': () => print('Share to Instagram')
      },
      {
        'path': 'assets/linkedin_share.png',
        'onTap': () => print('Share to LinkedIn')
      },
      {
        'path': 'assets/reddit_share.png',
        'onTap': () => print('Share to WhatsApp')
      },
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: shareButtons.map((btn) {
        return Container(
          child: GlowingShareIcon(
            imagePath: btn['path'] as String,
            onTap: btn['onTap'] as VoidCallback,
          ),
        );
      }).toList(),
    );
  }
}

class GlowingShareIcon extends StatefulWidget {
  final String imagePath;
  final VoidCallback onTap;

  const GlowingShareIcon({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  @override
  State<GlowingShareIcon> createState() => _GlowingShareIconState();
}

class _GlowingShareIconState extends State<GlowingShareIcon> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isTapped = true),
      onTapUp: (_) {
        setState(() => _isTapped = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isTapped = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: _isTapped
              ? [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.7),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ]
              : [],
        ),
        child: AnimatedScale(
            duration: const Duration(milliseconds: 10),
            scale: _isTapped ? 1.1 : 1.0,
            child: Stack(
              children: [
                Image.asset(widget.imagePath, width: 40, height: 40),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Container(
                      width: 36, height: 36,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white.withOpacity(0.9),
                            // reddit orange glow
                            blurRadius: 10,
                            offset: Offset(0, 0),
                            blurStyle: BlurStyle.outer),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
