part of pages;

class PaymentPage extends StatelessWidget {
  final Transaction transaction;

  const PaymentPage({Key key, this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Payment',
      subtitle: 'You deserve better Fresh Air',
      onBackButtonPressed: () {},
      backColor: defaultColor,
      child: _buildBody(),
      bottomNav: _buildBottomBar(),
    );
  }

  _buildBody() {
    return Column(
      children: [
        _buildTitlePlantItemAndDetailTransaction(),
        SizedBox(height: 12),
        _buildTextDeliverAndUser()
      ],
    );
  }

  _buildTitlePlantItemAndDetailTransaction() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$labelItemOrdered', style: blackFont16Style),
          SizedBox(height: 12),
          PlantItem(
            isOrdered: true,
            transaction: transaction,
            plant: transaction.plant,
            itemWidth: 100,
          ),
          _buildDetailTransaction(),
        ],
      ),
    );
  }

  _buildDetailTransaction() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 16, bottom: 8),
          child: Text(
            '$labelDetailTransaction',
            style: blackFont16Style,
          ),
        ),
        LabelTextRow(
          label: transaction.plant.name,
          currency: transaction.quantity * transaction.plant.price,
        ),
        SizedBox(height: 4),
        LabelTextRow(
          label: '$labelDriver',
          currency: 50000,
        ),
        SizedBox(height: 4),
        LabelTextRow(
            label: '$labelTax',
            currency: transaction.quantity * transaction.plant.price * 0.1),
        SizedBox(height: 4),
        LabelTextRow(
          label: '$labelTotalPrice',
          currency:
              transaction.quantity * transaction.plant.price * 1.1 + 50000,
          isTotal: true,
        ),
      ],
    );
  }

  _buildTextDeliverAndUser() {
    return Container(
      margin: EdgeInsets.only(bottom: defaultMargin),
      padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
      color: Colors.white,
      child: _buildDetailUser(),
    );
  }

  _buildDetailUser() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text(
            '$labelDetailTransaction',
            style: blackFont16Style,
          ),
        ),
        LabelTextRow(
          label: '$labelName',
          result: transaction.user.name,
        ),
        SizedBox(height: 4),
        LabelTextRow(
          label: '$labelPhoneNo',
          result: transaction.user.phoneNumber,
        ),
        SizedBox(height: 4),
        LabelTextRow(
          label: '$labelAddress',
          result: transaction.user.address,
        ),
        SizedBox(height: 4),
        LabelTextRow(
          label: '$labelHouseNo',
          result: transaction.user.houseNumber,
        ),
        SizedBox(height: 4),
        LabelTextRow(
          label: '$labelCity',
          result: transaction.user.city,
        ),
      ],
    );
  }

  _buildBottomBar() {
    return Container(
      height: 70,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: RaisedButton(
            color: mainColor,
            elevation: 0,
            onPressed: () {},
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            child: Text(
              '$labelCheckOut',
              style: blackFont16Style.copyWith(
                  fontWeight: FontWeight.w500, color: Colors.white),
            )),
      ),
    );
  }
}
