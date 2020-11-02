part of pages;

class AddressPage extends StatefulWidget {
  final User user;
  final String password;
  final File pictureFile;

  const AddressPage({Key key, this.user, this.password, this.pictureFile})
      : super(key: key);
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  bool isLoading = false;
  List<String> cities = ['Bandung', 'Jakarta', 'Surabaya'];
  String selectedCity;
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController houseNumController = TextEditingController();

  UserCubit _userCubit;
  PlantCubit _plantCubit;
  TransactionCubit _transactionCubit;

  @override
  void initState() {
    selectedCity = cities[0];
    _userCubit = context.bloc<UserCubit>();
    _plantCubit = context.bloc<PlantCubit>();
    _transactionCubit = context.bloc<TransactionCubit>();
    super.initState();
  }

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
              value: selectedCity,
              isExpanded: true,
              underline: SizedBox(),
              items: cities
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: blackFont16Style,
                        ),
                      ))
                  .toList(),
              onChanged: (item) {
                setState(() {
                  selectedCity = item;
                });
              },
            )),
      ],
    );
  }

  _buildSignUpButton() {
    return LoadingButtonText(
      isLoading: isLoading,
      onpressed: _onPressSignUp,
      textButton: 'Sign Up Now',
      styleTextButton: defaultwhiteFontStyle.copyWith(
          fontWeight: FontWeight.w500, fontSize: 20),
      buttonColor: mainColor,
    );
  }

  void _onPressSignUp() async {
    User user = widget.user.copyWith(
      phoneNumber: phoneController.text,
      address: addressController.text,
      houseNumber: houseNumController.text,
      city: selectedCity,
    );
    setState(() {
      isLoading = true;
    });

    await context
        .bloc<UserCubit>()
        .signUp(user, widget.password, pictureFile: widget.pictureFile);
    if (_userCubit.state is UserLoaded) {
      _plantCubit.getFoods();
      _transactionCubit.getTransaction();
      Get.off(MainPage());
    } else {
      Get.snackbar("", "",
          backgroundColor: Colors.red,
          icon: Icon(MdiIcons.closeCircleOutline, color: Colors.white),
          titleText: Text("Sign In Failed",
              style:
                  defaultwhiteFontStyle.copyWith(fontWeight: FontWeight.w600)),
          messageText: Text((_userCubit.state as UserLoadingFailed).message,
              style: defaultwhiteFontStyle),
          duration: Duration(seconds: 2),
          isDismissible: false, onTap: (_) {
        Get.back();
      });
      setState(() {
        isLoading = false;
      });
    }
  }
}
