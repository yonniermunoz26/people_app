part of '../widgets.dart';

class ListBuilder extends StatelessWidget {
  const ListBuilder({
    super.key,
    required this.people,
    required this.onTapCard,
    required this.isLoading,
  });

  final List<Person> people;
  final void Function(int index) onTapCard;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverList.separated(
        itemCount: people.length + (isLoading ? 1 : 0),
        itemBuilder: (_, index) {
          if (index != people.length) {
            return PresentationCard(
              person: people[index],
              onTap: () => onTapCard(index),
            );
          }
          return const LoadingData();
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 25,
          );
        },
      ),
    );
  }
}
