abstract class IAuthInterface {
  Future signIn({
    required userName,
    required password,
  });
}
