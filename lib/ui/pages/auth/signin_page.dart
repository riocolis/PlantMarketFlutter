part of pages;

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: '$titleSignIn',
      subtitle: '$subtitleSignIn',
      child: _buildBody(),
    );
  }

  _buildBody() {
    return Column(
      children: [
        _buildTextFieldEmail(),
        _buildTextFieldPassword(),
        _buildSignInButton(),
        _buildCreateAccountButton(),
      ],
    );
  }

  _buildTextFieldEmail() {
    return TitleTextField(
      textEditingController: emailController,
      title: 'Email Address',
      hintTextField: 'Type your email address',
      styleTitle: blackFont22Style,
    );
  }

  _buildTextFieldPassword() {
    return TitleTextField(
      textEditingController: passwordController,
      title: 'Password',
      hintTextField: 'Type your password',
      styleTitle: blackFont22Style,
      isSecond: true,
    );
  }

  _buildSignInButton() {
    return LoadingButtonText(
      isLoading: isloading,
      onpressed: () {},
      textButton: 'Sign In',
      styleTextButton: defaultwhiteFontStyle.copyWith(
          fontWeight: FontWeight.w500, fontSize: 20),
      buttonColor: mainColor,
    );
  }

  _buildCreateAccountButton() {
    return LoadingButtonText(
      isLoading: isloading,
      onpressed: () {
        Get.to(SignUpPage());
      },
      textButton: 'Create Account',
      styleTextButton: defaultwhiteFontStyle.copyWith(
          fontWeight: FontWeight.w500, fontSize: 20),
      buttonColor: mainGreyColor,
      isSecond: true,
    );
  }
}
