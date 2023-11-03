part of '../widgets.dart';

class LoadingData extends StatelessWidget {
  const LoadingData({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: List.generate(
            10,
            (index) => Padding(
              padding: const EdgeInsets.only(
                left: 60,
                bottom: 10,
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(1, 3),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: const SizedBox(
                  height: 90,
                  width: double.infinity,
                ),
              ),
            ),
          ),
        ),
        Shimmer.fromColors(
          baseColor: kPrimaryColor,
          highlightColor: Colors.white,
          child: Column(
            children: List.generate(
              10,
              (index) => const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    ShimmerContainer.circular(
                      diameter: 80,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 90,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ShimmerContainer.linear(
                              width: 200,
                              height: 15,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            ShimmerContainer.linear(
                              width: 150,
                              height: 15,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                ShimmerContainer.linear(
                                  width: 20,
                                  height: 15,
                                ),
                                Spacer(),
                                ShimmerContainer.linear(
                                  width: 20,
                                  height: 15,
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
