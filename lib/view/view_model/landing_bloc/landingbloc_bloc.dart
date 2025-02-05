import 'package:bloc/bloc.dart';

part 'landingbloc_event.dart';
part 'landingbloc_state.dart';

class LandingblocBloc extends Bloc<LandingblocEvent, LandingblocState> {
  LandingblocBloc() : super(LandingPage1()) {
    on<NavigateToNextPage>((event, emit) {
      emit(LandingPage2());
    });
    on<NavigateToLogin>((event, emit) {
      emit(Login());
    });
  }
}
