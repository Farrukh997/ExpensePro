import 'package:expense_pro/core/presentation/components/colorful_button.dart';
import 'package:expense_pro/core/presentation/res/colors.dart';
import 'package:expense_pro/core/presentation/res/text.dart';
import 'package:expense_pro/core/presentation/res/text_style.dart';
import 'package:flutter/material.dart';

class AddNewAccountPage extends StatefulWidget {
  const AddNewAccountPage({super.key});

  @override
  State<AddNewAccountPage> createState() => _AddNewAccountPageState();
}

class _AddNewAccountPageState extends State<AddNewAccountPage> {
  List<String> list = ['Bank', 'Cash'];
  String dropdownValue = 'Bank';
  final textController = TextEditingController(text: '\$00.0');
  final nameController = TextEditingController();
  @override
  void initState() {
    dropdownValue = list.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.violet100,
      appBar: AppBar(
        backgroundColor: AppColor.violet100,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColor.light100,
          ),
          onPressed: () {},
        ),
        title: Text(
          AppText.addNewWallet,
          style: AppTextStyle.title3.copyWith(
            color: AppColor.light100,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(
              left: 24.0,
            ),
            child: Text(
              AppText.balance,
              style: AppTextStyle.title3.copyWith(
                color: AppColor.light80,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 12.0,
            ),
            child: TextField(
              textAlign: TextAlign.start,
              keyboardType: const TextInputType.numberWithOptions(
                signed: false,
                decimal: true,
              ),
              controller: textController,
              style: AppTextStyle.titleLarge.copyWith(
                color: AppColor.light100,
              ),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.attach_money,
                  color: AppColor.light100,
                  size: 64.0,
                ),
                hintText: '00.0',
                hintStyle: AppTextStyle.titleLarge.copyWith(
                  color: AppColor.light100,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          Card(
            color: AppColor.light100,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: AppText.name,
                    ),
                    keyboardType: TextInputType.text,
                    controller: nameController,
                  ),
                ),
                Container(
                  height: 84.0,
                  width: size.width,
                  padding: const EdgeInsets.all(12.0),
                  child: DropdownButtonFormField<String>(
                    // isExpanded: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    // borderRadius: BorderRadius.circular(16.0),
                    value: dropdownValue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    elevation: 16,
                    style: const TextStyle(
                      color: Colors.deepPurple,
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    items: list
                        .map<DropdownMenuItem<String>>(
                            (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                ))
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ColorfulButton(
                    child: Text(
                      AppText.contin,
                      style: AppTextStyle.title3.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(
                  height: 32.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
