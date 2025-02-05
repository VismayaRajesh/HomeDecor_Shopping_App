import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homedecor_shopping_app/view/view_model/wishicon_bloc/wishiconbloc_event.dart';
import 'package:homedecor_shopping_app/view/view_model/wishicon_bloc/wishiconbloc_state.dart';

class WishBloc extends Bloc<WishiconEvent, WishState> {
  WishBloc() : super(WishInitial()) {
    on<ToggleWishEvent>((event, emit) {
      if (state is WishInitial) {
        final currentState = state as WishInitial;
        final wishItems = Set<String>.from(currentState.wishItems);

        if (wishItems.contains(event.productId)) {
          wishItems.remove(event.productId);
        } else {
          wishItems.add(event.productId);
        }

        emit(WishInitial(wishItems: wishItems));
      }
    });
  }
}
