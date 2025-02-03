part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class StartPayment extends PaymentEvent {
  final double amount;
  final String name;
  final String description;
  final String contact;
  final String email;

  StartPayment({required this.amount, required this.name, required this.description, required this.contact, required this.email});
}

class PaymentSuccessEvent extends PaymentEvent {
  final PaymentSuccessResponse response;
  PaymentSuccessEvent({required this.response});
}


class PaymentFailureEvent extends PaymentEvent {
  final String error;
  PaymentFailureEvent({required this.error});
}