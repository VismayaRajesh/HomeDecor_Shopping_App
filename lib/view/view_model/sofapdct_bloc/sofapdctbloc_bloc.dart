import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homedecor_shopping_app/model/Data_Model/sofalistData.dart';

import '../../../constants/my_app_constants.dart';

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
              rating: '4.6',
              brand : 'My site'
          ),
          SofaModel(
              name: "Eng roll arm 2 seater...",
              imageUrl: MyAppConstants.imgs1,
              price: 150.00,
              rating: '4.5',
              brand: 'Boho home'
          ),
          SofaModel(
              name: "Brown 3 seater sofa",
              imageUrl: MyAppConstants.imgs2,
              price: 120.00,
              rating: '3.9',
              brand: 'Boho'
          ),
          SofaModel(
              name: "Grey lawson family sofa",
              imageUrl: MyAppConstants.imgs3,
              price: 156.00,
              rating: '4.0',
              brand: 'Urban decor'
          ),
          SofaModel(
              name: "Royal grey velvet sofa",
              imageUrl: MyAppConstants.imgs4,
              price: 175.00,
              rating: '4.2',
              brand: 'My site'
          ),
          SofaModel(
              name: "Rounded 2 seater sofa...",
              imageUrl: MyAppConstants.imgs5,
              price: 56.00,
              rating: '4.1',
              brand: 'Urban decor  '
          ),
          SofaModel(
              name: "Tufted armless 3 seater...",
              imageUrl: MyAppConstants.imgs6,
              price: 120.00,
              rating: '4.1',
              brand: 'My art design'
          ),
          SofaModel(
              name: "Wood lounge 3 seater...",
              imageUrl: MyAppConstants.imgs7,
              price: 140.00,
              rating: '4.4',
              brand: 'My art design'
          ),
        ];

        emit(SofapdctLoaded(sofa: sofaList));
      } catch (e) {
        emit(sofaError(message: "Failed to load products"));
      }
    }
  }
