part of 'widgets.dart';

class LabelTextRow extends StatelessWidget {
  final String label;
  final String result;
  final dynamic currency;
  final bool isTotal;

  const LabelTextRow(
      {Key key,
      @required this.label,
      this.result,
      this.currency,
      this.isTotal = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Text(
          label ?? ' ',
          style: defaultGreyFontStyle,
        )),
        currency != null
            ? Text(
                NumberFormat.currency(
                  locale: 'id-ID',
                  symbol: 'IDR ',
                  decimalDigits: 0,
                ).format(currency),
                style: isTotal
                    ? blackFont16Style.copyWith(fontWeight: FontWeight.w600)
                    : blackFont16Style,
                textAlign: TextAlign.right)
            : Text(
                result ?? ' ',
                style: blackFont16Style,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
              )
      ],
    );
  }
}
