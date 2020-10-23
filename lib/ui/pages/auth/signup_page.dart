part of pages;

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: '$titleSignUp',
      subtitle: '$subtitleSignUp',
      onBackButtonPressed: () {
        Get.back();
      },
      child: _buildBody(),
    );
  }

  _buildBody() {
    return Column(
      children: [
        _buildImage(),
        _buildTextFieldName(),
        _buildTextFieldEmail(),
        _buildTextFieldPassword(),
        _buildSignUpButton(),
        Padding(padding: EdgeInsets.only(bottom: 100))
      ],
    );
  }

  _buildImage() {
    return ImageCircle();
  }

  _buildTextFieldName() {
    return TitleTextField(
      textEditingController: nameController,
      title: 'Full Name',
      hintTextField: 'Type your Full Name',
      styleTitle: blackFont22Style,
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

  _buildSignUpButton() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: defaultMargin),
      height: 45,
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: RaisedButton(
        onPressed: () {
          Get.to(AddressPage());
        },
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        color: mainColor,
        child: Text(
          'Continue',
          style: defaultwhiteFontStyle.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
