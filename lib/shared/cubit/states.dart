abstract class StateNewsApp {}

class AppInitialState extends StateNewsApp {}

class AppBottomNavState extends StateNewsApp {}

class AppChangeIndexState extends StateNewsApp {}

class AppGetBusinessLoadingState extends StateNewsApp {}

class AppGetBusinessSuccessState extends StateNewsApp {}

class AppGetBusinessErrorState extends StateNewsApp {
  final String error;

  AppGetBusinessErrorState(this.error);
}

class AppGetSportsLoadingState extends StateNewsApp {}

class AppGetSportsSuccessState extends StateNewsApp {}

class AppChangeThemeModeState extends StateNewsApp {}

class AppGetSportsErrorState extends StateNewsApp {
  final String error;

  AppGetSportsErrorState(this.error);
}

class AppGetScienceLoadingState extends StateNewsApp {}

class AppGetScienceSuccessState extends StateNewsApp {}
class AppGetScienceErrorState extends StateNewsApp {
  final String error;

  AppGetScienceErrorState(this.error);
}


class AppGetSearchSuccessState extends StateNewsApp {}
class AppGetSearchLoadingState extends StateNewsApp {}

class AppGetSearchErrorState extends StateNewsApp {
  final String error;

  AppGetSearchErrorState(this.error);
}


