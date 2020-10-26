part of pages;

class SuccessSignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IllustrationPage(
        title: "Yeay! Completed",
        subtitle: "Now you can to Order some foods",
        picturePath: '$imgillustrationSuccessSignUp',
        buttonTap1: () {},
        buttonTitle1: "Find Plants",
      ),
    );
  }
}
