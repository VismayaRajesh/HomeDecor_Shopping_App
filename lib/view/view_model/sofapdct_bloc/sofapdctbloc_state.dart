part of 'sofapdctbloc_bloc.dart';

abstract class SofaState extends Equatable {
  const SofaState();

  @override
  List<Object?> get props => [];
}

final class SofaInitial extends SofaState {}

class SofapdctLoaded extends SofaState {
  final List<SofaModel> sofa;

  const SofapdctLoaded({required this.sofa});

  @override
  List<Object?> get props => [sofa];
}

class sofaError extends SofaState {
  final String message;
  const sofaError({required this.message});

  @override
  List<Object?> get props => [message];
}

