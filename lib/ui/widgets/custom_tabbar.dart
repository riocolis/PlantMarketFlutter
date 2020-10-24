part of 'widgets.dart';

class CustomTabBar extends StatelessWidget {
  final int selectedIndex;
  final List<String> titles;
  final Function onTap;

  const CustomTabBar(
      {Key key, this.selectedIndex, @required this.titles, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Stack(
        children: [
          _buildTextTab(),
        ],
      ),
    );
  }

  _buildTextTab() {
    return Row(
      children: titles
          .map(
            (e) => Padding(
              padding: EdgeInsets.only(left: defaultMargin, top: 10),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (onTap != null) {
                        onTap(titles.indexOf(e));
                      }
                    },
                    child: Text(
                      e,
                      style: (titles.indexOf(e) == selectedIndex)
                          ? blackFont16Style.copyWith(
                              fontWeight: FontWeight.w500)
                          : defaultGreyFontStyle,
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 3,
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1.5),
                        color: (titles.indexOf(e) == selectedIndex)
                            ? black98tabColor
                            : Colors.transparent),
                  )
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
