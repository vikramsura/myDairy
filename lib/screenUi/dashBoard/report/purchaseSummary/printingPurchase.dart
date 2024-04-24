import 'package:intl/intl.dart';
import 'package:milkdairy/all_import.dart';
import 'package:pdf/widgets.dart' as pw;

class PrintingPurchase extends StatefulWidget {
  PurchaseSummaryModelData PrintingData;

  PrintingPurchase({Key? key, required this.PrintingData}) : super(key: key);

  @override
  State<PrintingPurchase> createState() => _PrintingPurchaseState();
}

class _PrintingPurchaseState extends State<PrintingPurchase> {
  Future<Uint8List> _generatePdf(PdfPageFormat format) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final font =
        pw.Font.ttf(await rootBundle.load("Assets/fonts/Hind-Regular.ttf"));

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (contexts) {
          var itemText = AppLocalizations.of(context)!;
          var data = widget.PrintingData;
          return pw.Padding(
              padding: pw.EdgeInsets.all(20.w),
              child: pw.Column(
                children: [
                  pw.SizedBox(height: 50.h),
                  pw.Row(children: [
                    pw.Text(itemText.purchaseSummary,
                        style: pw.TextStyle(
                          font: font,
                          fontSize: 20.w,
                        )),
                    pw.SizedBox(width: 50.h),
                    pw.Text(itemText.date,
                        style: pw.TextStyle(
                          font: font,
                          fontSize: 20.w,
                        )),
                    pw.SizedBox(width: 20.w),
                    pw.Text(timeShow.toString(),
                        style: pw.TextStyle(
                          font: font,
                          fontSize: 20.w,
                        )),
                  ]),
                  pw.SizedBox(height: 50.h),
                  pw.Table(
                      border: pw.TableBorder.all(color: PdfColors.black),
                      children: [
                        pw.TableRow(children: [
                          pw.Center(
                            child: pw.Text(itemText.name,
                                style: pw.TextStyle(
                                  font: font,
                                  fontSize: 20.w,
                                )),
                          ),
                          pw.Center(
                            child: pw.Text(UserDetails.userName.toString(),
                                style: pw.TextStyle(
                                  font: font,
                                  fontSize: 20.w,
                                )),
                          ),
                        ]),
                        pw.TableRow(children: [
                          pw.Center(
                            child: pw.Text(itemText.dairyName,
                                style: pw.TextStyle(
                                  font: font,
                                  fontSize: 20.w,
                                )),
                          ),
                          pw.Center(
                            child: pw.Text(UserDetails.userDairyName.toString(),
                                style: pw.TextStyle(
                                  font: font,
                                  fontSize: 20.w,
                                )),
                          ),
                        ]),
                        pw.TableRow(children: [
                          pw.Center(
                            child: pw.Text("${itemText.farmer} ${itemText.id}",
                                style: pw.TextStyle(
                                  font: font,
                                  fontSize: 20.w,
                                )),
                          ),
                          pw.Center(
                            child: pw.Text(data.userUniId.toString(),
                                style: pw.TextStyle(
                                  font: font,
                                  fontSize: 20.w,
                                )),
                          ),
                        ]),
                        pw.TableRow(children: [
                          pw.Center(
                            child: pw.Text(itemText.milkType,
                                style: pw.TextStyle(
                                  font: font,
                                  fontSize: 20.w,
                                )),
                          ),
                          pw.Center(
                            child: pw.Text(data.milkType.toString(),
                                style: pw.TextStyle(
                                  font: font,
                                  fontSize: 20.w,
                                )),
                          ),
                        ]),
                        pw.TableRow(children: [
                          pw.Center(
                            child: pw.Text(itemText.qty,
                                style: pw.TextStyle(
                                  font: font,
                                  fontSize: 20.w,
                                )),
                          ),
                          pw.Center(
                            child: pw.Text(data.qty.toString(),
                                style: pw.TextStyle(
                                  font: font,
                                  fontSize: 20.w,
                                )),
                          ),
                        ]),
                        pw.TableRow(children: [
                          pw.Center(
                            child: pw.Text(itemText.fat,
                                style: pw.TextStyle(
                                  font: font,
                                  fontSize: 20.w,
                                )),
                          ),
                          pw.Center(
                            child: pw.Text(data.qty.toString(),
                                style: pw.TextStyle(
                                  font: font,
                                  fontSize: 20.w,
                                )),
                          ),
                        ]),
                        pw.TableRow(children: [
                          pw.Center(
                            child: pw.Text(itemText.snf,
                                style: pw.TextStyle(
                                  font: font,
                                  fontSize: 20.w,
                                )),
                          ),
                          pw.Center(
                            child: pw.Text(data.snf.toString(),
                                style: pw.TextStyle(
                                  font: font,
                                  fontSize: 20.w,
                                )),
                          ),
                        ]),
                        pw.TableRow(children: [
                          pw.Center(
                            child: pw.Text(itemText.clr,
                                style: pw.TextStyle(
                                  font: font,
                                  fontSize: 20.w,
                                )),
                          ),
                          pw.Center(
                            child: pw.Text(data.clr.toString(),
                                style: pw.TextStyle(
                                  font: font,
                                  fontSize: 20.w,
                                )),
                          ),
                        ]),
                        pw.TableRow(children: [
                          pw.Center(
                            child: pw.Text(itemText.rate,
                                style: pw.TextStyle(
                                  font: font,
                                  fontSize: 20.w,
                                )),
                          ),
                          pw.Center(
                            child: pw.Text(data.amt.toString(),
                                style: pw.TextStyle(
                                  font: font,
                                  fontSize: 20.w,
                                )),
                          ),
                        ]),
                        pw.TableRow(children: [
                          pw.Center(
                            child: pw.Text(itemText.amount,
                                style: pw.TextStyle(
                                  font: font,
                                  fontSize: 20.w,
                                )),
                          ),
                          pw.Center(
                            child: pw.Text(data.totalAmount.toString(),
                                style: pw.TextStyle(
                                  font: font,
                                  fontSize: 20.w,
                                )),
                          ),
                        ]),
                      ])
                ],
              ));
        },
      ),
    );

    return pdf.save();
  }

  String? timeShow;

  void getInitDate() {
    final dateTime = DateTime.now();
    final initDate =
        DateFormat("yyyy-MM-dd hh:mm a").format(dateTime).toString();
    timeShow = initDate;
  }

  @override
  void initState() {
    getInitDate();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var itemText = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(itemText.printing), centerTitle: true),
      body: PdfPreview(
        build: (format) => _generatePdf(format),
      ),
    );
  }
}
