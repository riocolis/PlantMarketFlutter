part of 'pages.dart';

class GeneralPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onBackButtonPressed;
  final Widget child;
  final Color backColor;

  const GeneralPage(
      {Key key,
      this.title,
      this.subtitle,
      this.onBackButtonPressed,
      this.backColor,
      this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(),
          _buildColorBackground(),
          SafeArea(
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: defaultMargin),
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      width: double.infinity,
                      height: 100,
                      color: Colors.white,
                      child: _buildRow(),
                    ),
                    child ?? SizedBox()
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildColorBackground() {
    return SafeArea(
        child: Container(
      color: backColor ?? defaultColor,
    ));
  }

  _buildRow() {
    return Row(
      children: [
        onBackButtonPressed != null
            ? Container(
                width: 24,
                height: 24,
                child: Text('<'),
              )
            : SizedBox(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTitle(),
            _buildSubtitle(),
          ],
        )
      ],
    );
  }

  _buildTitle() {
    return Text(title ?? '',
        style: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ));
  }

  _buildSubtitle() {
    return Text(subtitle ?? '',
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w300,
          color: defaultGreyColor,
        ));
  }
}
