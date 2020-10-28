part of pages;

class ProfilePage extends StatefulWidget {
  final User user;

  const ProfilePage({Key key, this.user}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.white),
          _buildColorBackground(),
          _buildBody(),
        ],
      ),
    );
  }

  _buildColorBackground([double height]) {
    return SafeArea(
        child: Container(
      height: height ?? double.infinity,
      color: defaultColor,
    ));
  }

  _buildBody() {
    return SafeArea(
        child: ListView(
      children: [
        Column(
          children: [
            _buildAppBarImage(),
            _buildColorBackground(20),
            _buildCustomTabBar(),
          ],
        )
      ],
    ));
  }

  _buildAppBarImage() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: 20),
          ImageCircle(),
          SizedBox(height: 20),
          Text(
            widget.user.name,
            style: blackFont22Style,
          ),
          SizedBox(height: 10),
          Text(
            widget.user.email,
            style: defaultGreyFontStyle,
          ),
          SizedBox(height: 30)
        ],
      ),
    );
  }

  _buildCustomTabBar() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      color: Colors.white,
      child: Column(
        children: [
          CustomTabBar(
            titles: ['Account', 'FoodMarket'],
            selectedIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          _buildBodyTabProfile(),
        ],
      ),
    );
  }

  _buildBodyTabProfile() {
    return Builder(builder: (_) {
      List<String> mocks =
          (_selectedIndex == 0) ? mockAccount : mockAccountFoodMarket;
      return Column(
        children: mocks
            .map((e) => Padding(
                  padding:
                      EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 16),
                  child: RowLabelIcon(
                    title: e,
                    icon: Icons.arrow_forward_ios,
                  ),
                ))
            .toList(),
      );
    });
  }
}
