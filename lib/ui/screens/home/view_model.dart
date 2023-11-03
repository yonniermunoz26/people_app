part of 'home.dart';

class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel(this.ref) : super(HomeState.initial());

  final StateNotifierProviderRef<HomeViewModel, HomeState> ref;

  Future<void> getUsers({
    int count = 10,
    bool firstTime = false,
  }) async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true);
    if (firstTime) {
      await Future.delayed(
        const Duration(milliseconds: 500),
      );
    }
    await ref
        .read(getUsersUseCaseProvider)
        .call(
          results: count,
        )
        .then(
          (value) => value.when(
            fail: (fail) {
              debugPrint(fail.description);
            },
            success: (success) {
              state = state.copyWith(
                people: [
                  ...state.people,
                  ...success,
                ],
              );
            },
          ),
        );
    state = state.copyWith(isLoading: false);
  }

  Future<void> reloadData(
    BuildContext context,
    ScrollController controller,
  ) async {
    final bool? result = await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => const CustomAlertDialog(),
    );
    if (result ?? false) {
      state = state.copyWith(
        people: [],
      );
      controller.jumpTo(0);
      getUsers();
    }
  }

  void onTapCard(BuildContext context, int index, FocusNode focusNode) {
    focusNode.unfocus();
    Navigator.push(
      context,
      DetailScreen.goTo(
        state.people[index],
      ),
    );
  }

  void filterResults(String? filter) {
    if (filter?.trim().isEmpty ?? false || filter == null) {
      state = state.copyWith(resetFilter: true);
    } else {
      state = state.copyWith(filter: filter);
    }
  }

  void resetFilter() {
    state = state.copyWith(resetFilter: true);
  }
}
