part of 'home.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final ScrollController controller = ScrollController();
  final FocusNode focusNode = FocusNode();
  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () {
        ref.read(homeProvider.notifier).getUsers(firstTime: true);
      },
    );
    controller.addListener(
      () {
        if (controller.position.pixels == controller.position.maxScrollExtent) {
          ref.read(homeProvider.notifier).getUsers();
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeProvider);
    final viewModel = ref.read(homeProvider.notifier);
    return GestureDetector(
      onTap: () {
        focusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: kBackgrounColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () => viewModel.reloadData(context, controller),
          child: const Icon(
            Icons.refresh,
            color: kForegrounColor,
          ),
        ),
        body: SafeArea(
          child: CustomScrollView(
            controller: controller,
            slivers: [
              SliverPersistentHeader(
                floating: true,
                pinned: true,
                delegate: PersistentTextField(
                  onChanged: viewModel.filterResults,
                  focusNode: focusNode,
                ),
              ),
              ListBuilder(
                people: state.people
                    .where(
                      (p) => p.fullname.contains(state.filter ?? ''),
                    )
                    .toList(),
                onTapCard: (index) => viewModel.onTapCard(
                  context,
                  index,
                  focusNode,
                ),
                isLoading: state.isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
