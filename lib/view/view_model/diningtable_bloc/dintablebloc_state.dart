
import 'package:equatable/equatable.dart';
import 'package:homedecor_shopping_app/model/Data_Model/dintableData.dart';

abstract class DintableState extends Equatable {
  const DintableState();

  @override
  List<Object?> get props => [];
}

final class DintableInitial extends DintableState {
}

class dinpdctLoaded extends DintableState {
  final List<DintableModel> din;

  const dinpdctLoaded({required this.din});

  @override
  List<Object?> get props => [din];
}

class dinError extends DintableState {
  final String message;
  const dinError({required this.message});

  @override
  List<Object?> get props => [message];
}

