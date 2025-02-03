import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homedecor_shopping_app/model/Data_Model/sofalistData.dart';

import '../../../constants/my_app_constants.dart';
import '../homepdct_bloc/homepdtbloc_event.dart';

part 'sofapdctbloc_event.dart';
part 'sofapdctbloc_state.dart';

class SofaBloc extends Bloc<SofaEvent, SofaState> {
  SofaBloc() : super(SofaInitial()) {
    on<Loadsofapdt>(_Loadsofapdt);
    }
    void _Loadsofapdt(Loadsofapdt event, Emitter<SofaState> emit) {
      try {
        List<SofaModel> sofaList = [
          SofaModel(
              name: "Brown Armless Sofa",
              imageUrl: MyAppConstants.Productimage,
              price: 156.00,
              rating: '4.5',
              brand : 'My site'
          ),
          SofaModel(
              name: "Eames single chair",
              imageUrl: MyAppConstants.detailschair,
              price: 95.00,
              rating: '4.8',
              brand: 'My art design'
          ),
        ];

        emit(SofapdctLoaded(sofa: sofaList));
      } catch (e) {
        emit(sofaError(message: "Failed to load products"));
      }
    }
  }
