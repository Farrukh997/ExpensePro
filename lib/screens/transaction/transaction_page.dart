import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_pro/core/components/bottom_dialog/filter_dialog.dart';
import 'package:expense_pro/core/components/cards/transaction_card.dart';
import 'package:expense_pro/core/components/icons/arrow_down_icon.dart';
import 'package:expense_pro/core/components/icons/arrow_right_icon.dart';
import 'package:expense_pro/core/components/icons/sort_icon.dart';
import 'package:expense_pro/domain/models/transaction.dart' as t;
import 'package:expense_pro/screens/transaction/story_report_page.dart';
import 'package:expense_pro/screens/transaction/transaction_detail_page.dart';
import 'package:expense_pro/utils/extenstions/extensions.dart';
import 'package:expense_pro/utils/functions.dart';
import 'package:expense_pro/utils/res/app_colors.dart';
import 'package:expense_pro/utils/res/app_text.dart';
import 'package:expense_pro/utils/res/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  late final t.Time _value;
  final query = FirebaseFirestore.instance
      .collection('transactions')
      .withConverter(
        fromFirestore: (snapshot, _) => t.Transaction.fromJson(snapshot.data()!),
        toFirestore: (t.Transaction model, _) => model.toJson(),
      )
      .snapshots();

  @override
  void initState() {
    super.initState();
    _value = t.Time.today;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 64.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: 42.0,
                    width: 120.0,
                    child: DropdownButtonFormField<t.Time>(
                      isDense: true,
                      icon: const SizedBox(),
                      style: AppTextStyle.bodySmall,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(color: AppColors.light60),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(color: AppColors.light60),
                        ),
                        prefixIconColor: AppColors.violet100,
                        prefixIcon: const Icon(ArrowDown.arrow_down),
                      ),
                      value: _value,
                      items: t.Time.values
                          .map((e) => DropdownMenuItem<t.Time>(
                                value: e,
                                child: Center(
                                  child: Text(
                                    e.name.startWithCapital(),
                                  ),
                                ),
                              ))
                          .toList(),
                      onChanged: (t.Time? value) {
                        if (value != null) {
                          setState(() {
                            _value = value;
                          });
                        }
                      },
                    ),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.light60,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: IconButton(
                      visualDensity: VisualDensity.compact,
                      alignment: Alignment.center,
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24.0),
                              topRight: Radius.circular(24.0),
                            ),
                          ),
                          builder: (context) => const FilterDialog(),
                        );
                      },
                      icon: const Icon(
                        SortIcon.sort,
                        color: AppColors.dark100,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 8.0,
              ),
              child: MaterialButton(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.only(
                  left: 16.0,
                  top: 12.0,
                  right: 8.0,
                  bottom: 12.0,
                ),
                color: const Color(0xFFEEE5FF),
                height: MediaQuery.of(context).size.height * .04,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StoryReportPage(
                          period:
                              '${_value.index > 0 ? 'This' : ''} ${_value.name.startWithCapital()}',
                        ),
                      ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context)?.seeUrfinancialReport ??
                          AppText.seeUrfinancialReport,
                      style: AppTextStyle.bodyLarge.copyWith(
                        color: AppColors.violet100,
                      ),
                    ),
                    const Icon(
                      ArrowRight.arrow_right,
                      color: AppColors.violet100,
                      size: 32.0,
                      weight: 32.0,
                    ),
                  ],
                ),
              ),
            ),
            StreamBuilder<Object>(
                stream: query,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data as QuerySnapshot<t.Transaction>;
                    final result = data.docs;
                    return SizedBox(
                      height: size.height * .165 * result.length,
                      child: Builder(builder: (context) {
                        List<t.Transaction> transaction =
                            result.map((e) => e.data()).toList();
                        return GroupedListView(
                          primary: false,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.only(
                            left: 24.0,
                            top: 16.0,
                            right: 24.0,
                          ),
                          elements: transaction,
                          floatingHeader: true,
                          groupBy: (t.Transaction element) => element.time.copyWith(
                            hour: 0,
                            minute: 0,
                            second: 0,
                            microsecond: 0,
                            millisecond: 0,
                          ),
                          order: GroupedListOrder.DESC,
                          groupComparator: (DateTime value1, DateTime value2) =>
                              value1.compareTo(value2),
                          groupHeaderBuilder: (t.Transaction value) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Builder(
                              builder: (context) {
                                if (value.time.day == DateTime.now().day &&
                                    value.time.month == DateTime.now().month &&
                                    value.time.year == DateTime.now().year) {
                                  return Text(
                                    AppLocalizations.of(context)?.today ?? AppText.today,
                                    style: AppTextStyle.bodyLarge,
                                  );
                                }
                                if (value.time.day == DateTime.now().day - 1 &&
                                    value.time.month == DateTime.now().month &&
                                    value.time.year == DateTime.now().year) {
                                  return Text(
                                    AppLocalizations.of(context)?.yesterday ??
                                        AppText.yesterday,
                                    style: AppTextStyle.bodyLarge,
                                  );
                                }
                                return Text(
                                  '${getMonth(value.time.month, context)} ${value.time.day} ${value.time.year}',
                                  style: AppTextStyle.bodyLarge,
                                  textAlign: TextAlign.left,
                                );
                              },
                            ),
                          ),
                          indexedItemBuilder: (context, t.Transaction element, index) {
                            return GestureDetector(
                              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => TransactionDetailPage(
                                        transaction: element,
                                      ))),
                              child: TransactionCard(transaction: element),
                            );
                          },
                        );
                      }),
                    );
                  }
                  return const SizedBox.shrink();
                }),
          ],
        ),
      ),
    );
  }
}
