part of 'widgets.dart';

class PlantCard extends StatelessWidget {
  final Plant plant;

  const PlantCard({Key key, @required this.plant}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 210,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(spreadRadius: 3, blurRadius: 15, color: Colors.black12)
          ]),
      child: Column(
        children: [
          _buildImage(),
          _buildText(),
          Padding(
            padding: EdgeInsets.only(left: 12),
            child: RatingStars(plant.rate),
          ),
        ],
      ),
    );
  }

  _buildImage() {
    return Container(
      height: 140,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          ),
          image: DecorationImage(
              image: AssetImage(plant.pictureUrl), fit: BoxFit.cover)),
    );
  }

  _buildText() {
    return Container(
      margin: EdgeInsets.fromLTRB(12, 12, 12, 6),
      width: 200,
      child: Text(
        plant.name,
        style: blackFont16Style,
        maxLines: 1,
        overflow: TextOverflow.clip,
      ),
    );
  }
}
