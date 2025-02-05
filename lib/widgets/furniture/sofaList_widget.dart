import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homedecor_shopping_app/widgets/furniture/sofa_widget.dart';

import '../../view/view_model/sofapdct_bloc/sofapdctbloc_bloc.dart';

class SofalistWidget extends StatelessWidget {
  const SofalistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<SofaBloc, SofaState>(
        builder: (context, state) {
          if (state is SofaInitial) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SofapdctLoaded) {
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 8,
                childAspectRatio: 0.7,
              ),
              itemCount: state.sofa.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SofaWidget(sofa: state.sofa[index]),
                );
              },
            );
          } else if (state is sofaError) {
            return Center(child: Text(state.message, style: TextStyle(color: Colors.red)));
          }
          return Center(child: Text("Something went wrong"));
        },
      ),
    );
  }
}
