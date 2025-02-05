import 'package:bloc/bloc.dart';
import 'package:homedecor_shopping_app/view/screen/diningtable_screen.dart';

import '../../../constants/my_app_constants.dart';
import '../../../model/Data_Model/furnieData.dart';
import '../../screen/Sofa_screen.dart';

part 'furniturebloc_event.dart';
part 'furniturebloc_state.dart';

class FurnitureblocBloc extends Bloc<FurnitureblocEvent, FurnitureblocState> {
  FurnitureblocBloc() : super(FurnitureblocInitial()) {
    on<LoadCategoriesEvent>((event, emit) async {
      emit(CategoriesLoading());
      try {
        await Future.delayed(Duration(seconds: 1));
        final categories = [
          Category(
              title: 'Dining Table',
              imageUrl: MyAppConstants.diningtable, space: 108,
              route: DiningtableScreen(userName: event.userName,)
          ),
          Category(
            title: 'Bed',
            imageUrl: MyAppConstants.bed, space: 174,
          ),
          Category(
            title: 'Chair',
            imageUrl: MyAppConstants.chair, space: 160,
          ),
          Category(
            title: 'Table',
            imageUrl: MyAppConstants.table, space: 160,
          ),
          Category(
            title: 'Stool',
            imageUrl: MyAppConstants.stool, space: 160,
          ),
          Category(
            title: 'Sofas',
            imageUrl: MyAppConstants.sofas, space: 160,
            route: SofaScreen(userName: event.userName),
          ),
          Category(
            title: 'Wardrobe',
            imageUrl: MyAppConstants.wardrobe, space: 128,
          ),
          Category(
            title: 'Cabnet',
            imageUrl: MyAppConstants.cabnet, space: 148,
          ),
          Category(
            title: 'Lamp',
            imageUrl: MyAppConstants.lamp, space: 160,
          ),
          Category(
            title: 'BookShelf',
            imageUrl: MyAppConstants.bookshelf, space: 124,
          ),
        ];
        emit(CategoriesLoaded(categories));
      } catch (e) {
        emit(CategoriesError("Failed to load categories."));
      }
    });
  }
}
