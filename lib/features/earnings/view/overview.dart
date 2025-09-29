import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/constants/asstes_path/icons_path.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fl_chart/fl_chart.dart';

import '../widgets/sorting_section_widget.dart';

class Overview extends StatefulWidget {
  const Overview({super.key});

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SortingSectionWidget(),
            SizedBox(height: 5.h),
            buildEarningListSection(),
            SizedBox(height: 5.h),
            buildChartSection(context),
          ],
        ),
      ),
    );
  }

  Widget buildChartSection(BuildContext context) {
    List<FlSpot> spots = [
      FlSpot(0, 6), // Jan
      FlSpot(1, 2), // Feb
      FlSpot(2, 4), // Mar
      FlSpot(3, 3), // Apr
      FlSpot(4, 5), // May
      FlSpot(5, 4), // Jun
      FlSpot(6, 7.5), // Jul (Highest point)
      FlSpot(7, 5), // Aug
      FlSpot(8, 6), // Sep
      FlSpot(9, 5.5), // Oct
      FlSpot(10, 6.5), // Nov
      FlSpot(11, 6), // Dec
    ];

    num maxValue = 0;
    num maxValueIndex = 0;

    findMaxValueAndIndex() {
      for (var item in spots) {
        if (item.y > maxValue) {
          maxValue = item.y;
          maxValueIndex = item.x;
          // print('Value $maxValue index$maxValueIndex');
        }
      }
    }

    findMaxValueAndIndex();

    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Yearly earnings',
            style: fontSize20(
              context,
            )!.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          AspectRatio(
            aspectRatio: 3.5,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 25,
                      interval: 1,
                      getTitlesWidget: getTitleWidget,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    color: AppColors.themColor,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        //TODO: to collect the highest value from api
                        if (spot.y == maxValue) {
                          maxValueIndex = index;
                          return FlDotCirclePainter(
                            radius: 5,
                            color: AppColors.themColor,
                            strokeWidth: 4,
                            strokeColor: Colors.white,
                          );
                        }
                        return FlDotCirclePainter(radius: 0);
                      },
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [AppColors.themColor, Colors.white],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
                extraLinesData: ExtraLinesData(
                  verticalLines: [
                    VerticalLine(
                      x: maxValueIndex.toDouble(),
                      color: AppColors.themColor.shade100,
                      strokeWidth: 20,
                      strokeCap: StrokeCap.round,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildEarningListSection() {
    List<Map<String, dynamic>> cardList = [
      {
        'title': 'Total Earning',
        'earning': '0.00',
        'isIncrease': false,
        'inDecreaseAmt': '0.00',
      },
      {
        'title': 'From tips',
        'earning': '0.00',
        'isIncrease': true,
        'inDecreaseAmt': '0.00',
      },
      {
        'title': 'From Bonus',
        'earning': '0.00',
        'isIncrease': null,
        'inDecreaseAmt': '0.00',
      },
      {
        'title': 'Affiliate earnings',
        'earning': '0.00',
        'isIncrease': false,
        'inDecreaseAmt': '0.00',
      },
    ];
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: cardList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: buildEarningCard(
            context,
            title: cardList[index]['title'],
            earning: cardList[index]['earning'],
            isIncrease: cardList[index]['isIncrease'],
            inDecreaseAmount: cardList[index]['inDecreaseAmt'],
            isSelected: selectedIndex == index
          ),
        );
      },
    );
  }

  Padding buildEarningCard(
    BuildContext context, {
    required String title,
    required String earning,
    bool? isIncrease,
    required String inDecreaseAmount,
    required bool isSelected,
  }) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 8.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.h),
        width: double.infinity,
        decoration: BoxDecoration(
          color: isSelected? AppColors.themColor:Colors.white,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total earning',
              style: fontSize12(context)!.copyWith(color: Colors.white),
            ),
            Text(
              '\$$earning',
              style: fontSize20(
                context,
              )!.copyWith(color: isSelected? Colors.white:Colors.black, fontWeight: FontWeight.w600),
            ),
            Row(
              children: [
                isIncrease == null
                    ? SizedBox.shrink()
                    : isIncrease == true
                    ? Icon(Icons.auto_graph, color:isSelected? Colors.white:Colors.black)
                    : SvgPicture.asset(IconsPath.lowGraphIconSvg,color: Colors.red,),
                SizedBox(width: 10.w),
                Text(
                  isIncrease == null
                      ? 'No Changes on last month'
                      : isIncrease == true
                      ? 'Increase of \$$inDecreaseAmount from last month'
                      : 'Decrease of \$$inDecreaseAmount from last month',
                  style: fontSize12(
                    context,
                  )!.copyWith(fontWeight: FontWeight.w300, color: isSelected? Colors.white:Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getTitleWidget(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('JAN', style: style);
        break;
      case 1:
        text = const Text('FEB', style: style);
        break;
      case 2:
        text = const Text('MAR', style: style);
        break;
      case 3:
        text = const Text('APR', style: style);
        break;
      case 4:
        text = const Text('MAY', style: style);
        break;
      case 5:
        text = const Text('JUN', style: style);
        break;
      case 6:
        text = const Text('JUL', style: style);
        break;
      case 7:
        text = const Text('AUG', style: style);
        break;
      case 8:
        text = const Text('SEP', style: style);
        break;
      case 9:
        text = const Text('OCT', style: style);
        break;
      case 10:
        text = const Text('NOV', style: style);
        break;
      case 11:
        text = const Text('DEC', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(meta: meta, space: 8, child: text);
  }
}
