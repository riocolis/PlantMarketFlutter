part of 'pages.dart';

class GeneralPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onBackButtonPressed;
  final Widget child;
  final Widget bottomNav;
  final Color backColor;

  const GeneralPage(
      {Key key,
      this.title,
      this.subtitle,
      this.onBackButtonPressed,
      this.backColor,
      this.bottomNav,
      this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.white),
          _buildColorBackground(),
          SafeArea(
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      width: double.infinity,
                      height: 100,
                      color: Colors.white,
                      child: _buildRow(),
                    ),
                    Container(
                      height: defaultMargin,
                      width: double.infinity,
                      color: defaultColor,
                    ),
                    child ?? SizedBox()
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomNav ?? SizedBox(),
    );
  }

  _buildColorBackground() {
    return SafeArea(
        child: Container(
      color: backColor ?? Colors.white,
    ));
  }

  _buildRow() {
    return Row(
      children: [
        onBackButtonPressed != null
            ? GestureDetector(
                onTap: onBackButtonPressed,
                child: Container(
                  width: 24,
                  height: 24,
                  margin: EdgeInsets.only(right: 26),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/back_arrow.png'))),
                ),
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
          color: mainGreyColor,
        ));
  }
}
