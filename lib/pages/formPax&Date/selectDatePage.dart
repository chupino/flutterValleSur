import 'package:apitest3/components/ContainerRounded.dart';
import 'package:apitest3/components/headerSelectDate.dart';
import 'package:apitest3/components/headerSelectPaxAndDate.dart';
import 'package:apitest3/components/item_button_widget.dart';
import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:apitest3/core/constants/dimension_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SelectDateScreen extends StatelessWidget {
  SelectDateScreen({Key? key}) : super(key: key);

  static const String routeName = '/select_date_screen';

  DateTime? rangeStartDate;
  DateTime? rangeEndDate;
  int difference = 0;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorPalette.backgroundScaffoldSecundaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SimpleHeader(
              size: size,
              title: "Seleccionar Fecha",
              height: 160,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              child: Column(
                children: [
                  RoundedContainer(
                    borderRadius: 20.0,
                    padding: EdgeInsets.only(right: 20, left: 20, top: 20),
                    child: SfDateRangePicker(
                      /* backgroundColor: const Color.fromARGB(255, 143, 103, 232).withOpacity(0.1), */
                      view: DateRangePickerView.month,
                      selectionMode: DateRangePickerSelectionMode.range,
                      minDate: DateTime.now(),
                      monthViewSettings:
                          DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
                      selectionColor: ColorPalette.secondColor,
                      startRangeSelectionColor: ColorPalette.secondColor,
                      endRangeSelectionColor: ColorPalette.secondColor,
                      rangeSelectionColor:
                          ColorPalette.secondColor.withOpacity(0.25),
                      todayHighlightColor: ColorPalette.secondColor,
                      toggleDaySelection: true,
                      onSelectionChanged:
                          (DateRangePickerSelectionChangedArgs args) {
                        if (args.value is PickerDateRange) {
                          final selectedRange = args.value as PickerDateRange;

                          if (selectedRange.startDate != null &&
                              selectedRange.endDate != null) {
                            rangeStartDate = selectedRange.startDate;
                            rangeEndDate = selectedRange.endDate;

                            difference = rangeEndDate!
                                .difference(rangeStartDate!)
                                .inDays;

                            //print('Diferencia de días: $difference');
                          }
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ItemButtonWidget(
                    data: 'Seleccionar',
                    onTap: () {
                      if (difference >= 1) {
                        Navigator.of(context)
                            .pop([rangeStartDate, rangeEndDate]);
                      } else {
                        Get.snackbar('Atención',
                            'Debes seleccionar al menos dos fechas',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: ColorPalette.primaryColor,
                            colorText: Colors.white,
                            margin: const EdgeInsets.all(10),
                            duration: const Duration(seconds: 2));
                      }
                    },
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  ItemButtonWidget(
                    data: 'Cancelar',
                    color: ColorPalette.secondColor.withOpacity(0.7),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
