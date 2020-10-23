part of 'widgets.dart';

class LoadingButtonText extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onpressed;
  final String textButton;
  final TextStyle styleTextButton;
  final Color buttonColor;
  final bool isSecond;

  const LoadingButtonText({
    Key key,
    this.isLoading,
    this.onpressed,
    @required this.textButton,
    this.styleTextButton,
    this.buttonColor = Colors.black,
    this.isSecond = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: isSecond ? margin16 : defaultMargin),
      height: 45,
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: isLoading
          ? SpinKitFadingCircle(
              size: 45,
              color: buttonColor,
            )
          : RaisedButton(
              onPressed: onpressed,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              color: buttonColor,
              child: Text(
                textButton ?? 'textButton',
                style: styleTextButton ??
                    defaultwhiteFontStyle.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
    );
  }
}
