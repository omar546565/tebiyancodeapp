
abstract class  SocialStates {}


class SocialInitialState extends SocialStates{}

class SocialChangeBottomNavState extends SocialStates{}
class SocialNewPostState extends SocialStates{}

class SocialProfileImagePickedSuccessState extends SocialStates{}
class SocialProfileImagePickedErrorState extends SocialStates{}

class SocialCoverImagePickedSuccessState extends SocialStates{}
class SocialCoverImagePickedErrorState extends SocialStates{}


class SocialGetUserLoadingState extends SocialStates{}

class SocialGetUserSuccessState extends SocialStates{}

class SocialGetUserErrorState extends SocialStates{
  final String error;

  SocialGetUserErrorState(this.error);
}

