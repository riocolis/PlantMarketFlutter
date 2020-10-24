part of 'widgets.dart';

class ImageCircle extends StatelessWidget {
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
              image: AssetImage('$imgprofilephoto'), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
