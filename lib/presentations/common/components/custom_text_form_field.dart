// ignore_for_file: no-magic-number

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:se109_goldstore/constants/text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.shape,
    this.padding,
    this.variant,
    this.fontStyle,
    this.alignment,
    this.width,
    this.margin,
    this.controller,
    this.focusNode,
    this.isObscureText = false,
    this.textInputAction = TextInputAction.next,
    this.hintText,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.validator,
    this.keyboardType,
    this.textAlign,
    this.enabled,
    this.inputFormatters,
    this.onChanged,
    this.errorText,
    this.textColor,
    this.onEditingComplete,
    this.onTap,
    this.textCapitalization = TextCapitalization.none,
    this.onFieldSubmitted,
    this.showPasswordIcon = false,
    this.useManropeFont = false,
    this.labelText,
    this.initialValue,
    this.maxLines = 1,
    this.autoFocus = false,
    this.fillColor,
    this.minLines,
    this.label,
    this.constraints,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.scrollController,
    this.borderWidth = 2.0,
    this.contentPadding,
    this.radius = 5.0,
    this.isUseEyeWithWhiteStyle = false,
    this.maxLength,
    this.style,
  });

  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;
  final Alignment? alignment;
  final TextEditingController? controller;
  final bool? enabled;
  final bool useManropeFont;
  final String? errorText;
  final FocusNode? focusNode;
  final TextFormFieldFontStyle? fontStyle;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final bool? isObscureText;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? margin;
  final TextFormFieldPadding? padding;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final TextFormFieldShape? shape;
  final bool showPasswordIcon;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final TextAlign? textAlign;
  final TextCapitalization textCapitalization;
  final Color? textColor;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final TextFormFieldVariant? variant;
  final double? width;
  final String? labelText;
  final String? initialValue;
  final int? maxLines;
  final bool autoFocus;
  final Color? fillColor;
  final int? minLines;
  final Widget? label;
  final BoxConstraints? constraints;
  final AutovalidateMode autovalidateMode;
  final ScrollController? scrollController;
  final double borderWidth;
  final EdgeInsetsGeometry? contentPadding;
  final double radius;
  final bool isUseEyeWithWhiteStyle;
  final int? maxLength;
  final TextStyle? style;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool isHidePassword;

  @override
  initState() {
    super.initState();
    isHidePassword = widget.isObscureText!;
  }

  _buildTextFormFieldWidget() {
    return Container(
      width: widget.width,
      margin: widget.margin,
      constraints: widget.constraints,
      child: TextFormField(
        buildCounter: (BuildContext context,
                {int? currentLength, int? maxLength, bool? isFocused}) =>
            null,
        maxLength: widget.maxLength,
        autovalidateMode: widget.autovalidateMode,
        initialValue: widget.initialValue,
        controller: widget.controller,
        focusNode: widget.focusNode,
        textCapitalization: widget.textCapitalization,
        autocorrect: false,
        scrollController: widget.scrollController,
        style: widget.style ?? _setFontStyle(),
        obscureText: isHidePassword,
        textInputAction: widget.textInputAction,
        decoration: _buildDecoration(),
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        textAlign: widget.textAlign ?? TextAlign.left,
        enabled: widget.enabled,
        inputFormatters: widget.inputFormatters,
        onChanged: widget.onChanged,
        enableInteractiveSelection: true,
        onEditingComplete: widget.onEditingComplete,
        onTap: widget.onTap,
        onFieldSubmitted: widget.onFieldSubmitted,
        maxLines: widget.isObscureText == true ? 1 : widget.maxLines,
        autofocus: widget.autoFocus,
        minLines: widget.minLines,
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: widget.hintText ?? "",
      hintStyle: _setPlaceholderFontStyle(),
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(),
      focusedBorder: _setFocusedBorderStyle(),
      disabledBorder: _setBorderStyle(),
      errorBorder: _setErrorBorderStyle(),
      focusedErrorBorder: _setErrorFocusedBorderStyle(),
      prefixIcon: widget.prefix,
      prefixIconConstraints: widget.prefixConstraints,
      suffixIcon: widget.showPasswordIcon
          ? GestureDetector(
              onTap: () => setState(() {
                isHidePassword = !isHidePassword;
              }),
              child: const Padding(
                padding: EdgeInsets.all(12),
                // child: _renderShowHidePassword(),
              ),
            )
          : widget.suffix,
      suffixIconConstraints: widget.suffixConstraints,
      fillColor: widget.fillColor ??
          (widget.enabled ?? true ? _setFillColor() : Colors.black),
      filled: _setFilled(),
      isDense: true,
      contentPadding: widget.contentPadding ?? _setPadding(),
      errorMaxLines: 10,
      errorText: widget.errorText,
      labelText: widget.label != null ? null : widget.labelText,
      labelStyle: AppTextStyles.txt16SemiBold.copyWith(
        fontFamily: widget.useManropeFont ? "Manrope" : "Manrope",
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      errorStyle: _setFontErrorStyle(),
      label: widget.label,
    );
  }

  // Widget _renderShowHidePassword() {
  //   if (widget.isUseEyeWithWhiteStyle) {
  //     return isHidePassword
  //         ? const Icon(
  //             Icons.remove_red_eye_outlined,
  //             color: Colors.white,
  //             size: 25,
  //           )
  //         : Image.asset(
  //             ImageAssets.icHidePasswordWhite,
  //             width: 25,
  //             height: 25,
  //           );
  //   } else {
  //     return SvgPicture.asset(
  //       isHidePassword ? ImageAssets.passviewShow : ImageAssets.passviewHide,
  //     );
  //   }
  // }

  _setFontStyle() {
    switch (widget.fontStyle) {
      case TextFormFieldFontStyle.txt16SemiBoldWhite80:
        const opacity = 0.8;
        return AppTextStyles.txt16SemiBold.copyWith(
          color: Colors.white.withOpacity(opacity),
          fontFamily: getFontFamily(),
        );
      case TextFormFieldFontStyle.txt16FillGrey:
        return AppTextStyles.txt16SemiBold.copyWith(
          color: const Color(0x80535353),
          fontFamily: getFontFamily(),
        );
      case TextFormFieldFontStyle.txt24Black300:
        return AppTextStyles.txt16SemiBold.copyWith(
          fontSize: 24,
          color: Colors.black,
          fontFamily: getFontFamily(),
        );
      case TextFormFieldFontStyle.txt20BlackBold700:
        return AppTextStyles.txt16SemiBold.copyWith(
          color: const Color(0xff1D1D1F),
          fontFamily: getFontFamily(),
        );
      case TextFormFieldFontStyle.txtBlackBold600:
        return AppTextStyles.txt16SemiBold.copyWith(
          color: const Color(0xff7B8B9D),
          fontFamily: getFontFamily(),
          fontWeight: FontWeight.w600,
        );
      case TextFormFieldFontStyle.txt12BlackBold600:
        return AppTextStyles.txt16SemiBold.copyWith(
          fontSize: 12,
          color: const Color(0xff7B8B9D),
          fontFamily: getFontFamily(),
          fontWeight: FontWeight.w600,
        );
      case TextFormFieldFontStyle.txtBlackBold14:
        return AppTextStyles.txt16SemiBold.copyWith(
          color: const Color(0xff7B8B9D),
          fontFamily: getFontFamily(),
          fontWeight: FontWeight.w600,
          fontSize: 14,
        );
      default:
        return AppTextStyles.txt16SemiBold.copyWith(
          fontFamily: getFontFamily(),
        );
    }
  }

  String getFontFamily() => widget.useManropeFont ? "Manrope" : "Manrope";

  _setPlaceholderFontStyle() {
    switch (widget.fontStyle) {
      case TextFormFieldFontStyle.txt16SemiBoldWhite80:
        return AppTextStyles.txt16SemiBold.copyWith(
          color: Colors.white.withOpacity(0.8),
          fontFamily: getFontFamily(),
        );
      case TextFormFieldFontStyle.txt16FillGrey:
        return AppTextStyles.txt16SemiBold.copyWith(
          color: const Color(0x80535353),
          fontFamily: getFontFamily(),
        );
      case TextFormFieldFontStyle.txt24Black300:
        return AppTextStyles.txt16SemiBold.copyWith(
          fontSize: 24,
          color: Colors.black,
          fontFamily: getFontFamily(),
        );
      case TextFormFieldFontStyle.txtBlackBold14:
        return AppTextStyles.txt16SemiBold.copyWith(
          color: const Color(0xff7B8B9D),
          fontFamily: getFontFamily(),
          fontWeight: FontWeight.w600,
          fontSize: 13,
        );
      default:
        return AppTextStyles.txt16SemiBold.copyWith(
          color: Colors.black,
          fontSize: 16.0,
          fontFamily: getFontFamily(),
        );
    }
  }

  _setFontErrorStyle() {
    switch (widget.fontStyle) {
      default:
        const fontSize = 14.0;
        return AppTextStyles.txt16SemiBold.copyWith(
          fontSize: fontSize,
          color: Colors.black,
          fontFamily: getFontFamily(),
        );
    }
  }

  _setOutlineBorderRadius() {
    switch (widget.shape) {
      default:
        return BorderRadius.circular(widget.radius);
    }
  }

  _setErrorBorderStyle() {
    switch (widget.variant) {
      default:
        return OutlineInputBorder(
          gapPadding: 6,
          borderRadius: _setOutlineBorderRadius(),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 2,
          ),
        );
    }
  }

  _setErrorFocusedBorderStyle() {
    switch (widget.variant) {
      default:
        return DecoratedInputBorder(
          child: OutlineInputBorder(
            borderRadius: _setOutlineBorderRadius(),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
          shadow: const BoxShadow(
            color: Color(0x66FF0000),
            blurRadius: 12,
          ),
        );
    }
  }

  _setBorderStyle() {
    switch (widget.variant) {
      case TextFormFieldVariant.fillDarkBlue:
        const opacity = 0.2;
        return OutlineInputBorder(
          gapPadding: 6,
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(opacity),
            width: widget.borderWidth,
          ),
        );
      case TextFormFieldVariant.fillWhite:
        const opacity = 0.2;
        return OutlineInputBorder(
          gapPadding: 6,
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: Colors.white,
            width: widget.borderWidth,
          ),
        );
      default:
        return OutlineInputBorder(
          gapPadding: 6,
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: Colors.black,
            width: widget.borderWidth,
          ),
        );
    }
  }

  _setFocusedBorderStyle() {
    switch (widget.variant) {
      case TextFormFieldVariant.fillWhite:
        return DecoratedInputBorder(
          child: OutlineInputBorder(
            gapPadding: 6,
            borderRadius: _setOutlineBorderRadius(),
            borderSide: BorderSide(
              color: Colors.white,
              width: widget.borderWidth,
            ),
          ),
          shadow: const BoxShadow(
            color: Color(0x6628C58C),
            blurRadius: 12,
          ),
        );
      default:
        return DecoratedInputBorder(
          child: OutlineInputBorder(
            gapPadding: 6,
            borderRadius: _setOutlineBorderRadius(),
            borderSide: BorderSide(
              color: Colors.black,
              width: widget.borderWidth,
            ),
          ),
          shadow: const BoxShadow(
            color: Color(0x6628C58C),
            blurRadius: 12,
          ),
        );
    }
  }

  _setFillColor() {
    switch (widget.variant) {
      case TextFormFieldVariant.fillDarkBlue:
        return const Color(0xFF0E182F);
      case TextFormFieldVariant.fillGrey:
        return const Color(0xFFCBCBCB);
      default:
        return Colors.black;
    }
  }

  _setFilled() {
    switch (widget.variant) {
      default:
        return true;
    }
  }

  _setPadding() {
    if (widget.contentPadding != null) {
      return widget.contentPadding;
    }

    switch (widget.padding) {
      case TextFormFieldPadding.Padding0:
        return 0;
      case TextFormFieldPadding.PaddingL24:
        return 16;
      case TextFormFieldPadding.PaddingL40:
        return 16;
      default:
        return hasLabel ? null : 16;
    }
  }

  bool get hasLabel => widget.labelText != null || widget.label != null;

  @override
  Widget build(BuildContext context) {
    return widget.alignment != null
        ? Align(
            alignment: widget.alignment ?? Alignment.center,
            child: _buildTextFormFieldWidget(),
          )
        : _buildTextFormFieldWidget();
  }
}

