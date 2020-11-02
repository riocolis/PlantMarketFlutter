part of pages;

class PaymentPage extends StatefulWidget {
  final Transaction transaction;

  const PaymentPage({Key key, this.transaction}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isLoading = false;
  TransactionCubit _transactionCubit;

  @override
  void initState() {
    _transactionCubit = context.bloc<TransactionCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Payment',
      subtitle: 'You deserve better Fresh Air',
      onBackButtonPressed: () {
        Get.back();
      },
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
            isPayment: true,
            transaction: widget.transaction,
            plant: widget.transaction.plant,
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
          label: widget.transaction.plant.name,
          currency: widget.transaction.total,
        ),
        SizedBox(height: 4),
        LabelTextRow(
          label: '$labelDriver',
          currency: 50000,
        ),
        SizedBox(height: 4),
        LabelTextRow(
            label: '$labelTax', currency: widget.transaction.total * 0.1),
        SizedBox(height: 4),
        LabelTextRow(
          label: '$labelTotalPrice',
          currency: widget.transaction.total * 1.1 + 50000,
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
          result: widget.transaction.user.name,
        ),
        SizedBox(height: 4),
        LabelTextRow(
          label: '$labelPhoneNo',
          result: widget.transaction.user.phoneNumber,
        ),
        SizedBox(height: 4),
        LabelTextRow(
          label: '$labelAddress',
          result: widget.transaction.user.address,
        ),
        SizedBox(height: 4),
        LabelTextRow(
          label: '$labelHouseNo',
          result: widget.transaction.user.houseNumber,
        ),
        SizedBox(height: 4),
        LabelTextRow(
          label: '$labelCity',
          result: widget.transaction.user.city,
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
            disabledColor: Colors.white,
            elevation: 0,
            onPressed: isLoading ? null : _onPressedPaymentPage,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            child: isLoading
                ? Center(child: loadingIndicator)
                : Text(
                    '$labelCheckOut',
                    style: blackFont16Style.copyWith(
                        fontWeight: FontWeight.w500, color: Colors.white),
                  )),
      ),
    );
  }

  void _onPressedPaymentPage() async {
    setState(() {
      isLoading = true;
    });
    bool result = await _transactionCubit.submitTransaction(widget.transaction
        .copyWith(
            dateTime: DateTime.now(),
            total: (widget.transaction.total * 1.1).toInt() + 50000));
    if (result == true) {
      Get.to(SuccessOrderPage());
    } else {
      setState(() {
        isLoading = false;
      });
      Get.snackbar("", "",
          backgroundColor: Colors.red,
          icon: Icon(MdiIcons.closeCircleOutline, color: Colors.white),
          titleText: Text("Transaction Failed",
              style:
                  defaultwhiteFontStyle.copyWith(fontWeight: FontWeight.w600)),
          messageText:
              Text('Please try again Later', style: defaultwhiteFontStyle),
          duration: Duration(seconds: 2),
          isDismissible: false, onTap: (_) {
        Get.back();
      });
    }
  }
}
