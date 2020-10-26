part of 'widgets.dart';

class PlantItem extends StatelessWidget {
  final Plant plant;
  final Transaction transaction;
  final double itemWidth;
  final bool isPayment;
  final bool isOrdered;

  const PlantItem(
      {Key key,
      @required this.plant,
      @required this.itemWidth,
      this.transaction,
      this.isPayment = false,
      this.isOrdered = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isOrdered ? _buildIsOrdered() : _buildIsNotOrdered();
  }

  _buildIsOrdered() {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
                image: AssetImage(plant.pictureUrl), fit: BoxFit.cover),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                plant.name,
                style: blackFont20Style,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              Text(
                '${transaction.quantity} item - ' +
                    Helpers.formatIDR(transaction.total),
                style: defaultGreyFontStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Text(Helpers.convertDateTime(transaction.dateTime)),
            Text(
              Helpers.transactionString(transaction.status),
              style: TextStyle(
                  color: Helpers.transactionColor(transaction.status),
                  fontSize: 12),
            ),
          ],
        )
      ],
    );
  }

  _buildIsNotOrdered() {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
                image: AssetImage(plant.pictureUrl), fit: BoxFit.cover),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                plant.name,
                style: blackFont20Style,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              Text(
                Helpers.formatIDR(plant.price),
                style: defaultGreyFontStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
        ),
        isPayment
            ? Text(
                '${transaction.quantity} items',
                style: defaultGreyFontStyle.copyWith(fontSize: 13),
              )
            : RatingStars(plant.rate),
      ],
    );
  }
}
