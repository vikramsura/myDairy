import 'package:milkdairy/all_import.dart';

class RateParameters extends StatelessWidget {
  const RateParameters({super.key});

  @override
  Widget build(BuildContext context) {
    var itemText = AppLocalizations.of(context)!;

    return Main_Theme.mainTheme(
        actionwiget: const SizedBox(),
        color: AppBodyColor.backGro,
        width: MediaQuery.of(context).size.width,
        icononpress: () {
          Navigator.pop(context);
        },
        pageName: itemText.rateParameters,
        widget: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Container(
                height: 48.h,
                decoration: BoxDecoration(color: AppBodyColor.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildSizedBox(80.w, itemText.type),
                    buildSizedBox(50.w, itemText.cow),
                    buildSizedBox(50.w, itemText.buffalo),
                    buildSizedBox(50.w, itemText.mix),
                    buildSizedBox(50.w, itemText.other),
                  ],
                ),
              ),
              buildContainerOutput(itemText.minFAT),
              buildContainerOutput(itemText.maxFAT),
              buildContainerOutput(itemText.minSNF),
              buildContainerOutput(itemText.maxSNF),
              buildContainerOutput(itemText.minLR),
              buildContainerOutput(itemText.maxLR),
              buildContainerOutput(itemText.minSolid),
              buildContainerOutput(itemText.maxSolid),
              buildContainerOutput(itemText.societyKiloConst),
              buildContainerOutput(itemText.dairyKiloConst),
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: AppBodyColor.white,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.w),
                              borderSide: BorderSide.none),
                          actions: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 28.w,
                                ),
                                const Image(
                                    image: AssetImage(
                                        "Assets/new/manualMilkColl.png")),
                                SizedBox(
                                  height: 28.w,
                                ),
                                buildText(itemText.save, 18.w, AppColor.black,
                                    FontWeight.w500),
                                SizedBox(
                                  height: 28.w,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              backgroundColor:
                                                  AppBodyColor.white,
                                              shape: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.w),
                                                  borderSide: BorderSide.none),
                                              actions: [
                                                Container(
                                                  // height: 157,
                                                  child: Center(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          height: 28.h,
                                                        ),
                                                        const ImageIcon(
                                                          AssetImage(
                                                            "Assets/new/yes.png",
                                                          ),
                                                          size: 40,
                                                          color:
                                                              Color(0xff00b42c),
                                                        ),
                                                        SizedBox(
                                                          height: 10.h,
                                                        ),
                                                        buildText(
                                                            itemText
                                                                .datasavedsuccessfuly,
                                                            18.w,
                                                            AppColor.black,
                                                            FontWeight.w500),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: buildContainer(
                                          40.w,
                                          100.w,
                                          AppBodyColor.blue,
                                          itemText.oK,
                                          AppColor.white),
                                    ),
                                    SizedBox(
                                      width: 10.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: buildContainer(
                                          40.w,
                                          100.w,
                                          AppBodyColor.blue,
                                          itemText.cANCEL,
                                          AppColor.white),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        );
                      });
                },
                child: buildContainer(50.h, MediaQuery.of(context).size.width,
                    AppBodyColor.deepPurple, itemText.submit, AppColor.white),
              ),
              SizedBox(
                height: 30.h,
              )
            ],
          ),
        ));
  }

  Widget buildSizedBox(width, value) {
    return SizedBox(
        width: width,
        child: Text(
          value,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 16.w, fontWeight: FontWeight.w400),
        ));
  }

  Widget buildContainerOutput(value) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h),
      child: SizedBox(
        height: 35.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: 80.w,
                child: Text(
                  value,
                  overflow: TextOverflow.ellipsis,
                )),
            buildContainerInput(),
            buildContainerInput(),
            buildContainerInput(),
            buildContainerInput()
          ],
        ),
      ),
    );
  }

  Widget buildContainerInput() {
    return Container(
      width: 50.w,
      height: 35.h,
      decoration: BoxDecoration(
          color: AppBodyColor.white, borderRadius: BorderRadius.circular(2)),
      child: const Center(
          child: TextField(
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(bottom: 15),
        ),
      )),
    );
  }
}
