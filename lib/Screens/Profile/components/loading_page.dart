import 'package:flutter/material.dart';
import '../../../constants.dart';
import './skeleton.dart';

import './loading_card.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleSkeleton(size: 120),
        const SizedBox(width: defaultPadding),
        Padding(
          padding: EdgeInsets.symmetric(vertical: defaultPadding),
          child: NewsCardSkelton(),
        ),
         NewsCardSkelton(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: defaultPadding),
          child: NewsCardSkelton(),
        ),
         NewsCardSkelton()
      ],
    );
  }
}

class NewsCardSkelton extends StatelessWidget {
  const NewsCardSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Skeleton(width: 80),
              const SizedBox(height: defaultPadding / 2),
              const Skeleton(),
              const SizedBox(height: defaultPadding / 2),
              const Skeleton(),
              const SizedBox(height: defaultPadding / 2),
              Row(
                children: const [
                  Expanded(
                    child: Skeleton(),
                  ),
                  SizedBox(width: defaultPadding),
                  Expanded(
                    child: Skeleton(),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
