part of 'detail.dart';

class DetailScreen extends ConsumerWidget {
  const DetailScreen({
    super.key,
    required this.person,
  });

  final Person person;

  static Route goTo(Person person) => MaterialPageRoute(
        builder: (_) => DetailScreen(person: person),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final service = ref.read(launchUrlProvider);
    return Scaffold(
      backgroundColor: kBackgrounColor,
      body: Column(
        children: [
          PresentationHeader(
            person: person,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  AtributeCard(
                    icon: Icons.wrong_location_rounded,
                    title: 'Localización',
                    description: person.location?.fullLocation ?? '',
                    onTap: () => service.openGoogleMaps(
                      context,
                      latitude: person.location?.latitude ?? 0,
                      longitude: person.location?.longitude ?? 0,
                    ),
                  ),
                  AtributeCard(
                    icon: Icons.email,
                    title: 'Correo electrónico',
                    description: person.email ?? '',
                    onTap: () => service.openEmailApp(person.email ?? ''),
                  ),
                  AtributeCard(
                    icon: Icons.phone,
                    title: 'Número telefónico',
                    description: person.cell ?? '',
                    onTap: () => service.openPhoneApp(person.cell ?? ''),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
