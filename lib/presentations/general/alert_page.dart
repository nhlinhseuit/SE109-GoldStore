import 'package:flutter/material.dart';
import 'package:se109_goldstore/constants/colors.dart';
import 'package:se109_goldstore/constants/text_styles.dart';
import 'package:se109_goldstore/data/shared_preferences.dart';
import 'package:se109_goldstore/presentations/common/components/add_elevated_button.dart';
import 'package:se109_goldstore/presentations/common/components/loading.dart';
import 'package:se109_goldstore/presentations/general/create_alert_page.dart';
import 'package:se109_goldstore/presentations/general/price_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlertPage extends StatefulWidget {
  const AlertPage({super.key});

  @override
  State<AlertPage> createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  var selectedType = PriceType.GOLD;
  late SharedPreferences prefs;
  late List<String> currentGoldAlertList = [];
  late List<String> currentCurrencyAlertList = [];
  late bool isLoading;

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    initSync();

    super.initState();
  }

  Future<void> initSync() async {
    prefs = await SharedPreferences.getInstance();
    currentGoldAlertList = prefs.getStringList('myAlertsGoldList') ?? [];
    currentCurrencyAlertList =
        prefs.getStringList('myAlertsCurrencyList') ?? [];
    print('initSync currentGoldAlertList $currentGoldAlertList');
    print('initSync currentCurrencyAlertList $currentCurrencyAlertList');
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: AppColor.secondDark,
          centerTitle: true,
          title: Text(
            'Tùy chỉnh cảnh báo',
            style: AppTextStyles.appbarTitle,
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text(
                  'Giá vàng',
                  style: AppTextStyles.txt14BoldBlack.copyWith(
                    color: AppColor.textNormal,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Giá ngoại tệ',
                  style: AppTextStyles.txt14BoldBlack.copyWith(
                    color: AppColor.textNormal,
                  ),
                ),
              ),
            ],
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: AppColor.textSafe,
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: AppColor.primaryGradientBackground,
          ),
          child: TabBarView(
            children: [
              tabBarViewGold(),
              tabBarViewCurrency(),
            ],
          ),
        ),
      ),
    );
  }

  Widget tabBarViewGold() {
    return isLoading
        ? const Loading()
        : currentGoldAlertList.isEmpty
            ? Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.black,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 125,
                              height: 125,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFd2f5ee),
                                  borderRadius: BorderRadius.circular(100)),
                              child: const Icon(
                                Icons.notification_add_outlined,
                                size: 60,
                                color: Color(0xFF24a186),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 45),
                              child: Text(
                                'Tạo cảnh báo để nhận thông báo khi giá vàng đạt tới ngưỡng mục tiêu của bạn',
                                maxLines: 3,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.txt14BoldBlack.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    child: AddElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const CreateAlertPage(isGold: true)),
                        );
                      },
                      text: 'Tạo cảnh báo',
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: currentGoldAlertList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8, top: 8),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                              leading: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFfff7e6),
                                    borderRadius: BorderRadius.circular(100)),
                                child: const Icon(
                                  Icons.bar_chart_rounded,
                                  size: 24,
                                  color: Color(0xFFf7b60a),
                                ),
                              ),
                              textColor: Colors.white,
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Giá vàng đạt mức',
                                    style: AppTextStyles.appbarTitle.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w200,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: currentGoldAlertList[index],
                                          style: AppTextStyles.appbarTitle
                                              .copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' VND',
                                          style: AppTextStyles.appbarTitle
                                              .copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              trailing: InkWell(
                                onTap: () {
                                  _onDeleteGoldAlert(
                                      context, currentGoldAlertList[index]);
                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    child: AddElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const CreateAlertPage(isGold: true)),
                        );
                      },
                      text: 'Tạo cảnh báo',
                    ),
                  ),
                ],
              );
  }

  Widget tabBarViewCurrency() {
    return isLoading
        ? const Loading()
        : currentCurrencyAlertList.isEmpty
            ? Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.black,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 125,
                              height: 125,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFd2f5ee),
                                  borderRadius: BorderRadius.circular(100)),
                              child: const Icon(
                                Icons.notification_add_outlined,
                                size: 60,
                                color: Color(0xFF24a186),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 45),
                              child: Text(
                                'Tạo cảnh báo để nhận thông báo khi giá ngoại tệ đạt tới ngưỡng mục tiêu của bạn',
                                maxLines: 3,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.txt14BoldBlack.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    child: AddElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CreateAlertPage(
                                    isGold: false,
                                  )),
                        );
                      },
                      text: 'Tạo cảnh báo',
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: currentCurrencyAlertList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8, top: 8),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                              leading: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFfff7e6),
                                    borderRadius: BorderRadius.circular(100)),
                                child: const Icon(
                                  Icons.currency_exchange_rounded,
                                  size: 24,
                                  color: AppColor.textSafe,
                                ),
                              ),
                              textColor: Colors.white,
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Giá ngoại tệ đạt mức',
                                    style: AppTextStyles.appbarTitle.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w200,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: currentCurrencyAlertList[index],
                                          style: AppTextStyles.appbarTitle
                                              .copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' VND',
                                          style: AppTextStyles.appbarTitle
                                              .copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              trailing: InkWell(
                                onTap: () {
                                  _onDeleteCurrencyAlert(
                                      context, currentCurrencyAlertList[index]);
                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    child: AddElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const CreateAlertPage(isGold: false)),
                        );
                      },
                      text: 'Tạo cảnh báo',
                    ),
                  ),
                ],
              );
  }

  void _onDeleteGoldAlert(BuildContext context, String inputValue) {
    showModalBottomSheet<String>(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
              color: AppColor.greyBackground,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0))),
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      width: 120,
                      height: 120,
                      child: const Icon(
                        Icons.warning_amber_rounded,
                        color: Colors.white,
                        size: 60,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Bạn muốn xóa cảnh báo này?",
                      style: AppTextStyles.txt16SemiBold.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        "Bạn sẽ không thể hoàn tác khi đã xóa cảnh báo.",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.txt16SemiBold.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Row(children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                        bottom: 20.0,
                        top: 10,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          side: const BorderSide(
                            width: 2,
                            color: Color(0xFF179dff),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Hủy',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF179dff),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                        bottom: 20.0,
                        top: 10,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          side: const BorderSide(
                            width: 2,
                            color: Colors.white,
                          ),
                          backgroundColor: const Color(0xFF179dff),
                        ),
                        onPressed: () {
                          removeStringFromList(inputValue, 'myAlertsGoldList');
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AlertPage()),
                          );
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Đồng ý',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColor.textNormal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        );
      },
    );
  }

  void _onDeleteCurrencyAlert(BuildContext context, String inputValue) {
    showModalBottomSheet<String>(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
              color: AppColor.greyBackground,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0))),
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      width: 120,
                      height: 120,
                      child: const Icon(
                        Icons.warning_amber_rounded,
                        color: Colors.white,
                        size: 60,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Bạn muốn xóa cảnh báo này?",
                      style: AppTextStyles.txt16SemiBold.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        "Bạn sẽ không thể hoàn tác khi đã xóa cảnh báo.",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.txt16SemiBold.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Row(children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                        bottom: 20.0,
                        top: 10,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          side: const BorderSide(
                            width: 2,
                            color: Color(0xFF179dff),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Hủy',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF179dff),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                        bottom: 20.0,
                        top: 10,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          side: const BorderSide(
                            width: 2,
                            color: Colors.white,
                          ),
                          backgroundColor: const Color(0xFF179dff),
                        ),
                        onPressed: () {
                          removeStringFromList(
                              inputValue, 'myAlertsCurrencyList');
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AlertPage()),
                          );
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Đồng ý',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColor.textNormal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        );
      },
    );
  }
}
