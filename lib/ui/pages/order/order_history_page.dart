part of pages;

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoaded) {
          if (state.transactions.length == 0) {
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
                _buildBody(state),
              ],
            );
          }
        } else {
          return Center(child: loadingIndicator);
        }
      },
    );
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

  _buildBody(TransactionLoaded state) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          CustomTabBar(
            titles: ['In Progress', 'Past Orders'],
            selectedIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          //SizedBox(height: 16),
          Builder(builder: (_) {
            List<Transaction> transactions = (_selectedIndex == 0)
                ? state.transactions
                    .where((element) =>
                        element.status == TransactionStatus.onDelivery ||
                        element.status == TransactionStatus.pending)
                    .toList()
                : state.transactions
                    .where((element) =>
                        element.status == TransactionStatus.delivered ||
                        element.status == TransactionStatus.cancelled)
                    .toList();
            return Column(
              children: transactions
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
            );
          })
        ],
      ),
    );
  }
}
