part of 'widgets.dart';

class RowLabelIcon extends StatelessWidget {
  final Function onTap;
  final String title;
  final IconData icon;

  const RowLabelIcon({Key key, this.onTap, this.title, this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: defaultblackFontStyle.copyWith(fontSize: 14)),
          Icon(
            icon,
            color: mainGreyColor,
            size: 18,
          ),
        ],
      ),
    );
  }
}