enum TextFormFieldShape {
  RoundedBorder10,
  RoundedBorder18,
  RoundedBorder5,
}

enum TextFormFieldPadding {
  PaddingTB17,
  PaddingTB30,
  PaddingT19,
  PaddingT13,
  PaddingB12,
  PaddingB9,
  PaddingAll9,
  PaddingR0,
  Padding0,
  PaddingL24,
  PaddingL40
}

enum TextFormFieldVariant {
  fillDarkBlue,
  fillGrey,
  fillWhite,
}

enum TextFormFieldFontStyle {
  txt16SemiBoldWhite80,
  txt16FillGrey,
  txt24Black300,
  txt20BlackBold700,
  txtBlackBold600,
  txt12BlackBold600,
  txtBlackBold14,
}

class DecoratedInputBorder extends InputBorder {
  DecoratedInputBorder({
    required this.child,
    required this.shadow,
  }) : super(borderSide: child.borderSide);

  final InputBorder child;
  final BoxShadow shadow;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;

    return other is DecoratedInputBorder &&
        other.borderSide == borderSide &&
        other.child == child &&
        other.shadow == shadow;
  }

  @override
  InputBorder copyWith(
      {BorderSide? borderSide,
      InputBorder? child,
      BoxShadow? shadow,
      bool? isOutline}) {
    return DecoratedInputBorder(
      child: (child ?? this.child).copyWith(borderSide: borderSide),
      shadow: shadow ?? this.shadow,
    );
  }

  @override
  EdgeInsetsGeometry get dimensions => child.dimensions;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) =>
      child.getInnerPath(rect, textDirection: textDirection);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) =>
      child.getOuterPath(rect, textDirection: textDirection);

  @override
  int get hashCode => Object.hash(borderSide, child, shadow);

  @override
  bool get isOutline => child.isOutline;

  @override
  void paint(Canvas canvas, Rect rect,
      {double? gapStart,
      double gapExtent = 0.0,
      double gapPercentage = 0.0,
      TextDirection? textDirection}) {
    final clipPath = Path()
      ..addRect(const Rect.fromLTWH(-5000, -5000, 10000, 10000))
      ..addPath(getInnerPath(rect), Offset.zero)
      ..fillType = PathFillType.evenOdd;
    canvas.clipPath(clipPath);

    final Paint paint = shadow.toPaint();
    final Rect bounds = rect.shift(shadow.offset).inflate(shadow.spreadRadius);

    canvas.drawPath(getOuterPath(bounds), paint);

    child.paint(canvas, rect,
        gapStart: gapStart,
        gapExtent: gapExtent,
        gapPercentage: gapPercentage,
        textDirection: textDirection);
  }

  @override
  ShapeBorder scale(double t) {
    final scalledChild = child.scale(t);

    return DecoratedInputBorder(
      child: scalledChild is InputBorder ? scalledChild : child,
      shadow: BoxShadow.lerp(null, shadow, t)!,
    );
  }
}
