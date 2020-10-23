part of 'widgets.dart';

class TitleTextField extends StatefulWidget {
  final String title;
  final TextStyle styleTitle;
  final TextEditingController textEditingController;
  final String hintTextField;
  final bool isSecond;

  const TitleTextField({
    Key key,
    @required this.title,
    @required this.styleTitle,
    @required this.textEditingController,
    @required this.hintTextField,
    this.isSecond = false,
  }) : super(key: key);

  @override
  _TitleTextFieldState createState() => _TitleTextFieldState();
}

class _TitleTextFieldState extends State<TitleTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(defaultMargin,
              widget.isSecond ? margin16 : margin26, defaultMargin, 6),
          child: Text(
            widget.title ?? 'Text',
            style: widget.styleTitle,
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.black),
          ),
          child: TextField(
            controller: widget.textEditingController,
            maxLines: 4,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: defaultGreyFontStyle,
              hintText: widget.hintTextField ?? 'hintText',
            ),
          ),
        ),
      ],
    );
  }
}
