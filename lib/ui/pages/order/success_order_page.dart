part of pages;

class SuccessOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IllustrationPage(
        title: "You've Made Order",
        subtitle: "Keep Stay At Home\nand\nStay Save",
        picturePath: '$imgillustrationDelivery',
        buttonTap1: () {},
        buttonTitle1: "Order Other Plants",
        buttonTap2: () {},
        buttonTitle2: "View My Order",
      ),
    );
  }
}
