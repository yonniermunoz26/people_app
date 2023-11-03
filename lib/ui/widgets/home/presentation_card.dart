part of '../widgets.dart';

class PresentationCard extends StatelessWidget {
  const PresentationCard({
    super.key,
    required this.person,
    required this.onTap,
  });

  final Person person;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50),
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
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 40,
                ),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nombre: ${person.fullname}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kForegrounColor,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "De: ${person.location?.country}",
                          maxLines: 1,
                          style: const TextStyle(color: kForegrounColor),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Edad: ${person.age}",
                          style: const TextStyle(
                            color: kForegrounColor,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Icon(
                      IconFrom.gender(person.gender),
                      size: 40,
                      color: kForegrounColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
          PhysicalModel(
            color: kForegrounColor,
            borderRadius: BorderRadius.circular(100),
            elevation: 7,
            child: Padding(
              padding: const EdgeInsets.all(1),
              child: ClipOval(
                child: Image.network(
                  person.image ?? '',
                  height: 80,
                  width: 80,
                  errorBuilder: (context, error, stackTrace) => const SizedBox(
                    height: 80,
                    width: 80,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
