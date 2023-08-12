import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/settings/settings_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CubitNewsApp extends Cubit<StateNewsApp> {
  CubitNewsApp() : super(AppInitialState());
  var searchController=TextEditingController();

  static CubitNewsApp get(context) => BlocProvider.of(context);




  int currentIndex = 0;

  bool isDark = false;

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  List<dynamic> search = [];

  List<BottomNavigationBarItem> bottomItem = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: "Business",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
  ];

  List<Widget> screens = const [
    BusinessScreen(),
    ScienceScreen(),
    SportsScreen(),
    SettingsScreen(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    if (index == 0) {
      return getBusiness();
    }
    if (index == 1) {
      return getScience();
    }

    if (index == 2) {
      getSports();
    }

    emit(AppChangeIndexState());
  }

  void getBusiness() {
    if (business.isEmpty) {
      emit(AppGetBusinessLoadingState());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'business',
          'apiKey': '4f30a7bc0b864b35aeec9ba9378f834e',
        },
      ).then((value) {
        business = value?.data['articles'];
        debugPrint('this is the BusinessData from API ${business[0]['title']}');
        emit(AppGetBusinessSuccessState());
      }).catchError((getApiError) {
        debugPrint(
            "there is error in get BusinessData from API which is $getApiError");
        emit(AppGetBusinessErrorState(getApiError.toString()));
      });
    } else {
      emit(AppGetBusinessSuccessState());
    }
  }

  void getSports() {
    if (sports.isEmpty) {
      emit(AppGetSportsLoadingState());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'sports',
          'apiKey': '4f30a7bc0b864b35aeec9ba9378f834e',
        },
      ).then((value) {
        sports = value?.data['articles'];
        debugPrint('this is the SportsData from API ${sports[0]['title']}');
        emit(AppGetSportsSuccessState());
      }).catchError((getApiError) {
        debugPrint(
            "there is error in get SportsData from API which is $getApiError");
        emit(AppGetSportsErrorState(getApiError.toString()));
      });
    } else {
      emit(AppGetSportsSuccessState());
    }
  }

  void getScience() {
    if (science.isEmpty) {
      emit(AppGetScienceLoadingState());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'science',
          'apiKey': '4f30a7bc0b864b35aeec9ba9378f834e',
        },
      ).then((value) {
        science = value?.data['articles'];
        debugPrint('this is the ScienceData from API ${science[0]['title']}');
        emit(AppGetScienceSuccessState());
      }).catchError((getApiError) {
        debugPrint(
            "there is error in get ScienceData from API which is $getApiError");
        emit(AppGetScienceErrorState(getApiError.toString()));
      });
    } else {
      emit(AppGetScienceSuccessState());
    }
  }







  void getSearch(
    String? value,
  ) {

    emit(AppGetSearchLoadingState());



    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey': '4f30a7bc0b864b35aeec9ba9378f834e',
      },
    ).then((value) {
      search = value?.data['articles'];
      debugPrint('this is the ScienceData from API ${search[0]['title']}');
      emit(AppGetSearchSuccessState());
    }).catchError((getApiError) {
      debugPrint(
          "there is error in get SearchData from API which is $getApiError");
      emit(AppGetSearchErrorState(getApiError.toString()));
    });
  }

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
    } else {
      isDark = !isDark;
    }
    CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
      emit(AppChangeThemeModeState());
    }).catchError((error) {
      debugPrint('555555555555555555555555555555555555555555555555555555555555');
    });
  }
}
