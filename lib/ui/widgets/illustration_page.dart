part of 'widgets.dart';

class IllustrationPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String picturePath;
  final String buttonTitle1;
  final String buttonTitle2;
  final Function buttonTap1;
  final Function buttonTap2;

  const IllustrationPage(
      {Key key,
      @required this.title,
      @required this.subtitle,
      @required this.picturePath,
      @required this.buttonTitle1,
      this.buttonTitle2,
      @required this.buttonTap1,
      this.buttonTap2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(36, 0, 36, 20),
            child: Image.asset("$picturePath"),
          ),
          Text(
            "$title",
            style: blackFont20Style,
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              "$subtitle",
              style: defaultGreyFontStyle.copyWith(fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            width: 200,
            height: 45,
            child: RaisedButton(
                color: mainColor,
                elevation: 0,
                onPressed: buttonTap1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                child: Text(
                  '$buttonTitle1',
                  style: blackFont16Style.copyWith(
                      fontWeight: FontWeight.w500, color: Colors.white),
                )),
          ),
          buttonTap2 != null
              ? Container(
                  margin: EdgeInsets.only(top: 16, bottom: 12),
                  width: 200,
                  height: 45,
                  child: RaisedButton(
                      color: mainGreyColor,
                      elevation: 0,
                      onPressed: buttonTap2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Text(
                        '$buttonTitle2' ?? ' ',
                        style: blackFont16Style.copyWith(
                            fontWeight: FontWeight.w500, color: Colors.white),
                      )),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
