import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return BlocConsumer<CubitNewsApp, StateNewsApp>(
      listener: (context, state) {},
      builder: (context, state) {
        var searchList = CubitNewsApp.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: myTextFormField(
                  onChanged: (value) {
                    CubitNewsApp.get(context).getSearch(value);
                    return null;
                  },
                  prefixIcon: const Icon(Icons.search),
                  //prefix: Icon(Icons.search),
                  controller: searchController,
                  type: TextInputType.text,
                  labelText: 'Search',
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'Search is required';
                    }
                    return null;
                  },
                ),
              ),
              Expanded(
                child: myConditionalList(
                    condition: searchList.isNotEmpty,
                    newsType: searchList,
                    newsNumber: searchList.length,
                isLoading: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
