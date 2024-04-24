import '../../all_import.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  bool isShow1 = false;
  bool isShow2 = false;
  bool isShow3 = false;
  bool isShow4 = false;

  @override
  Widget build(BuildContext context) {
    var itemText = AppLocalizations.of(context)!;
    return Main_Theme.mainTheme(
        actionwiget: SizedBox(),
        color: AppBodyColor.blueGrey,
        width: MediaQuery.of(context).size.width,
        icononpress: () {
          Navigator.pop(context);
        },
        pageName: itemText.help,
        widget: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              Row(
                children: [
                  isShow1
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              isShow1 = false;
                            });
                          },
                          child: buildText(itemText.howtoaddafarmer, 20.w,
                              AppColor.black, FontWeight.w400),
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              isShow1 = true;
                            });
                          },
                          child: buildText(itemText.howtoaddafarmer, 20.w,
                              AppColor.black, FontWeight.w400),
                        ),
                  Spacer(),
                  isShow1
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              isShow1 = false;
                            });
                          },
                          child: Icon(
                            Icons.keyboard_arrow_up,
                            size: 28.w,
                          ))
                      : InkWell(
                          onTap: () {
                            setState(() {
                              isShow1 = true;
                            });
                          },
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 28.w,
                          )),
                ],
              ),
              SizedBox(
                height: 16.w,
              ),
              isShow1
                  ? buildText(itemText.howtoaddafarmerAs, 14.w, AppColor.black,
                      FontWeight.w400)
                  : SizedBox(
                      height: 6.h,
                    ),
              isShow1
                  ? SizedBox(
                      height: 16.w,
                    )
                  : SizedBox(),
              Divider(
                thickness: 1,
                color: AppBodyColor.black,
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  isShow2
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              isShow2 = false;
                            });
                          },
                          child: buildText(itemText.howtochangeusername, 20.w,
                              AppColor.black, FontWeight.w400),
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              isShow2 = true;
                            });
                          },
                          child: buildText(itemText.howtochangeusername, 20.w,
                              AppColor.black, FontWeight.w400),
                        ),
                  Spacer(),
                  isShow2
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              isShow2 = false;
                            });
                          },
                          child: Icon(
                            Icons.keyboard_arrow_up,
                            size: 28.w,
                          ))
                      : InkWell(
                          onTap: () {
                            setState(() {
                              isShow2 = true;
                            });
                          },
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 28.w,
                          )),
                ],
              ),
              SizedBox(
                height: 16.w,
              ),
              isShow2
                  ? buildText(itemText.howtochangeusernameAs, 14.w,
                      AppColor.black, FontWeight.w400)
                  : SizedBox(
                      height: 6.h,
                    ),
              isShow2
                  ? SizedBox(
                      height: 16.w,
                    )
                  : SizedBox(),
              Divider(
                thickness: 1,
                color: AppBodyColor.black,
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  isShow3
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              isShow3 = false;
                            });
                          },
                          child: buildText(itemText.howtochangepassword, 20.w,
                              AppColor.black, FontWeight.w400),
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              isShow3 = true;
                            });
                          },
                          child: buildText(itemText.howtochangepassword, 20.w,
                              AppColor.black, FontWeight.w400),
                        ),
                  Spacer(),
                  isShow3
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              isShow3 = false;
                            });
                          },
                          child: Icon(
                            Icons.keyboard_arrow_up,
                            size: 28.w,
                          ))
                      : InkWell(
                          onTap: () {
                            setState(() {
                              isShow3 = true;
                            });
                          },
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 28.w,
                          )),
                ],
              ),
              SizedBox(
                height: 16.w,
              ),
              isShow3
                  ? buildText(itemText.howtochangepasswordAs, 14.w,
                      AppColor.black, FontWeight.w400)
                  : SizedBox(
                      height: 6.h,
                    ),
              isShow3
                  ? SizedBox(
                      height: 16.w,
                    )
                  : SizedBox(),
              Divider(
                thickness: 1,
                color: AppBodyColor.black,
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  isShow4
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              isShow4 = false;
                            });
                          },
                          child: buildText(itemText.howtologoutfromapp, 20.w,
                              AppColor.black, FontWeight.w400),
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              isShow4 = true;
                            });
                          },
                          child: buildText(itemText.howtologoutfromapp, 20.w,
                              AppColor.black, FontWeight.w400),
                        ),
                  Spacer(),
                  isShow4
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              isShow4 = false;
                            });
                          },
                          child: Icon(
                            Icons.keyboard_arrow_up,
                            size: 28.w,
                          ))
                      : InkWell(
                          onTap: () {
                            setState(() {
                              isShow4 = true;
                            });
                          },
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 28.w,
                          )),
                ],
              ),
              SizedBox(
                height: 16.w,
              ),
              isShow4
                  ? buildText(itemText.howtologoutfromappAs, 14.w,
                      AppColor.black, FontWeight.w400)
                  : SizedBox(
                      height: 6.h,
                    ),
              isShow4
                  ? SizedBox(
                      height: 16.w,
                    )
                  : SizedBox(),
              Divider(
                thickness: 1,
                color: AppBodyColor.black,
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ));
  }
}
