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
module derelict.libui.libui;

public
{
    import derelict.libui.types;
    import derelict.libui.funcs;
}

private
{
    import derelict.util.loader;
    import derelict.util.system;

    static if(Derelict_OS_Windows)
        enum libNames = "libui.dll";    
    else static if (Derelict_OS_Mac)
        enum libNames = "libui.dylib, libui.A.dylib";
    else static if (Derelict_OS_Linux)
        enum libNames = "libui.so.0, libui.so";
    else
        static assert(0, "Need to implement libui libNames for this operating system.");
}

class DerelictLibuiLoader : SharedLibLoader
{

    protected
    {
        override void loadSymbols()
        {          
            bindFunc(cast(void**)&uiInit, "uiInit");
            bindFunc(cast(void**)&uiUninit, "uiUninit");

            bindFunc(cast(void**)&uiFreeInitError, "uiFreeInitError");
            bindFunc(cast(void**)&uiMain, "uiMain");
            bindFunc(cast(void**)&uiMainStep, "uiMainStep");
            bindFunc(cast(void**)&uiQuit, "uiQuit");

            bindFunc(cast(void**)&uiQueueMain, "uiQueueMain");
            bindFunc(cast(void**)&uiOnShouldQuit, "uiOnShouldQuit");
            bindFunc(cast(void**)&uiFreeText, "uiFreeText");

            bindFunc(cast(void**)&uiControlDestroy, "uiControlDestroy");
            bindFunc(cast(void**)&uiControlHandle, "uiControlHandle");
            bindFunc(cast(void**)&uiControlParent, "uiControlParent");
            bindFunc(cast(void**)&uiControlSetParent, "uiControlSetParent");
            bindFunc(cast(void**)&uiControlToplevel, "uiControlToplevel");
            bindFunc(cast(void**)&uiControlVisible, "uiControlVisible");
            bindFunc(cast(void**)&uiControlShow, "uiControlShow");
            bindFunc(cast(void**)&uiControlHide, "uiControlHide");
            bindFunc(cast(void**)&uiControlEnabled, "uiControlEnabled");
            bindFunc(cast(void**)&uiControlEnable, "uiControlEnable");
            bindFunc(cast(void**)&uiControlDisable, "uiControlDisable");

            bindFunc(cast(void**)&uiAllocControl, "uiAllocControl");
            bindFunc(cast(void**)&uiFreeControl, "uiFreeControl");

            bindFunc(cast(void**)&uiControlVerifySetParent, "uiControlVerifySetParent");
            bindFunc(cast(void**)&uiControlEnabledToUser, "uiControlEnabledToUser");

            bindFunc(cast(void**)&uiUserBugCannotSetParentOnToplevel, "uiUserBugCannotSetParentOnToplevel");

            bindFunc(cast(void**)&uiWindowTitle, "uiWindowTitle");
            bindFunc(cast(void**)&uiWindowSetTitle, "uiWindowSetTitle");
            bindFunc(cast(void**)&uiWindowOnClosing, "uiWindowOnClosing");
            bindFunc(cast(void**)&uiWindowSetChild, "uiWindowSetChild");
            bindFunc(cast(void**)&uiWindowMargined, "uiWindowMargined");
            bindFunc(cast(void**)&uiWindowSetMargined, "uiWindowSetMargined");
            bindFunc(cast(void**)&uiNewWindow, "uiNewWindow");

            bindFunc(cast(void**)&uiButtonText, "uiButtonText");
            bindFunc(cast(void**)&uiButtonSetText, "uiButtonSetText");
            bindFunc(cast(void**)&uiButtonOnClicked, "uiButtonOnClicked");
            bindFunc(cast(void**)&uiNewButton, "uiNewButton");
            
            bindFunc(cast(void**)&uiBoxAppend, "uiBoxAppend");
            bindFunc(cast(void**)&uiBoxDelete, "uiBoxDelete");
            bindFunc(cast(void**)&uiBoxPadded, "uiBoxPadded");
            bindFunc(cast(void**)&uiBoxSetPadded, "uiBoxSetPadded");
            bindFunc(cast(void**)&uiNewHorizontalBox, "uiNewHorizontalBox");
            bindFunc(cast(void**)&uiNewVerticalBox, "uiNewVerticalBox");
            
            bindFunc(cast(void**)&uiEntryText, "uiEntryText");
            bindFunc(cast(void**)&uiEntrySetText, "uiEntrySetText");
            bindFunc(cast(void**)&uiEntryOnChanged, "uiEntryOnChanged");
            bindFunc(cast(void**)&uiEntryReadOnly, "uiEntryReadOnly");
            bindFunc(cast(void**)&uiEntrySetReadOnly, "uiEntrySetReadOnly");
            bindFunc(cast(void**)&uiNewEntry, "uiNewEntry");
            
            bindFunc(cast(void**)&uiCheckboxText, "uiCheckboxText");
            bindFunc(cast(void**)&uiCheckboxSetText, "uiCheckboxSetText");
            bindFunc(cast(void**)&uiCheckboxOnToggled, "uiCheckboxOnToggled");
            bindFunc(cast(void**)&uiCheckboxChecked, "uiCheckboxChecked");
            bindFunc(cast(void**)&uiCheckboxSetChecked, "uiCheckboxSetChecked");
            bindFunc(cast(void**)&uiNewCheckbox, "uiNewCheckbox");
            
            bindFunc(cast(void**)&uiLabelText, "uiLabelText");
            bindFunc(cast(void**)&uiLabelSetText, "uiLabelSetText");
            bindFunc(cast(void**)&uiNewLabel, "uiNewLabel");
            
            bindFunc(cast(void**)&uiTabAppend, "uiTabAppend");
            bindFunc(cast(void**)&uiTabInsertAt, "uiTabInsertAt");
            bindFunc(cast(void**)&uiTabDelete, "uiTabDelete");
            bindFunc(cast(void**)&uiTabNumPages, "uiTabNumPages");
            bindFunc(cast(void**)&uiTabMargined, "uiTabMargined");
            bindFunc(cast(void**)&uiTabSetMargined, "uiTabSetMargined");
            bindFunc(cast(void**)&uiNewTab, "uiNewTab");
            
            bindFunc(cast(void**)&uiGroupTitle, "uiGroupTitle");
            bindFunc(cast(void**)&uiGroupSetTitle, "uiGroupSetTitle");
            bindFunc(cast(void**)&uiGroupSetChild, "uiGroupSetChild");
            bindFunc(cast(void**)&uiGroupMargined, "uiGroupMargined");
            bindFunc(cast(void**)&uiGroupSetMargined, "uiGroupSetMargined");
            bindFunc(cast(void**)&uiNewGroup, "uiNewGroup");
            
            bindFunc(cast(void**)&uiSpinboxValue, "uiSpinboxValue");
            bindFunc(cast(void**)&uiSpinboxSetValue, "uiSpinboxSetValue");
            bindFunc(cast(void**)&uiSpinboxOnChanged, "uiSpinboxOnChanged");
            bindFunc(cast(void**)&uiNewSpinbox, "uiNewSpinbox");
            
            bindFunc(cast(void**)&uiProgressBarSetValue, "uiProgressBarSetValue");
            bindFunc(cast(void**)&uiNewProgressBar, "uiNewProgressBar");
            
            bindFunc(cast(void**)&uiSliderValue, "uiSliderValue");
            bindFunc(cast(void**)&uiSliderSetValue, "uiSliderSetValue");
            bindFunc(cast(void**)&uiSliderOnChanged, "uiSliderOnChanged");
            bindFunc(cast(void**)&uiNewSlider, "uiNewSlider");
            
            bindFunc(cast(void**)&uiNewHorizontalSeparator, "uiNewHorizontalSeparator");
            
            bindFunc(cast(void**)&uiComboboxAppend, "uiComboboxAppend");
            bindFunc(cast(void**)&uiComboboxSelected, "uiComboboxSelected");
            bindFunc(cast(void**)&uiComboboxSetSelected, "uiComboboxSetSelected");
            bindFunc(cast(void**)&uiComboboxOnSelected, "uiComboboxOnSelected");
            bindFunc(cast(void**)&uiNewCombobox, "uiNewCombobox");
            bindFunc(cast(void**)&uiNewEditableCombobox, "uiNewEditableCombobox");
            
            bindFunc(cast(void**)&uiRadioButtonsAppend, "uiRadioButtonsAppend");
            bindFunc(cast(void**)&uiNewRadioButtons, "uiNewRadioButtons");
            
            bindFunc(cast(void**)&uiNewDateTimePicker, "uiNewDateTimePicker");
            bindFunc(cast(void**)&uiNewDatePicker, "uiNewDatePicker");
            bindFunc(cast(void**)&uiNewTimePicker, "uiNewTimePicker");
            
            bindFunc(cast(void**)&uiMultilineEntryText, "uiMultilineEntryText");
            bindFunc(cast(void**)&uiMultilineEntrySetText, "uiMultilineEntrySetText");
            bindFunc(cast(void**)&uiMultilineEntryAppend, "uiMultilineEntryAppend");
            bindFunc(cast(void**)&uiMultilineEntryOnChanged, "uiMultilineEntryOnChanged");
            bindFunc(cast(void**)&uiMultilineEntryReadOnly, "uiMultilineEntryReadOnly");
            bindFunc(cast(void**)&uiMultilineEntrySetReadOnly, "uiMultilineEntrySetReadOnly");
            bindFunc(cast(void**)&uiNewMultilineEntry, "uiNewMultilineEntry");
            bindFunc(cast(void**)&uiNewNonWrappingMultilineEntry, "uiNewNonWrappingMultilineEntry");

            bindFunc(cast(void**)&uiMenuItemEnable, "uiMenuItemEnable");
            bindFunc(cast(void**)&uiMenuItemDisable, "uiMenuItemDisable");
            bindFunc(cast(void**)&uiMenuItemOnClicked, "uiMenuItemOnClicked");
            bindFunc(cast(void**)&uiMenuItemChecked, "uiMenuItemChecked");
            bindFunc(cast(void**)&uiMenuItemSetChecked, "uiMenuItemSetChecked");
            
            bindFunc(cast(void**)&uiMenuAppendItem, "uiMenuAppendItem");
            bindFunc(cast(void**)&uiMenuAppendCheckItem, "uiMenuAppendCheckItem");
            bindFunc(cast(void**)&uiMenuAppendQuitItem, "uiMenuAppendQuitItem");
            bindFunc(cast(void**)&uiMenuAppendPreferencesItem, "uiMenuAppendPreferencesItem");
            bindFunc(cast(void**)&uiMenuAppendAboutItem, "uiMenuAppendAboutItem");
            bindFunc(cast(void**)&uiMenuAppendSeparator, "uiMenuAppendSeparator");
            bindFunc(cast(void**)&uiNewMenu, "uiNewMenu");

            bindFunc(cast(void**)&uiOpenFile, "uiOpenFile");
            bindFunc(cast(void**)&uiSaveFile, "uiSaveFile");
            bindFunc(cast(void**)&uiMsgBox, "uiMsgBox");
            bindFunc(cast(void**)&uiMsgBoxError, "uiMsgBoxError");
            
            bindFunc(cast(void**)&uiAreaSetSize, "uiAreaSetSize");
            bindFunc(cast(void**)&uiAreaQueueRedrawAll, "uiAreaQueueRedrawAll");
            bindFunc(cast(void**)&uiAreaScrollTo, "uiAreaScrollTo");
            bindFunc(cast(void**)&uiNewArea, "uiNewArea");
            bindFunc(cast(void**)&uiNewScrollingArea, "uiNewScrollingArea");
            
            bindFunc(cast(void**)&uiDrawNewPath, "uiDrawNewPath");
            bindFunc(cast(void**)&uiDrawFreePath, "uiDrawFreePath");
            
            bindFunc(cast(void**)&uiDrawPathNewFigure, "uiDrawPathNewFigure");
            bindFunc(cast(void**)&uiDrawPathNewFigureWithArc, "uiDrawPathNewFigureWithArc");
            bindFunc(cast(void**)&uiDrawPathLineTo, "uiDrawPathLineTo");
            bindFunc(cast(void**)&uiDrawPathArcTo, "uiDrawPathArcTo");
            bindFunc(cast(void**)&uiDrawPathBezierTo, "uiDrawPathBezierTo");
            bindFunc(cast(void**)&uiDrawPathCloseFigure, "uiDrawPathCloseFigure");
            bindFunc(cast(void**)&uiDrawPathAddRectangle, "uiDrawPathAddRectangle");
            bindFunc(cast(void**)&uiDrawPathEnd, "uiDrawPathEnd");
            
            bindFunc(cast(void**)&uiDrawStroke, "uiDrawStroke");
            bindFunc(cast(void**)&uiDrawFill, "uiDrawFill");
            
            bindFunc(cast(void**)&uiDrawMatrixSetIdentity, "uiDrawMatrixSetIdentity");
            bindFunc(cast(void**)&uiDrawMatrixTranslate, "uiDrawMatrixTranslate");
            bindFunc(cast(void**)&uiDrawMatrixScale, "uiDrawMatrixScale");
            bindFunc(cast(void**)&uiDrawMatrixRotate, "uiDrawMatrixRotate");
            bindFunc(cast(void**)&uiDrawMatrixSkew, "uiDrawMatrixSkew");
            bindFunc(cast(void**)&uiDrawMatrixMultiply, "uiDrawMatrixMultiply");
            bindFunc(cast(void**)&uiDrawMatrixInvertible, "uiDrawMatrixInvertible");
            bindFunc(cast(void**)&uiDrawMatrixInvert, "uiDrawMatrixInvert");
            bindFunc(cast(void**)&uiDrawMatrixTransformPoint, "uiDrawMatrixTransformPoint");
            bindFunc(cast(void**)&uiDrawMatrixTransformSize, "uiDrawMatrixTransformSize");
            
            bindFunc(cast(void**)&uiDrawTransform, "uiDrawTransform");
            
            bindFunc(cast(void**)&uiDrawClip, "uiDrawClip");
            
            bindFunc(cast(void**)&uiDrawSave, "uiDrawSave");
            bindFunc(cast(void**)&uiDrawRestore, "uiDrawRestore");
            
            bindFunc(cast(void**)&uiDrawListFontFamilies, "uiDrawListFontFamilies");
            bindFunc(cast(void**)&uiDrawFontFamiliesNumFamilies, "uiDrawFontFamiliesNumFamilies");
            bindFunc(cast(void**)&uiDrawFontFamiliesFamily, "uiDrawFontFamiliesFamily");
            bindFunc(cast(void**)&uiDrawFreeFontFamilies, "uiDrawFreeFontFamilies");
            
            bindFunc(cast(void**)&uiDrawLoadClosestFont, "uiDrawLoadClosestFont");
            bindFunc(cast(void**)&uiDrawFreeTextFont, "uiDrawFreeTextFont");
            bindFunc(cast(void**)&uiDrawTextFontHandle, "uiDrawTextFontHandle");
            bindFunc(cast(void**)&uiDrawTextFontDescribe, "uiDrawTextFontDescribe");
            bindFunc(cast(void**)&uiDrawTextFontGetMetrics, "uiDrawTextFontGetMetrics");
            
            bindFunc(cast(void**)&uiDrawNewTextLayout, "uiDrawNewTextLayout");
            bindFunc(cast(void**)&uiDrawFreeTextLayout, "uiDrawFreeTextLayout");
            
            bindFunc(cast(void**)&uiDrawTextLayoutSetWidth, "uiDrawTextLayoutSetWidth");
            bindFunc(cast(void**)&uiDrawTextLayoutExtents, "uiDrawTextLayoutExtents");
            bindFunc(cast(void**)&uiDrawTextLayoutSetColor, "uiDrawTextLayoutSetColor");
            bindFunc(cast(void**)&uiDrawText, "uiDrawText");
            
            bindFunc(cast(void**)&uiFontButtonFont, "uiFontButtonFont");
            bindFunc(cast(void**)&uiFontButtonOnChanged, "uiFontButtonOnChanged");
            bindFunc(cast(void**)&uiNewFontButton, "uiNewFontButton");

            bindFunc(cast(void**)&uiColorButtonColor, "uiColorButtonColor");
            bindFunc(cast(void**)&uiColorButtonSetColor, "uiColorButtonSetColor");
            bindFunc(cast(void**)&uiColorButtonOnChanged, "uiColorButtonOnChanged");
            bindFunc(cast(void**)&uiNewColorButton, "uiNewColorButton");
        }
    }

    public
    {
        this()
        {
            super(libNames);
        }
    }
}

__gshared DerelictLibuiLoader DerelictLibui;

shared static this()
{
    DerelictLibui = new DerelictLibuiLoader();
}
