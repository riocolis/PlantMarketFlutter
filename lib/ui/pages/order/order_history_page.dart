part of pages;

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectedIndex = 0;
  List<Transaction> inProgress = mockTransactions
      .where((element) =>
          element.status == TransactionStatus.onDelivery ||
          element.status == TransactionStatus.pending)
      .toList();
  List<Transaction> past = mockTransactions
      .where((element) =>
          element.status == TransactionStatus.delivered ||
          element.status == TransactionStatus.cancelled)
      .toList();

  @override
  Widget build(BuildContext context) {
    if (inProgress.length == 0 && past.length == 0) {
      return IllustrationPage(
        picturePath: "$imgillustrationOrders",
        title: 'Ouch, No Order yet.',
        subtitle: 'Seems like you have not\nordered any plant yet',
        buttonTap1: () {},
        buttonTitle1: 'Find Plants',
      );
    } else {
      return ListView(
        children: [
          _buildAppBar(),
          _buildBody(),
        ],
      );
    }
  }

  _buildAppBar() {
    return Column(
      children: [
        Container(
          height: 100,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          margin: EdgeInsets.only(bottom: defaultMargin),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$titleOrderHistory',
                style: blackFont22Style,
              ),
              Text(
                '$subtitleOrderHistory',
                style:
                    defaultGreyFontStyle.copyWith(fontWeight: FontWeight.w300),
              ),
            ],
          ),
        )
      ],
    );
  }

  _buildBody() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          CustomTabBar(
            titles: ['In Progress', 'Past Orders'],
            selectedIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          //SizedBox(height: 16),
          Column(
            children: (selectedIndex == 0 ? inProgress : past)
                .map((e) => Padding(
                      padding: EdgeInsets.fromLTRB(
                          20,
                          (e == mockPlant.first) ? 10 : 5,
                          20,
                          (e == mockPlant.first) ? 5 : 10),
                      child: PlantItem(
                        transaction: e,
                        itemWidth: MediaQuery.of(context).size.width -
                            2 * defaultMargin,
                        plant: e.plant,
                        isOrdered: true,
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
