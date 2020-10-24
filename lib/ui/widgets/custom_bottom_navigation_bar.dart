part of 'widgets.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function onTap;

  const CustomBottomNavigationBar(
      {Key key, @required this.selectedIndex, @required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: mainColor,
      iconSize: 26,
      currentIndex: selectedIndex,
      onTap: onTap,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.assignment), label: 'Transaction'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
      ],
    );
  }
}
