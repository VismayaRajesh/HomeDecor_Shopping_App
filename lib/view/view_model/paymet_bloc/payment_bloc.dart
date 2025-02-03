import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  late Razorpay _razorpay;
  PaymentBloc() : super(PaymentInitial()) {
    _razorpay = Razorpay();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    on<StartPayment>(_onStartPayment);
  }

  void _onStartPayment(StartPayment event, Emitter<PaymentState> emit) {
    emit(PaymentLoading());

    var options = {
      'key': 'rzp_live_ILgsfZCZoFIKMb', // Replace with your Razorpay key
      'amount': event.amount * 100,
      'name': event.name,
      'description': event.description,
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {
        'contact': event.contact,
        'email': event.email,
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      emit(PaymentFailure(error: e.toString()));
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    add(PaymentSuccessEvent(response: response));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    add(PaymentFailureEvent(error: response.message ?? 'Payment failed'));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("External Wallet Selected: ${response.walletName}");
  }

  @override
  Future<void> close() {
    _razorpay.clear();
    return super.close();
  }
}


