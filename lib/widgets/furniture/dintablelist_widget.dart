import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homedecor_shopping_app/view/view_model/diningtable_bloc/dintablebloc_bloc.dart';
import 'package:homedecor_shopping_app/view/view_model/diningtable_bloc/dintablebloc_state.dart';
import 'package:homedecor_shopping_app/widgets/furniture/dintable_widget.dart';

class DintablelistWidget extends StatelessWidget {
  const DintablelistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<DintableBloc, DintableState>(
        builder: (context, state) {
          if (state is DintableInitial) {
            return Center(child: CircularProgressIndicator());
          } else if (state is dinpdctLoaded) {
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 8,
                childAspectRatio: 0.7,
              ),
              itemCount: state.din.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: DintableWidget(din: state.din[index]),
                );
              },
            );
          } else if (state is dinError) {
            return Center(child: Text(state.message, style: TextStyle(color: Colors.red)));
          }
          return Center(child: Text("Something went wrong"));
        },
      ),
    );
  }
}
