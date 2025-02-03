part of 'payment_bloc.dart';

abstract class PaymentState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

class PaymentSuccess extends PaymentState {
  final PaymentSuccessResponse response;
  PaymentSuccess({required this.response});
}

class PaymentFailure extends PaymentState {
  final String error;
  PaymentFailure({required this.error});
}

