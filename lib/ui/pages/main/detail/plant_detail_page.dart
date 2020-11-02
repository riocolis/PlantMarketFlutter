part of pages;

class PlantDetailPage extends StatefulWidget {
  final Function onBackButtonPressed;
  final Transaction transaction;

  const PlantDetailPage(
      {Key key, this.onBackButtonPressed, @required this.transaction})
      : super(key: key);

  @override
  _PlantDetailPageState createState() => _PlantDetailPageState();
}

class _PlantDetailPageState extends State<PlantDetailPage> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: mainColor,
          ),
          SafeArea(
            child: Container(
              color: Colors.white,
            ),
          ),
          _buildBackgroundImage(),
          _buildAppBarAndBody(),
        ],
      ),
    );
  }

  _buildBackgroundImage() {
    return SafeArea(
        child: Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(widget.transaction.plant.pictureUrl),
              fit: BoxFit.cover)),
    ));
  }

  _buildAppBarAndBody() {
    return SafeArea(
        child: ListView(
      children: [
        Column(
          children: [
            _buildButtonBack(),
            _buildBody(),
          ],
        )
      ],
    ));
  }

  _buildButtonBack() {
    return Container(
      height: 75,
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Align(
        alignment: Alignment.centerLeft,
        child: GestureDetector(
          onTap: widget.onBackButtonPressed,
          child: Container(
            padding: EdgeInsets.all(3),
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.black12),
            child: Image.asset('$ic_backArrowWhite'),
          ),
        ),
      ),
    );
  }

  _buildBody() {
    return Container(
        margin: EdgeInsets.only(top: 180),
        padding: EdgeInsets.symmetric(vertical: 26, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Column(
          children: [
            _buildRowTitleAndCart(),
            _buildDescription(),
            _buildRowTotalAndButton(),
          ],
        ));
  }

  _buildRowTitleAndCart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTitle(),
        _buildCart(),
      ],
    );
  }

  _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width - 134,
            child:
                Text(widget.transaction.plant.name, style: blackFont20Style)),
        SizedBox(height: 6),
        RatingStars(widget.transaction.plant.rate),
      ],
    );
  }

  _buildCart() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              quantity = max(1, quantity - 1);
            });
          },
          child: Container(
            height: 26,
            width: 26,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(width: 1),
                image: DecorationImage(
                  image: AssetImage('$btnMin'),
                )),
          ),
        ),
        SizedBox(
          width: 25,
          child: Text(
            quantity.toString(),
            textAlign: TextAlign.center,
            style: blackFont20Style,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              quantity = min(999, quantity + 1);
            });
          },
          child: Container(
            height: 26,
            width: 26,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(width: 1),
                image: DecorationImage(
                  image: AssetImage('$btnAdd'),
                )),
          ),
        )
      ],
    );
  }

  _buildDescription() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 14, 0, 16),
      child: Text(
        widget.transaction.plant.description,
        style: defaultGreyFontStyle.copyWith(height: 1.8),
        textAlign: TextAlign.justify,
      ),
    );
  }

  _buildRowTotalAndButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTextTotalPrice(),
        _buildButtonOrder(),
      ],
    );
  }

  _buildTextTotalPrice() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$labelTotalPrice',
            style: defaultGreyFontStyle.copyWith(fontSize: 13)),
        SizedBox(height: 6),
        Text(Helpers.formatIDR(quantity * widget.transaction.plant.price),
            style: defaultblackFontStyle.copyWith(fontSize: 18)),
      ],
    );
  }

  _buildButtonOrder() {
    return SizedBox(
      width: 163,
      height: 45,
      child: RaisedButton(
        onPressed: () {
          Get.to(PaymentPage(
              transaction: widget.transaction.copyWith(
                  quantity: quantity,
                  total: quantity * widget.transaction.plant.price)));
        },
        color: mainColor,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Text(
          '$labelOrder',
          style: blackFont16Style.copyWith(
              fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }
}
