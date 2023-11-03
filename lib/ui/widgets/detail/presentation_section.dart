part of '../widgets.dart';

class PresentationHeader extends StatelessWidget {
  const PresentationHeader({
    Key? key,
    required this.person,
  }) : super(key: key);

  final Person person;

  @override
  Widget build(BuildContext context) {
    final res = MediaQuery.of(context).size;
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(40),
            ),
            child: Container(
              foregroundDecoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset.bottomCenter,
                  end: FractionalOffset.topCenter,
                  stops: [0, 0.7],
                  colors: [
                    Colors.black38,
                    Color.fromRGBO(0, 0, 0, 0),
                  ],
                ),
              ),
              color: Colors.black54,
              height: res.height * 0.50,
              width: res.width,
              child: Image.network(
                person.image ?? '',
                fit: BoxFit.cover,
                errorBuilder: (_, e, s) => const SizedBox(),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(16),
              gradient: const RadialGradient(
                colors: [
                  kSecondaryColor,
                  kPrimaryColor,
                ],
                stops: [0.1, 2.0],
              ),
            ),
            child: Icon(
              IconFrom.gender(person.gender),
              size: 35,
              color: kForegrounColor,
            ),
          ),
        ),
        Positioned(
          bottom: 35,
          child: SizedBox(
            width: res.width,
            child: Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      person.fullname,
                      style: const TextStyle(
                        color: kForegrounColor,
                        height: 2,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '${person.age} años',
                      style: const TextStyle(
                        color: Colors.white,
                        height: 2,
                        fontSize: 18,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                const SizedBox(width: 15),
              ],
            ),
          ),
        ),
        Positioned(
          left: 10,
          top: 50,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.white,
              shadows: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 4,
                  spreadRadius: 50,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
