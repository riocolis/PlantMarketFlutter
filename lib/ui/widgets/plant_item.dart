part of 'widgets.dart';

class PlantItem extends StatelessWidget {
  final Plant plant;
  final double itemWidth;

  const PlantItem({Key key, @required this.plant, @required this.itemWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                NumberFormat.currency(
                        symbol: 'IDR ', decimalDigits: 0, locale: 'id-ID')
                    .format(plant.price),
                style: defaultGreyFontStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
        ),
        RatingStars(plant.rate),
      ],
    );
  }
}
