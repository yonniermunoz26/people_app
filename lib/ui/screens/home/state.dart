part of 'home.dart';

class HomeState {
  final bool isLoading;
  final String? filter;
  final List<Person> people;

  HomeState({
    required this.isLoading,
    required this.people,
    this.filter,
  });

  factory HomeState.initial() => HomeState(
        isLoading: false,
        people: [],
      );

  HomeState copyWith({
    bool? isLoading,
    List<Person>? people,
    String? filter,
    bool resetFilter = false,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      people: people ?? this.people,
      filter: resetFilter ? null : (filter ?? this.filter),
    );
  }
}
