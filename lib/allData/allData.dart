import 'package:milkdairy/all_import.dart';

class AppColor {
  static Color black = Colors.black;
  static Color white = Colors.white;
  static Color blue = Color(0xFF2196F3);
  static Color red = Colors.red;
  static Color green = Colors.green;
  static Color blueGrey = Colors.blueGrey;
  static Color yellow = Color(0xFFF8C204);
  static Color deepPurple = Color(0xFF0066B7);
  static Color Grey = Color(0xFFB0DCFF);
}

class AppBodyColor {
  static Color blue = Color(0xFF2196F3);
  static Color black = Colors.black;
  static Color white = Color(0xFFFFFFFF);
  static Color deepPurple = Color(0xFF0066B7);
  static Color red = Colors.red;
  static Color yellow = Color(0xFFF8C204);
  static Color blueGrey = Color(0xFFB0DCFF);
  static Color grey = Color(0xFFA8D8FF);
  static Color backGro = Color(0xFFC9E7FF);
  static Color peach = Color(0xFFD9D9D9);
  static Color greyIcon = Color(0xFFB9E0FF);
}

bool isSnackBarVisible = false;

void snackMessage(BuildContext context, String msg, {int no = 1}) {
  if (!isSnackBarVisible) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg,
            style: TextStyle(color: no == 1 ? Colors.red : Colors.green)),
        backgroundColor: Colors.white,
      ),
    );
    isSnackBarVisible = true;
    Future.delayed(const Duration(seconds: 3), () {
      isSnackBarVisible = false;
    });
  }
}

Widget buildTextField(controllerData, labelName) {
  return TextField(
    style: TextStyle(color: AppColor.black),
    textInputAction: TextInputAction.next,
    controller: controllerData,
    readOnly: true,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.all(14),
        labelStyle: TextStyle(color: AppColor.black),
        labelText: labelName,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: AppBodyColor.black),
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppBodyColor.black),
            borderRadius: BorderRadius.circular(8)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppBodyColor.black),
            borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppBodyColor.black),
            borderRadius: BorderRadius.circular(8))),
  );
}

Widget buildTextFieldProfile(controllerData, labelName, data) {
  return TextField(
    style: TextStyle(color: AppColor.white),
    textInputAction: TextInputAction.next,
    controller: controllerData,
    readOnly: data,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.all(14.w),
        labelStyle: TextStyle(color: AppColor.white),
        labelText: labelName,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: AppBodyColor.white),
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppBodyColor.white),
            borderRadius: BorderRadius.circular(8)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppBodyColor.white),
            borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppBodyColor.white),
            borderRadius: BorderRadius.circular(8))),
  );
}

Widget buildFloatingActionButton(onPressed) {
  return FloatingActionButton(
      backgroundColor: AppBodyColor.deepPurple,
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
      onPressed: onPressed);
}

Widget buildCard(
  title,
  assetName,
) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.w),
      ),
      child: ClipPath(
        clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 4.w,
                ),
                borderRadius: BorderRadius.circular(16.w))),
        child: Container(
          padding: EdgeInsets.all(10),
          height: 170.h,
          width: 150.w,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                left: BorderSide(width: 16.w, color: AppColor.deepPurple)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16.w,
                    color: AppColor.black,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10.h,
              ),
              CircleAvatar(
                  radius: 28.w,
                  backgroundColor: AppBodyColor.greyIcon,
                  child: Image(
                    height: 30.h,
                    width: 30.w,
                    image: AssetImage(assetName),
                    color: AppBodyColor.black,
                  )),
            ],
          ),
        ),
      ),
    ),
  );
}

class Main_Theme {
  static mainTheme(
      {required width,
      required icononpress,
      required String pageName,
      actionList,
      floatingAction,
      actionwiget,
      color,
      required widget}) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: floatingAction,
        body: Container(
          color: AppBodyColor.deepPurple,
          child: Column(
            children: [
              SizedBox(
                width: width,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: icononpress,
                          child: Icon(
                            Icons.arrow_back,
                            size: 30.h,
                            color: AppBodyColor.white,
                          )),
                      buildText(
                          pageName, 20.w, AppColor.white, FontWeight.w500),
                      actionwiget,
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: Container(
                  // height: 600,
                  width: width,
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  // height: height,
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.elliptical(30, 30))),
                  child: widget,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Main_ThemeHome {
  static mainTheme(context,
      {required width, widgets, actionWidget, required widget}) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: AppColor.deepPurple,
          child: Column(
            children: [
              SizedBox(
                width: width,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.welcome,
                            style: TextStyle(
                                color: AppColor.white,
                                fontSize: 18.w,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            AppLocalizations.of(context)!.myDairy,
                            style: TextStyle(
                                color: AppColor.white,
                                fontSize: 24.w,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Container(
                            child: widgets,
                          ),
                        ],
                      ),
                      actionWidget
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  width: width,
                  padding: EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  decoration: BoxDecoration(
                      color: AppBodyColor.grey,
                      borderRadius: BorderRadius.vertical(
                          top: Radius.elliptical(30, 30))),
                  child: widget,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildText(text, fontSize, color, fontWeight) {
  return Text(
    text,
    style: TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight),
  );
}

Widget buildSumm(text, fontSize, color, fontWeight) {
  return SingleChildScrollView(
    primary: true,
    scrollDirection: Axis.horizontal,
    child: Text(
      text,
      style:
          TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight),
    ),
  );
}

Widget buildContainer(height, width, color, text, colortext,
    {bool loading = false}) {
  return Container(
    height: height,
    width: width,
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
    child: Center(
        child: loading
            ? CircularProgressIndicator(color: AppBodyColor.white)
            : Text(
                text,
                style: TextStyle(
                    color: colortext,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.w),
              )),
  );
}

TextStyle hintStyle() {
  return const TextStyle(color: Colors.black, fontWeight: FontWeight.w400);
}

Widget buildTextFie(context,
    {controllerData,
    keyboardType,
    obscureText,
    hintText,
    suffixIcon,
    prefixIcon,
    labelText,
    maxLines,
    readOnly,
    hintColor,
    void Function()? onTap,
    maxLength}) {
  return Padding(
    padding: EdgeInsets.only(top: 20.w),
    child: TextFormField(
      readOnly: readOnly ?? false,
      onTap: onTap,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      maxLength: maxLength ?? 50,
      maxLines: maxLines ?? 1,
      obscureText: obscureText ?? false,
      textAlign: TextAlign.start,
      textAlignVertical: suffixIcon != null || prefixIcon != null
          ? TextAlignVertical.center
          : null,
      style:
          TextStyle(color: hintColor ?? AppColor.black, fontFamily: "Roboto"),
      keyboardType: keyboardType ?? TextInputType.multiline,
      textInputAction: TextInputAction.next,
      controller: controllerData,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        counterText: "",
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintStyle:
            TextStyle(color: hintColor ?? Colors.black54, fontFamily: "Roboto"),
        labelText: labelText,
        hintText: hintText ?? labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.w)),
      ),
    ),
  );
}
