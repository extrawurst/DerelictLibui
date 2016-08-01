/*
 * Copyright (c) 2016 Derelict Developers
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *
 * * Redistributions of source code must retain the above copyright
 *   notice, this list of conditions and the following disclaimer.
 *
 * * Redistributions in binary form must reproduce the above copyright
 *   notice, this list of conditions and the following disclaimer in the
 *   documentation and/or other materials provided with the distribution.
 *
 * * Neither the names 'Derelict', 'DerelictLibui', nor the names of its contributors
 *   may be used to endorse or promote products derived from this software
 *   without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
module derelict.libui.types;

align(1):

alias cstring = const(char)*;

alias uintptr_t = uint*;
alias uint32_t = uint;

alias uintmax_t = size_t;
alias intmax_t = ptrdiff_t;

struct uiInitOptions {
    size_t Size;
}

struct uiWindow {}
struct uiControl {}
struct uiColorButton {}
struct uiMenu {}
struct uiMenuItem {}
struct uiButton {}
struct uiBox {}
struct uiCheckbox {}
struct uiEntry {}
struct uiLabel {}
struct uiTab {}
struct uiGroup {}
struct uiSpinbox {}
struct uiSlider {}
struct uiProgressBar {}
struct uiSeparator {}
struct uiCombobox {}
struct uiEditableCombobox {}
struct uiRadioButtons {}
struct uiDateTimePicker {}
struct uiMultilineEntry {}

struct uiArea {}
struct uiAreaHandler {}
struct uiAreaDrawParams {}
struct uiAreaMouseEvent {}
struct uiAreaKeyEvent {}

struct uiDrawContext {}
struct uiDrawPath {}
struct uiDrawBrush {}
struct uiDrawStrokeParams {}
struct uiDrawMatrix {}
struct uiDrawBrushGradientStop {}
struct uiDrawFontFamilies {}
struct uiDrawTextLayout {}
struct uiDrawTextFont {}
struct uiDrawTextFontDescriptor {}
struct uiDrawTextFontMetrics {}
struct uiFontButton {}

alias uiDrawBrushType = int;
enum {
    uiDrawBrushTypeSolid,
    uiDrawBrushTypeLinearGradient,
    uiDrawBrushTypeRadialGradient,
    uiDrawBrushTypeImage,
}

alias uiDrawLineCap = int;
enum {
    uiDrawLineCapFlat,
    uiDrawLineCapRound,
    uiDrawLineCapSquare,
}

alias uiDrawLineJoin = int;
enum {
    uiDrawLineJoinMiter,
    uiDrawLineJoinRound,
    uiDrawLineJoinBevel,
}

alias uiDrawFillMode = int;
enum {
    uiDrawFillModeWinding,
    uiDrawFillModeAlternate,
}

alias uiDrawTextWeight = int;
enum {
    uiDrawTextWeightThin,
    uiDrawTextWeightUltraLight,
    uiDrawTextWeightLight,
    uiDrawTextWeightBook,
    uiDrawTextWeightNormal,
    uiDrawTextWeightMedium,
    uiDrawTextWeightSemiBold,
    uiDrawTextWeightBold,
    uiDrawTextWeightUtraBold,
    uiDrawTextWeightHeavy,
    uiDrawTextWeightUltraHeavy,
}

alias uiDrawTextItalic = int;
enum {
    uiDrawTextItalicNormal,
    uiDrawTextItalicOblique,
    uiDrawTextItalicItalic,
}

alias uiDrawTextStretch = int;
enum {
    uiDrawTextStretchUltraCondensed,
    uiDrawTextStretchExtraCondensed,
    uiDrawTextStretchCondensed,
    uiDrawTextStretchSemiCondensed,
    uiDrawTextStretchNormal,
    uiDrawTextStretchSemiExpanded,
    uiDrawTextStretchExpanded,
    uiDrawTextStretchExtraExpanded,
    uiDrawTextStretchUltraExpanded,
}

alias uiModifiers = int;
enum {
    uiModifierCtrl = 1 << 0,
    uiModifierAlt = 1 << 1,
    uiModifierShift = 1 << 2,
    uiModifierSuper = 1 << 3,
}

alias uiExtKey = int;
enum {
    uiExtKeyEscape = 1,
    uiExtKeyInsert,         // equivalent to "Help" on Apple keyboards
    uiExtKeyDelete,
    uiExtKeyHome,
    uiExtKeyEnd,
    uiExtKeyPageUp,
    uiExtKeyPageDown,
    uiExtKeyUp,
    uiExtKeyDown,
    uiExtKeyLeft,
    uiExtKeyRight,
    uiExtKeyF1,         // F1..F12 are guaranteed to be consecutive
    uiExtKeyF2,
    uiExtKeyF3,
    uiExtKeyF4,
    uiExtKeyF5,
    uiExtKeyF6,
    uiExtKeyF7,
    uiExtKeyF8,
    uiExtKeyF9,
    uiExtKeyF10,
    uiExtKeyF11,
    uiExtKeyF12,
    uiExtKeyN0,         // numpad keys; independent of Num Lock state
    uiExtKeyN1,         // N0..N9 are guaranteed to be consecutive
    uiExtKeyN2,
    uiExtKeyN3,
    uiExtKeyN4,
    uiExtKeyN5,
    uiExtKeyN6,
    uiExtKeyN7,
    uiExtKeyN8,
    uiExtKeyN9,
    uiExtKeyNDot,
    uiExtKeyNEnter,
    uiExtKeyNAdd,
    uiExtKeyNSubtract,
    uiExtKeyNMultiply,
    uiExtKeyNDivide,
}

static immutable uiDrawDefaultMiterLimit = 10.0;
