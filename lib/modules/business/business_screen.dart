import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitNewsApp, StateNewsApp>(
      listener: (BuildContext context, Object? state) {},
      builder: (BuildContext context, state) {
        List<dynamic> cubit = CubitNewsApp.get(context).business;
        return myConditionalList(
          condition: cubit.isNotEmpty,
          newsType: cubit,
          newsNumber: cubit.length,
        );
      },
    );
  }
}
