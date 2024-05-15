import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ListMediumShimmerWidget extends StatelessWidget {
  const ListMediumShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
      highlightColor: Theme.of(context).colorScheme.secondary.withOpacity(0.13),
      direction: ShimmerDirection.ltr,
      period: const Duration(milliseconds: 500),
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          itemCount: 2,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.only(right: 24),
              child: SizedBox(
                width: 300,
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
