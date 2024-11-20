import 'package:flutter/services.dart';

import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:inventory_management/inventory_management_module/core/extensions/extensions.dart';
import 'package:inventory_management/inventory_management_module/core/widgets/dialog/default_dialog.dart';
import 'package:share_plus/share_plus.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../constants/app_assets.dart';
import '../widgets/loading/loading.dart';
import 'get_dialog_helper.dart';
//Youssef Ashraf
///Helper Class resbonsible for sharing images for printing docs or sharing widgets as images (Qr)

abstract class ShareHelper {
  ///used for sharing widgets as Images
  static Future<void> captureAndShare({
    required RenderRepaintBoundary boundary,
  }) async {
    ui.Image image = await boundary.toImage(pixelRatio: 5);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    String mime = 'image/png';
    final XFile xfile =
        XFile.fromData(pngBytes, mimeType: mime, name: '${Random()}.png');

    await Share.shareXFiles(
      [xfile],
    );
  }

  ///Calculate the duration between two dates
  static Duration calculateDifference(DateTime startDate, String? startTime,
      DateTime endDate, String? endTime) {
    DateFormat timeFormat = DateFormat("hh:mm a");

    DateTime startDateTime;
    DateTime endDateTime;

    if (startTime != '') {
      DateTime parsedStartTime = timeFormat.parse(startTime!);
      startDateTime = DateTime(
        startDate.year,
        startDate.month,
        startDate.day,
        parsedStartTime.hour,
        parsedStartTime.minute,
      );
    } else {
      startDateTime =
          DateTime(startDate.year, startDate.month, startDate.day, 0, 0);
    }

    if (endTime != '') {
      DateTime parsedEndTime = timeFormat.parse(endTime!);
      endDateTime = DateTime(
        endDate.year,
        endDate.month,
        endDate.day,
        parsedEndTime.hour,
        parsedEndTime.minute,
      );
    } else {
      endDateTime = DateTime(endDate.year, endDate.month, endDate.day, 0, 0);
    }

    return endDateTime.difference(startDateTime);
  }

  static printDoc(List<List<dynamic>> data, List<String> headers,
      [List<Uint8List>? images]) async {
    try {
      showLoadingIndicator();
      final doc = pw.Document(
        compress: false,
        title: 'Inventory Management',
      );
      final arabicFont = await PdfGoogleFonts.cairoRegular();

      if (Get.context!.isArabic) {
        headers = headers.reversed.toList();
      }

      doc.addPage(
        pw.MultiPage(
          margin: pw.EdgeInsets.zero,
          build: (pw.Context context) {
            return [
              buildPdfTable(data, headers, arabicFont),
            ];
          },
        ),
      );

      bool result = await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => await doc.save(),
        format: PdfPageFormat.standard,
      );
      hideLoadingIndicator();
      if (result && Get.context!.isDesktop) {
        GetDialogHelper.generalDialog(
          context: Get.context!,
          child: const DefaultDialog(
            title: 'Success',
            subTitle: 'Document Has Been Saved',
            lottieAsset: AppAssets.success,
          ),
        );
      }
    } catch (e) {
      GetDialogHelper.generalDialog(
        context: Get.context!,
        child: const DefaultDialog(
          title: 'Error',
          subTitle: 'Erro Occured, Please Try Again',
          icon: AppAssets.canceled,
        ),
      );
    }
  }

  static pw.Widget buildPdfTable(
    List<List<dynamic>> data,
    List<String> headers,
    pw.Font arabicFont,
  ) {
    final table = pw.Table(
      border: pw.TableBorder.symmetric(),
      children: [
        // Header Row
        pw.TableRow(
          decoration: pw.BoxDecoration(
            color: PdfColor.fromHex('#2D2D2D'),
          ),
          children: headers.map((header) {
            return pw.Padding(
              padding: const pw.EdgeInsets.all(4),
              child: pw.Text(
                header.tr,
                textDirection: Get.context!.isArabic
                    ? pw.TextDirection.rtl
                    : pw.TextDirection.ltr,
                style: pw.TextStyle(
                  font: arabicFont,
                  fontSize: 10,
                  color: PdfColors.white,
                ),
              ),
            );
          }).toList(),
        ),
        // Data Rows
        ...data.asMap().entries.map((entry) {
          final rowIndex = entry.key;
          List<dynamic> row = entry.value;
          if (Get.context!.isArabic) {
            row = row.reversed.toList();
          }

          return pw.TableRow(
            decoration: pw.BoxDecoration(
              color: rowIndex % 2 == 0
                  ? PdfColor.fromHex('#F5F5F5')
                  : PdfColors.white,
            ),
            children: row.map((cell) {
              final textStyle = pw.TextStyle(
                font: arabicFont,
                fontSize: 8,
                color: _getCellColor(cell),
              );

              return pw.Padding(
                padding: const pw.EdgeInsets.all(4),
                child: pw.Text(
                  cell.toString().tr,
                  textDirection: Get.context!.isArabic
                      ? pw.TextDirection.rtl
                      : pw.TextDirection.ltr,
                  style: textStyle,
                ),
              );
            }).toList(),
          );
        }),
      ],
    );

    return pw.ClipRRect(
      verticalRadius: 8.r,
      horizontalRadius: 8.r,
      child: table,
    );
  }

  /// Helper function to determine cell color
  static PdfColor _getCellColor(dynamic cell) {
    const colors = {
      'Approved': '#008000',
      'InUse': '#008000',
      'Rejected': '#DF1C1C',
      'Canceled': '#DF1C1C',
      'Expired': '#DF1C1C',
      'Pending': '#FF814A',
      'Not Applicable': '#797979',
      'Maintenance': '#E5B800',
      'Returned': '#FFDE59',
    };

    return PdfColor.fromHex(colors[cell.toString()] ?? '#2D2D2D');
  }
}
