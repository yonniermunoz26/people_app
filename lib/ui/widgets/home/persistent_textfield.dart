part of '../widgets.dart';

class PersistentTextField extends SliverPersistentHeaderDelegate {
  final void Function(String text) onChanged;
  final FocusNode focusNode;

  const PersistentTextField({
    required this.onChanged,
    required this.focusNode,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: kBackgrounColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              focusNode: focusNode,
              onChanged: onChanged,
              style: const TextStyle(color: kForegrounColor),
              decoration: InputDecoration(
                label: const Text("Buscar un nombre"),
                labelStyle: const TextStyle(
                  color: Colors.white,
                ),
                floatingLabelStyle: const TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0),
                ),
                filled: true,
                hoverColor: kForegrounColor,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(80),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(0, 0, 0, 0),
                  ),
                ),
                fillColor: kSecondaryColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(80),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(0, 0, 0, 0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
