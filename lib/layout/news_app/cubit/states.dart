abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

class NewsgetBusinessLoadingState extends NewsStates {}

class NewsgetBusinessSuccessState extends NewsStates {}

class NewsgetBusinessErrorState extends NewsStates {
  final String error;
  NewsgetBusinessErrorState(this.error);

}

class NewsgetSportsLoadingState extends NewsStates {}

class NewsgetSportsSuccessState extends NewsStates {}

class NewsgetSportsErrorState extends NewsStates {
  final String error;
  NewsgetSportsErrorState(this.error);

}

class NewsgetScienceLoadingState extends NewsStates {}

class NewsgetScienceSuccessState extends NewsStates {}

class NewsgetScienceErrorState extends NewsStates {
  final String error;
  NewsgetScienceErrorState(this.error);

}

class NewsgetSearchLoadingState extends NewsStates {}

class NewsgetSearchSuccessState extends NewsStates {}

class NewsgetSearchErrorState extends NewsStates {
  final String error;
  NewsgetSearchErrorState(this.error);

}