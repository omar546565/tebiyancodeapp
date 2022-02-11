
abstract class  SocialRegisterStates {}

class SocialLoginInitialState extends SocialRegisterStates {}

class SocialRegisterLoadingState extends SocialRegisterStates {}

class SocialRegisterSuccessState extends SocialRegisterStates
{}

class SocialRegisterErrorState extends SocialRegisterStates
{
  final String  error;

  SocialRegisterErrorState(this.error);
}

class SocialchangePasswordVisibilityRegisterState extends SocialRegisterStates {}