part of pages;

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController houseNumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: '$titleAddress',
      subtitle: '$subtitleSignUp',
      onBackButtonPressed: () {
        Get.back();
      },
      child: _buildBody(),
    );
  }

  _buildBody() {
    return Column(
      children: [
        _buildTextFieldPhone(),
        _buildTextFieldAddress(),
        _buildTextFieldHouse(),
        _buildDropDownCity(),
        //_buildTextFieldCity(),
        _buildSignUpButton(),
        Padding(padding: EdgeInsets.only(bottom: 100))
      ],
    );
  }

  _buildTextFieldPhone() {
    return TitleTextField(
      textEditingController: phoneController,
      title: 'Phone No',
      hintTextField: 'Type your Phone Number',
      styleTitle: blackFont22Style,
    );
  }

  _buildTextFieldAddress() {
    return TitleTextField(
      textEditingController: addressController,
      title: 'Address',
      hintTextField: 'Type your address',
      styleTitle: blackFont22Style,
    );
  }

  _buildTextFieldHouse() {
    return TitleTextField(
      textEditingController: addressController,
      title: 'House Number',
      hintTextField: 'Type your address',
      styleTitle: blackFont22Style,
    );
  }

  _buildDropDownCity() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          margin:
              EdgeInsets.fromLTRB(defaultMargin, margin16, defaultMargin, 6),
          child: Text('City', style: blackFont22Style),
        ),
        Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.black),
            ),
            child: DropdownButton(
              isExpanded: true,
              underline: SizedBox(),
              items: [
                DropdownMenuItem(
                  child: Text(
                    'Bandung',
                    style: blackFont16Style,
                  ),
                ),
                DropdownMenuItem(
                  child: Text(
                    'Jakarta',
                    style: blackFont16Style,
                  ),
                ),
                DropdownMenuItem(
                  child: Text(
                    'Surabaya',
                    style: blackFont16Style,
                  ),
                ),
              ],
              onChanged: (item) {},
            )),
      ],
    );
  }

  _buildSignUpButton() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: defaultMargin),
      height: 45,
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: RaisedButton(
        onPressed: () {},
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        color: mainColor,
        child: Text(
          'Sign Up Now',
          style: defaultwhiteFontStyle.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
