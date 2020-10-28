part of 'widgets.dart';

class ImageCircle extends StatelessWidget {
  final String image;

  const ImageCircle({Key key, @required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 110,
      margin: EdgeInsets.only(top: 26),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('$imgphotoborder')),
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: image != null
                  ? image.contains('https')
                      ? NetworkImage('$image')
                      : AssetImage('$image')
                  : AssetImage('$imgaddphoto'),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
