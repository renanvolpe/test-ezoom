import 'package:coolmovies/core/extensions/resumed_sizedbox.dart';
import 'package:coolmovies/presentation/commum_widgets/defaults/loading_shimmer_default.dart';
import 'package:flutter/material.dart';

class ShimmerNoticePage extends StatelessWidget {
  const ShimmerNoticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          15.sizeH,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: LoadingShimmerDefault(height: 40),
          ),
          15.sizeH,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: LoadingShimmerDefault(height: 40),
          ),
          for (int i = 0; i < 10; i++) ...[
            15.sizeH,
            Row(
              children: [
                15.sizeW,
                const Expanded(child: LoadingShimmerDefault(height: 100)),
                15.sizeW,
                const Expanded(child: LoadingShimmerDefault(height: 100)),
                15.sizeW,
              ],
            ),
          ]
        ],
      ),
    );
  }
}
