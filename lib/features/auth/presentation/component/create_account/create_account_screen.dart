import 'package:Learn_U/core/error/failure.dart';
import 'package:Learn_U/core/resource_manger/routs_manager.dart';
import 'package:Learn_U/core/widgets/snack_bar.dart';
import 'package:Learn_U/features/auth/presentation/login_screen.dart';
import 'package:Learn_U/features/auth/presentation/manager/register_bloc/register_bloc_bloc.dart';
import 'package:Learn_U/features/auth/presentation/manager/register_bloc/register_bloc_event.dart';
import 'package:Learn_U/features/auth/presentation/manager/register_bloc/register_bloc_state.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:Learn_U/core/resource_manger/asset_path.dart';
import 'package:Learn_U/core/resource_manger/color_manager.dart';
import 'package:Learn_U/core/resource_manger/locale_keys.g.dart';
import 'package:Learn_U/core/utils/config_size.dart';
import 'package:Learn_U/core/widgets/custom_text_field.dart';
import 'package:Learn_U/core/widgets/main_button.dart';
import 'package:Learn_U/main_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures_strings.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countryidController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    mobileController = TextEditingController();
    birthdateController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    birthdateController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    image = null;
    super.dispose();
  }

  final ImagePicker picker = ImagePicker();
  XFile? image;

  String? selectedValue;
  bool isVisible = true;
  bool isVisible1 = true;
  final List<String> items = [
    'Male',
    'Female',
  ];
  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    DateTime currentdate = DateTime.now();
    final DateTime? picked = await showDatePicker(
        builder: (context, child) {
          return Theme(
              data: ThemeData.light().copyWith(
                hintColor: ColorManager.gray,
                colorScheme: const ColorScheme.light(primary: ColorManager.mainColor),
              ),
              child: child!);
        },
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1940, 1),
        lastDate:
            DateTime.utc(currentdate.year, currentdate.month, currentdate.day));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        String convertedDateTime =
            "${picked.year.toString()}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
        birthdateController.value = TextEditingValue(text: convertedDateTime);
        ;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.login, (route) => false);
        }
        if (state is RegisterErrorState) {
          errorSnackBar(context, Strings.registerfailed);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: ColorManager.mainColor,
            ),
          ),
          centerTitle: true,
          title: Text(
            StringManager.signUpWithUs.tr(),
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: ConfigSize.defaultSize! * 2,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(ConfigSize.defaultSize! * 1.5),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
             
                SizedBox(
                  height: ConfigSize.defaultSize! * 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AssetsPath.logo,
                    ),
                  ],
                ),
                SizedBox(
                  height: ConfigSize.defaultSize! * 5,
                ),

                Text(
                  StringManager.fullName.tr(),
                  style: TextStyle(
                    fontSize: ConfigSize.defaultSize! * 1.6,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: ConfigSize.defaultSize! - 5,
                ),
                CustomTextField(
                  controller: fullNameController,
                  inputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: ConfigSize.defaultSize! * 2,
                ),
                Text(
                  StringManager.email.tr(),
                  style: TextStyle(
                    fontSize: ConfigSize.defaultSize! * 1.6,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: ConfigSize.defaultSize! - 5,
                ),
                CustomTextField(
                  controller: emailController,
                  inputType: TextInputType.emailAddress,
                ),
                SizedBox(height: ConfigSize.defaultSize! * 2),
                Text(
                  StringManager.phone.tr(),
                  style: TextStyle(
                    fontSize: ConfigSize.defaultSize! * 1.6,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: ConfigSize.defaultSize! - 5,
                ),
                CustomTextField(
                  controller: mobileController,
                  inputType: TextInputType.phone,
                ),
                SizedBox(height: ConfigSize.defaultSize! * 2),
                Text(
                  StringManager.password.tr(),
                  style: TextStyle(
                    fontSize: ConfigSize.defaultSize! * 1.6,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: ConfigSize.defaultSize! - 5,
                ),
                CustomTextField(
                  controller: passwordController,
                  inputType: TextInputType.text,
                  obscureText: isVisible1,
                  suffix: InkWell(
                      onTap: () {
                        {
                          isVisible1 = !isVisible1;
                        }
                        setState(() {});
                      },
                      child: Icon(isVisible1
                          ? Icons.visibility_off_outlined
                          : Icons.remove_red_eye_outlined)),
                ),
                SizedBox(height: ConfigSize.defaultSize! * 2),
                Text(
                  StringManager.confirmPassword.tr(),
                  style: TextStyle(
                    fontSize: ConfigSize.defaultSize! * 1.6,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: ConfigSize.defaultSize! - 5,
                ),
                CustomTextField(
                  controller: confirmPasswordController,
                  inputType: TextInputType.text,
                  obscureText: isVisible,
                  suffix: InkWell(
                    onTap: () {
                      {
                        isVisible = !isVisible;
                      }
                      setState(() {});
                    },
                    child: Icon(isVisible
                        ? Icons.visibility_off_outlined
                        : Icons.remove_red_eye_outlined),
                  ),
                ),
                SizedBox(height: ConfigSize.defaultSize! * 2),
                Text(
                  StringManager.gander.tr(),
                  style: TextStyle(
                    fontSize: ConfigSize.defaultSize! * 1.6,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: ConfigSize.defaultSize! - 5,
                ),
                Center(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'Gander',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: items
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          color: Colors.white,
                          border:
                              Border.all(color: Colors.grey.shade300, width: 1),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: ConfigSize.defaultSize! * 1.6),
                        height: ConfigSize.defaultSize! * 5.5,
                        width: ConfigSize.screenWidth,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: ConfigSize.defaultSize! * 2),
                Text(
                  StringManager.birthdate.tr(),
                  style: TextStyle(
                    fontSize: ConfigSize.defaultSize! * 1.6,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: ConfigSize.defaultSize! - 5,
                ),
                CustomTextField(
                  controller: birthdateController,
                  inputType: TextInputType.text,
                  suffix: IconButton(
                      onPressed: () {
                        _selectDate(context);
                      },
                      icon: const Icon(Icons.calendar_today)),
                ),
                SizedBox(height: ConfigSize.defaultSize! * 2),

                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: ConfigSize.defaultSize! * 3),
                  child: MainButton(
                    onTap: () {
                      BlocProvider.of<RegisterBloc>(context).add(
                          RegisterBlocEvent(
                              fullName: fullNameController.text,
                              birthdate: birthdateController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              mobile: mobileController.text));
                    },
                    title: StringManager.next.tr(),
                  ),
                ),
                SizedBox(
                  height: ConfigSize.defaultSize! * 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringManager.alreadyHaveAnAccount.tr(),
                      style: TextStyle(
                        color: ColorManager.kPrimaryBlueDark,
                        fontWeight: FontWeight.bold,
                        fontSize: ConfigSize.defaultSize! * 2,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: const CreateAccount(),
                          withNavBar: false,
                          pageTransitionAnimation: PageTransitionAnimation.fade,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 2,
                            ),
                          ],
                          color: ColorManager.lightGray2,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: ConfigSize.defaultSize! * 1.5,
                            horizontal: ConfigSize.defaultSize! * 3,
                          ),
                          child: Text(
                            StringManager.login.tr(),
                            style: TextStyle(
                              color: ColorManager.kPrimaryBlueDark,
                              fontWeight: FontWeight.bold,
                              fontSize: ConfigSize.defaultSize! * 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validation() {
    if (fullNameController.text == '') {
      return false;
    } else if (emailController.text == '') {
      return false;
    } else if (passwordController.text == '') {
      return false;
    } else if (confirmPasswordController.text == '') {
      return false;
    } else {
      return true;
    }
  }
}
