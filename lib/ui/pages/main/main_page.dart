part of pages;

class MainPage extends StatefulWidget {
  final int initialPage;

  const MainPage({Key key, this.initialPage = 0}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialPage;
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.white),
          SafeArea(child: Container(color: defaultColor)),
          _buildBody(),
          Align(alignment: Alignment.bottomCenter, child: _buildBottomNavbar())
        ],
      ),
    );
  }

  _buildBody() {
    return SafeArea(
        child: PageView(
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      children: [
        HomePage(),
        OrderHistoryPage(),
        Center(child: Text('Profil')),
      ],
    ));
  }

  _buildBottomNavbar() {
    return CustomBottomNavigationBar(
      selectedIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
        _pageController.jumpToPage(_currentIndex);
      },
    );
  }
}
