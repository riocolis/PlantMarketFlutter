part of pages;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  UserCubit _userCubit;

  @override
  void initState() {
    _userCubit = context.bloc<UserCubit>();
    super.initState();
  }

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
          image: DecorationImage(
              image: (_userCubit.state as UserLoaded)
                      .user
                      .pictureUrl
                      .contains('http')
                  ? NetworkImage(
                      (_userCubit.state as UserLoaded).user.pictureUrl)
                  : AssetImage(
                      (_userCubit.state as UserLoaded).user.pictureUrl))),
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
          child: BlocBuilder<PlantCubit, PlantState>(
            builder: (context, state) {
              return (state is PlantLoaded)
                  ? ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(
                            children: state.plants
                                .map((e) => Padding(
                                      padding: EdgeInsets.only(
                                        left: (e == mockPlant.first)
                                            ? defaultMargin
                                            : 0,
                                        right: defaultMargin,
                                      ),
                                      child: GestureDetector(
                                          onTap: () {
                                            Get.to(PlantDetailPage(
                                              transaction: Transaction(
                                                plant: e,
                                                user: (_userCubit.state
                                                        as UserLoaded)
                                                    .user,
                                              ),
                                              onBackButtonPressed: () {
                                                Get.back();
                                              },
                                            ));
                                          },
                                          child: PlantCard(plant: e)),
                                    ))
                                .toList())
                      ],
                    )
                  : Center(
                      child: loadingIndicator,
                    );
            },
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
    return BlocBuilder<PlantCubit, PlantState>(builder: (context, state) {
      if (state is PlantLoaded) {
        List<Plant> plants = state.plants
            .where((element) => element.types.contains((_selectedIndex == 0)
                ? PlantType.new_plants
                : (_selectedIndex == 1)
                    ? PlantType.popular
                    : PlantType.recommended))
            .toList();
        return Column(
          children: plants
              .map((e) => Padding(
                    padding: EdgeInsets.fromLTRB(
                        defaultMargin, 0, defaultMargin, 16),
                    child: PlantItem(
                      plant: e,
                      itemWidth: (MediaQuery.of(context).size.width -
                          2 * defaultMargin),
                    ),
                  ))
              .toList(),
        );
      } else {
        return Center(child: loadingIndicator);
      }
    });
  }
}
