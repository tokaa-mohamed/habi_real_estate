part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<PropertyEntity> bestOffers;
  final List<PropertyEntity> nearestProperties;

  const HomeLoaded({
    required this.bestOffers,
    required this.nearestProperties,
  });

  @override
  List<Object> get props => [bestOffers, nearestProperties];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object> get props => [message];
}