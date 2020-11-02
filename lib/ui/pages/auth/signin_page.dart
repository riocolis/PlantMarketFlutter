part of pages;

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isloading = false;

  UserCubit _userCubit;
  PlantCubit _plantCubit;
  TransactionCubit _transactionCubit;

  @override
  void initState() {
    _userCubit = context.bloc<UserCubit>();
    _plantCubit = context.bloc<PlantCubit>();
    _transactionCubit = context.bloc<TransactionCubit>();
    super.initState();
  }

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
      onpressed: _onpressedSignIn,
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

  void _onpressedSignIn() async {
    setState(() {
      isloading = true;
    });
    await _userCubit.signIn(emailController.text, passwordController.text);
    if (_userCubit.state is UserLoaded) {
      _plantCubit.getFoods();
      _transactionCubit.getTransaction();
      Get.off(MainPage());
    } else {
      Get.snackbar("", "",
          backgroundColor: Colors.red,
          icon: Icon(MdiIcons.closeCircleOutline, color: Colors.white),
          titleText: Text("Sign In Failed",
              style:
                  defaultwhiteFontStyle.copyWith(fontWeight: FontWeight.w600)),
          messageText: Text((_userCubit.state as UserLoadingFailed).message,
              style: defaultwhiteFontStyle),
          duration: Duration(seconds: 2),
          isDismissible: false, onTap: (_) {
        Get.back();
      });
      setState(() {
        isloading = false;
      });
    }
  }
}
