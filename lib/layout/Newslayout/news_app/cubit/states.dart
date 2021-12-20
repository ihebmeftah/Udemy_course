abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

//NewsGetBusiness
class NewsGetBusinessLoadingState extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}

class NewsGetBusinessErorState extends NewsStates {
  final String error;

  NewsGetBusinessErorState(this.error);
}

//NewsGetSports
class NewsGetSportsLoadingState extends NewsStates {}

class NewsGetSportsSuccessState extends NewsStates {}

class NewsGetSportsErorState extends NewsStates {
  final String error;

  NewsGetSportsErorState(this.error);
}

//NewsGetSciences
class NewsGetSciencesLoadingState extends NewsStates {}

class NewsGetSciencesSuccessState extends NewsStates {}

class NewsGetSciencesErorState extends NewsStates {
  final String error;

  NewsGetSciencesErorState(this.error);
}

//search
class NewsGetsearchLoadingState extends NewsStates {}

class NewsGetsearchSuccessState extends NewsStates {}

class NewsGetsearchErorState extends NewsStates {
  final String error;

  NewsGetsearchErorState(this.error);
}