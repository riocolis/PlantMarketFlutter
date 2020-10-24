part of pages;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            _buildHeader(),
            _buildListFavoritePlant(),
            _buildTabPlant(),
            SizedBox(height: 100),
          ],
        )
      ],
    );
  }

  _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      color: Colors.white,
      height: 100,
      width: double.infinity,
      child: _buildRowHeader(),
    );
  }

  _buildRowHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTitleHeader(),
        _buildPhotoHeader(),
      ],
    );
  }

  _buildTitleHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('$titleHomePage', style: blackFont22Style),
        Text("$subtitleHomePage",
            style: defaultGreyFontStyle.copyWith(fontWeight: FontWeight.w300)),
      ],
    );
  }

  _buildPhotoHeader() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(image: AssetImage('$imgprofilephoto'))),
    );
  }

  _buildListFavoritePlant() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(left: defaultMargin, top: 20),
          child: Text('Plant Favorite', style: blackFont20Style),
        ),
        Container(
          height: 258,
          width: double.infinity,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Row(
                  children: mockPlant
                      .map((e) => Padding(
                            padding: EdgeInsets.only(
                              left: (e == mockPlant.first) ? defaultMargin : 0,
                              right: defaultMargin,
                            ),
                            child: PlantCard(plant: e),
                          ))
                      .toList())
            ],
          ),
        )
      ],
    );
  }

  _buildTabPlant() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          CustomTabBar(
            titles: ['New Plant', 'Popular', 'Recommended'],
            selectedIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          _buildBodyTabPlant()
        ],
      ),
    );
  }

  _buildBodyTabPlant() {
    return Builder(builder: (_) {
      List<Plant> plants = (_selectedIndex == 0)
          ? mockPlant
          : (_selectedIndex == 1)
              ? []
              : [];
      return Column(
        children: plants
            .map((e) => Padding(
                  padding:
                      EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 16),
                  child: PlantItem(
                    plant: e,
                    itemWidth:
                        (MediaQuery.of(context).size.width - 2 * defaultMargin),
                  ),
                ))
            .toList(),
      );
    });
  }
}
