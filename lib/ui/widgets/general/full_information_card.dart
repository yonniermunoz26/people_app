part of '../widgets.dart';

class FullInformationCard extends StatelessWidget {
  const FullInformationCard({
    super.key,
    required this.person,
  });

  final Person person;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 400,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(80),
            ),
          ),
        ),
      ),
    );
  }
}
