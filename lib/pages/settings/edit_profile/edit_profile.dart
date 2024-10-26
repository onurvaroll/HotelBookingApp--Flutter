import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';
import '../../../controller/booked_controller/booked_controller.dart';
import '../../../controller/text_controller/text_controller.dart';
import '../../../core/color.dart';
import '../../../core/icon.dart';
import '../../../model/user_model.dart';
import '../../../service/auth.dart';
import '../../../service/firestore_service.dart';
import '../../../widget/button_bottom_sheet/button_bottom_sheet.dart';
import '../../../widget/text_field/special_field.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  FireStoreService fireStore = FireStoreService();
  final AuthorizationService auth = Get.find<AuthorizationService>();
  UserModel? user;
  String? activeUserId;
  String _selectedValue = 'Male';
  final List<String> _options = ['Male', 'Female'];
  List<String> countryCodes = ['+90', '+1', '+44', '+49', '+33', '+323'];
  List<String> genders = ['Male', 'Female', 'Other'];
  final controller = Get.put(BookedController());

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  // Kullanıcı verilerini asenkron olarak çek
  Future<void> _fetchUserData() async {
    activeUserId = auth.activeUserId.value;
    if (activeUserId != null) {
      UserModel? fetchedUser = await fireStore.getUser(activeUserId!);
      if (fetchedUser != null) {
        print("mail: ${fetchedUser.email}");
        setState(() {
          user = fetchedUser;
        });
        _selectedValue=user!.gender!;
      } else {
        print("fetchedUser null");
        // İsteğe bağlı: Kullanıcıyı bilgilendirme veya hata durumu
      }
    } else {
      print("activeUserId null");
      // İsteğe bağlı: Kullanıcıyı bilgilendirme veya hata durumu
    }
  }

  @override
  Widget build(BuildContext context) {
    // Yükleme durumu için kullanıcı verisi kontrolü
    if (user == null) {
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: ColorConstants.black),
          title: Text(
            "Edit Profile",
            style: Get.textTheme.bodySmall!.copyWith(
              color: ColorConstants.black,
              fontWeight: FontWeight.bold,
              letterSpacing: 0,
            ),
          ),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    // Kullanıcı verisi yüklendiğinde formu göster
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorConstants.black),
        title: Text(
          "Edit Profile",
          style: Get.textTheme.bodySmall!.copyWith(
            color: ColorConstants.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 0,
          ),
        ),
      ),
      bottomSheet: ButtonBottomSheet(
        onPressed: () {
          // Güncelleme işlemi
        },
        buttonName: 'Update',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: 16.pAll,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SpecialField(
                obscureText: false,
                controller: TextControllers().editFullName,
                hintText: user!.fullName ?? 'No FullName',
                prefix: StaticIcons.email,
                suffix: StaticIcons.email,
                keyboardType: TextInputType.name,
              ),
              2.yh,
              SpecialField(
                obscureText: false,
                controller: TextControllers().editName,
                hintText: user!.name ?? 'Edit Name',
                prefix: StaticIcons.email,
                suffix: StaticIcons.email,
                keyboardType: TextInputType.name,
              ),
              2.yh,
              SpecialField(
                obscureText: false,
                controller: TextControllers().editBirthDay,
                hintText: user!.birthDay!.isEmpty ? 'Add Birthday':user!.birthDay!,
                prefix: StaticIcons.email,
                suffix: IconButton(
                  icon: const Icon(Icons.date_range),
                  onPressed: () {
                    selectDate(context);
                  },
                ),
                keyboardType: TextInputType.datetime,
              ),
              2.yh,
              SpecialField(
                obscureText: false,
                controller: TextControllers().editMail,
                hintText: user!.email ?? 'Edit E-mail',
                prefix: StaticIcons.email,
                suffix: StaticIcons.email,
                keyboardType: TextInputType.emailAddress,
              ),
              2.yh,
              SizedBox(
                height: Get.size.height * 0.1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorConstants.lightGrey,
                        ),
                        child: DropdownButton<String>(
                          borderRadius: BorderRadius.circular(20),
                          alignment: Alignment.center,
                          value: controller.bookedUserPhoneCode,
                          underline: const SizedBox(),
                          onChanged: (String? newValue) {
                            setState(() {
                              controller.bookedUserPhoneCode = newValue!;
                            });
                            print(controller.bookedUserPhoneCode);
                          },
                          items: countryCodes.map((String code) {
                            return DropdownMenuItem<String>(
                              value: code,
                              child: Text(code,
                                  style: Get.textTheme.labelMedium!
                                      .copyWith(color: ColorConstants.black)),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    4.xw,
                    Expanded(
                      flex: 5,
                      child: SpecialField(
                        obscureText: false,
                        controller: TextControllers().reservedPhone,
                        hintText: 'Phone Number',
                        prefix: const SizedBox(),
                        suffix: StaticIcons.email,
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ],
                ),
              ),
              // SpecialField(
              //   obscureText: false,
              //   controller: TextControllers().editPhone,
              //   hintText: user!.phoneNumber ?? '',
              //   prefix: StaticIcons.email,
              //   suffix: StaticIcons.email,
              //   keyboardType: TextInputType.phone,
              // ),
              2.yh,
              DropdownMenu<String>(
                menuStyle: MenuStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      ColorConstants.black),
                ),
                width: 90.w,
                hintText: _selectedValue,
                textStyle: Get.textTheme.labelMedium!
                    .copyWith(color: ColorConstants.black),
                leadingIcon: Icon(
                  _selectedValue == 'Male' ? Icons.male : Icons.female,
                  color: ColorConstants.black,
                ),
                inputDecorationTheme: InputDecorationTheme(
                  fillColor: ColorConstants.lightGrey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintStyle: Get.textTheme.labelMedium!
                      .copyWith(color: ColorConstants.black),
                  filled: true,
                  contentPadding: 4.pV,
                ),
                onSelected: (String? value) {
                  if (value != null) {
                    setState(() {
                      _selectedValue = value;
                    });
                  }
                },
                dropdownMenuEntries:
                _options.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(
                    value: value,
                    label: value,
                    style: ButtonStyle(
                      textStyle: MaterialStateProperty.all<TextStyle>(
                        Get.textTheme.labelMedium!
                            .copyWith(color: ColorConstants.black),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Tarih seçme fonksiyonu
  Future<void> selectDate(BuildContext context) async {
    DateTime? selectedDate;
    final DateTime? picked = await showDatePicker(
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.black,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 365 * 18)),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        TextControllers().editBirthDay.text =
        "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }
}
