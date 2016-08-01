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
module derelict.libui.funcs;

private
{
    import derelict.util.system;
    import derelict.libui.types;
}

extern(C) nothrow
{
    alias da_uiInit = cstring function(uiInitOptions *options);
    alias da_uiUninit = void function();

    alias da_uiFreeInitError = void function(cstring err);

    alias da_uiMain = void function();
    alias da_uiMainStep = void function(int wait);
    alias da_uiQuit = void function();

    alias da_uiQueueMain = void function(void function(void *data) f, void *data);
    alias da_uiOnShouldQuit = void function(int function(void *data) f, void *data);
    alias da_uiFreeText = void function(cstring text);

    alias da_uiControlDestroy = void function(uiControl *);
    alias da_uiControlHandle = uintptr_t function(uiControl *);
    alias da_uiControlParent = uiControl* function(uiControl *);
    alias da_uiControlSetParent = void function(uiControl *, uiControl *);
    alias da_uiControlToplevel = int function(uiControl *);
    alias da_uiControlVisible = int function(uiControl *);
    alias da_uiControlShow = void function(uiControl *);
    alias da_uiControlHide = void function(uiControl *);
    alias da_uiControlEnabled = int function(uiControl *);
    alias da_uiControlEnable = void function(uiControl *);
    alias da_uiControlDisable = void function(uiControl *);

    alias da_uiAllocControl = uiControl* function(size_t n, uint32_t OSsig, uint32_t typesig, cstring typenamestr);
    alias da_uiFreeControl = void function(uiControl *);

    alias da_uiControlVerifySetParent = void function(uiControl *, uiControl *);
    alias da_uiControlEnabledToUser = int function(uiControl *);

    alias da_uiUserBugCannotSetParentOnToplevel = void function(cstring type);

    alias onWindowClosingFunction = int function(uiWindow* w, void* data);

    alias da_uiWindowTitle = cstring function(uiWindow *w);
    alias da_uiWindowSetTitle = void function(uiWindow *w, cstring title);
    alias da_uiWindowOnClosing = void function(uiWindow *w, onWindowClosingFunction f, void* data);
    alias da_uiWindowSetChild = void function(uiWindow *w, uiControl *child);
    alias da_uiWindowMargined = int function(uiWindow *w);
    alias da_uiWindowSetMargined = void function(uiWindow *w, int margined);
    alias da_uiNewWindow = uiWindow* function(cstring title, int width, int height, int hasMenubar);

    alias da_uiButtonText = cstring function(uiButton *b);
    alias da_uiButtonSetText = void function(uiButton *b, cstring text);
    alias da_uiButtonOnClicked = void function(uiButton *b, void function(uiButton *b, void *data) f, void *data);
    alias da_uiNewButton = uiButton* function(cstring text);
    
    alias da_uiBoxAppend = void function(uiBox *b, uiControl *child, int stretchy);
    alias da_uiBoxDelete = void function(uiBox *b, uintmax_t index);
    alias da_uiBoxPadded = int function(uiBox *b);
    alias da_uiBoxSetPadded = void function(uiBox *b, int padded);
    alias da_uiNewHorizontalBox = uiBox* function();
    alias da_uiNewVerticalBox = uiBox* function();
    
    alias da_uiEntryText = cstring function(uiEntry *e);
    alias da_uiEntrySetText = void function(uiEntry *e, cstring text);
    alias da_uiEntryOnChanged = void function(uiEntry *e, void function(uiEntry *e, void *data) f, void *data);
    alias da_uiEntryReadOnly = int function(uiEntry *e);
    alias da_uiEntrySetReadOnly = void function(uiEntry *e, int readonly);
    alias da_uiNewEntry = uiEntry* function();
    
    alias da_uiCheckboxText = cstring function(uiCheckbox *c);
    alias da_uiCheckboxSetText = void function(uiCheckbox *c, cstring text);
    alias da_uiCheckboxOnToggled = void function(uiCheckbox *c, void function(uiCheckbox *c, void *data) f, void *data);
    alias da_uiCheckboxChecked = int function(uiCheckbox *c);
    alias da_uiCheckboxSetChecked = void function(uiCheckbox *c, int checked);
    alias da_uiNewCheckbox = uiCheckbox* function(cstring text);
    
    alias da_uiLabelText = cstring function(uiLabel *l);
    alias da_uiLabelSetText = void function(uiLabel *l, cstring text);
    alias da_uiNewLabel = uiLabel* function(cstring text);
    
    alias da_uiTabAppend = void function(uiTab *t, cstring name, uiControl *c);
    alias da_uiTabInsertAt = void function(uiTab *t, cstring name, uintmax_t before, uiControl *c);
    alias da_uiTabDelete = void function(uiTab *t, uintmax_t index);
    alias da_uiTabNumPages = uintmax_t function(uiTab *t);
    alias da_uiTabMargined = int function(uiTab *t, uintmax_t page);
    alias da_uiTabSetMargined = void function(uiTab *t, uintmax_t page, int margined);
    alias da_uiNewTab = uiTab* function();
    
    alias da_uiGroupTitle = cstring function(uiGroup *g);
    alias da_uiGroupSetTitle = void function(uiGroup *g, cstring title);
    alias da_uiGroupSetChild = void function(uiGroup *g, uiControl *c);
    alias da_uiGroupMargined = int function(uiGroup *g);
    alias da_uiGroupSetMargined = void function(uiGroup *g, int margined);
    alias da_uiNewGroup = uiGroup* function(cstring title);
    
    alias da_uiSpinboxValue = intmax_t function(uiSpinbox *s);
    alias da_uiSpinboxSetValue = void function(uiSpinbox *s, intmax_t value);
    alias da_uiSpinboxOnChanged = void function(uiSpinbox *s, void function(uiSpinbox *s, void *data) f, void *data);
    alias da_uiNewSpinbox = uiSpinbox* function(intmax_t min, intmax_t max);
    
    alias da_uiProgressBarSetValue = void function(uiProgressBar *p, int n);
    alias da_uiNewProgressBar = uiProgressBar* function();
    
    alias da_uiSliderValue = intmax_t function(uiSlider *s);
    alias da_uiSliderSetValue = void function(uiSlider *s, intmax_t value);
    alias da_uiSliderOnChanged = void function(uiSlider *s, void function(uiSlider *s, void *data) f, void *data);
    alias da_uiNewSlider = uiSlider* function(intmax_t min, intmax_t max);
    
    alias da_uiNewHorizontalSeparator = uiSeparator* function();
    
    alias da_uiComboboxAppend = void function(uiCombobox *c, cstring text);
    alias da_uiComboboxSelected = intmax_t function(uiCombobox *c);
    alias da_uiComboboxSetSelected = void function(uiCombobox *c, intmax_t n);
    alias da_uiComboboxOnSelected = void function(uiCombobox *c, void function(uiCombobox *c, void *data) f, void *data);
    alias da_uiNewCombobox = uiCombobox* function();

    alias da_uiEditableComboboxAppend = void function(uiEditableCombobox* c, cstring text);
    alias da_uiEditableComboboxText = cstring function(uiEditableCombobox* c);
    alias da_uiEditableComboboxSetText = void function(uiEditableCombobox* c, cstring text);
    alias da_uiEditableComboboxOnChanged = void function(uiEditableCombobox* c, void function(uiEditableCombobox* c, void* data), void* data);
    alias da_uiNewEditableCombobox = uiEditableCombobox* function();
    
    alias da_uiRadioButtonsAppend = void function(uiRadioButtons *r, cstring text);
    alias da_uiNewRadioButtons = uiRadioButtons* function();
    
    alias da_uiNewDateTimePicker = uiDateTimePicker* function();
    alias da_uiNewDatePicker = uiDateTimePicker* function();
    alias da_uiNewTimePicker = uiDateTimePicker* function();
    
    alias da_uiMultilineEntryText = cstring function(uiMultilineEntry *e);
    alias da_uiMultilineEntrySetText = void function(uiMultilineEntry *e, cstring text);
    alias da_uiMultilineEntryAppend = void function(uiMultilineEntry *e, cstring text);
    alias da_uiMultilineEntryOnChanged = void function(uiMultilineEntry *e, void function(uiMultilineEntry *e, void *data) f, void *data);
    alias da_uiMultilineEntryReadOnly = int function(uiMultilineEntry *e);
    alias da_uiMultilineEntrySetReadOnly = void function(uiMultilineEntry *e, int readonly);
    alias da_uiNewMultilineEntry = uiMultilineEntry* function();
    alias da_uiNewNonWrappingMultilineEntry = uiMultilineEntry* function();

    alias da_uiMenuItemEnable = void function(uiMenuItem *m);
    alias da_uiMenuItemDisable = void function(uiMenuItem *m);
    alias da_uiMenuItemOnClicked = void function(uiMenuItem *m, void function(uiMenuItem *sender, uiWindow *window, void *data) f, void *data);
    alias da_uiMenuItemChecked = int function(uiMenuItem *m);
    alias da_uiMenuItemSetChecked = void function(uiMenuItem *m, int checked);
    
    alias da_uiMenuAppendItem = uiMenuItem* function(uiMenu *m, cstring name);
    alias da_uiMenuAppendCheckItem = uiMenuItem* function(uiMenu *m, cstring name);
    alias da_uiMenuAppendQuitItem = uiMenuItem* function(uiMenu *m);
    alias da_uiMenuAppendPreferencesItem = uiMenuItem* function(uiMenu *m);
    alias da_uiMenuAppendAboutItem = uiMenuItem* function(uiMenu *m);
    alias da_uiMenuAppendSeparator = void function(uiMenu *m);
    alias da_uiNewMenu = uiMenu* function(cstring name);

    alias da_uiOpenFile = cstring function(uiWindow *parent);
    alias da_uiSaveFile = cstring function(uiWindow *parent);
    alias da_uiMsgBox = void function(uiWindow *parent, cstring title, cstring description);
    alias da_uiMsgBoxError = void function(uiWindow *parent, cstring title, cstring description);
    
    alias da_uiAreaSetSize = void function(uiArea *a, intmax_t width, intmax_t height);
    alias da_uiAreaQueueRedrawAll = void function(uiArea *a);
    alias da_uiAreaScrollTo = void function(uiArea *a, double x, double y, double width, double height);
    alias da_uiNewArea = uiArea* function(uiAreaHandler *ah);
    alias da_uiNewScrollingArea = uiArea* function(uiAreaHandler *ah, intmax_t width, intmax_t height);
    
    alias da_uiDrawNewPath = uiDrawPath* function(uiDrawFillMode fillMode);
    alias da_uiDrawFreePath = void function(uiDrawPath *p);
    
    alias da_uiDrawPathNewFigure = void function(uiDrawPath *p, double x, double y);
    alias da_uiDrawPathNewFigureWithArc = void function(uiDrawPath *p, double xCenter, double yCenter, double radius, double startAngle, double sweep, int negative);
    alias da_uiDrawPathLineTo = void function(uiDrawPath *p, double x, double y);
    alias da_uiDrawPathArcTo = void function(uiDrawPath *p, double xCenter, double yCenter, double radius, double startAngle, double sweep, int negative);
    alias da_uiDrawPathBezierTo = void function(uiDrawPath *p, double c1x, double c1y, double c2x, double c2y, double endX, double endY);
    alias da_uiDrawPathCloseFigure = void function(uiDrawPath *p);
    alias da_uiDrawPathAddRectangle = void function(uiDrawPath *p, double x, double y, double width, double height);
    alias da_uiDrawPathEnd = void function(uiDrawPath *p);
    
    alias da_uiDrawStroke = void function(uiDrawContext *c, uiDrawPath *path, uiDrawBrush *b, uiDrawStrokeParams *p);
    alias da_uiDrawFill = void function(uiDrawContext *c, uiDrawPath *path, uiDrawBrush *b);
    
    alias da_uiDrawMatrixSetIdentity = void function(uiDrawMatrix *m);
    alias da_uiDrawMatrixTranslate = void function(uiDrawMatrix *m, double x, double y);
    alias da_uiDrawMatrixScale = void function(uiDrawMatrix *m, double xCenter, double yCenter, double x, double y);
    alias da_uiDrawMatrixRotate = void function(uiDrawMatrix *m, double x, double y, double amount);
    alias da_uiDrawMatrixSkew = void function(uiDrawMatrix *m, double x, double y, double xamount, double yamount);
    alias da_uiDrawMatrixMultiply = void function(uiDrawMatrix *dest, uiDrawMatrix *src);
    alias da_uiDrawMatrixInvertible = int function(uiDrawMatrix *m);
    alias da_uiDrawMatrixInvert = int function(uiDrawMatrix *m);
    alias da_uiDrawMatrixTransformPoint = void function(uiDrawMatrix *m, double *x, double *y);
    alias da_uiDrawMatrixTransformSize = void function(uiDrawMatrix *m, double *x, double *y);
    
    alias da_uiDrawTransform = void function(uiDrawContext *c, uiDrawMatrix *m);
    
    alias da_uiDrawClip = void function(uiDrawContext *c, uiDrawPath *path);
    
    alias da_uiDrawSave = void function(uiDrawContext *c);
    alias da_uiDrawRestore = void function(uiDrawContext *c);
    
    alias da_uiDrawListFontFamilies = uiDrawFontFamilies* function();
    alias da_uiDrawFontFamiliesNumFamilies = uintmax_t function(uiDrawFontFamilies *ff);
    alias da_uiDrawFontFamiliesFamily = cstring function(uiDrawFontFamilies *ff, uintmax_t n);
    alias da_uiDrawFreeFontFamilies = void function(uiDrawFontFamilies *ff);
    
    alias da_uiDrawLoadClosestFont = uiDrawTextFont* function(const uiDrawTextFontDescriptor *desc);
    alias da_uiDrawFreeTextFont = void function(uiDrawTextFont *font);
    alias da_uiDrawTextFontHandle = uintptr_t function(uiDrawTextFont *font);
    alias da_uiDrawTextFontDescribe = void function(uiDrawTextFont *font, uiDrawTextFontDescriptor *desc);
    alias da_uiDrawTextFontGetMetrics = void function(uiDrawTextFont *font, uiDrawTextFontMetrics *metrics);
    
    alias da_uiDrawNewTextLayout = uiDrawTextLayout* function(cstring text, uiDrawTextFont *defaultFont, double width);
    alias da_uiDrawFreeTextLayout = void function(uiDrawTextLayout *layout);
    
    alias da_uiDrawTextLayoutSetWidth = void function(uiDrawTextLayout *layout, double width);
    alias da_uiDrawTextLayoutExtents = void function(uiDrawTextLayout *layout, double *width, double *height);
    alias da_uiDrawTextLayoutSetColor = void function(uiDrawTextLayout *layout, intmax_t startChar, intmax_t endChar, double r, double g, double b, double a);
    alias da_uiDrawText = void function(uiDrawContext *c, double x, double y, uiDrawTextLayout *layout);
    
    alias da_uiFontButtonFont = uiDrawTextFont* function(uiFontButton *b);
    alias da_uiFontButtonOnChanged = void function(uiFontButton *b, void function(uiFontButton *, void *) f, void *data);
    alias da_uiNewFontButton = uiFontButton* function();

    alias da_uiColorButtonColor = void function(uiColorButton *b, double *r, double *g, double *bl, double *a);
    alias da_uiColorButtonSetColor = void function(uiColorButton *b, double r, double g, double bl, double a);
    alias da_uiColorButtonOnChanged = void function(uiColorButton *b, void function(uiColorButton *, void *) f, void *data);
    alias da_uiNewColorButton = uiColorButton* function();
}

__gshared
{
    da_uiInit uiInit;
    da_uiUninit uiUninit;

    da_uiFreeInitError uiFreeInitError;
    da_uiMain uiMain;
    da_uiMainStep uiMainStep;
    da_uiQuit uiQuit;

    da_uiQueueMain uiQueueMain;
    da_uiOnShouldQuit uiOnShouldQuit;
    da_uiFreeText uiFreeText;

    da_uiControlDestroy uiControlDestroy;
    da_uiControlHandle uiControlHandle;
    da_uiControlParent uiControlParent;
    da_uiControlSetParent uiControlSetParent;
    da_uiControlToplevel uiControlToplevel;
    da_uiControlVisible uiControlVisible;
    da_uiControlShow uiControlShow;
    da_uiControlHide uiControlHide;
    da_uiControlEnabled uiControlEnabled;
    da_uiControlEnable uiControlEnable;
    da_uiControlDisable uiControlDisable;

    da_uiAllocControl uiAllocControl;
    da_uiFreeControl uiFreeControl;

    da_uiControlVerifySetParent uiControlVerifySetParent;
    da_uiControlEnabledToUser uiControlEnabledToUser;

    da_uiUserBugCannotSetParentOnToplevel uiUserBugCannotSetParentOnToplevel;

    da_uiWindowTitle uiWindowTitle;
    da_uiWindowSetTitle uiWindowSetTitle;
    da_uiWindowOnClosing uiWindowOnClosing;
    da_uiWindowSetChild uiWindowSetChild;
    da_uiWindowMargined uiWindowMargined;
    da_uiWindowSetMargined uiWindowSetMargined;
    da_uiNewWindow uiNewWindow;

    da_uiButtonText uiButtonText;
    da_uiButtonSetText uiButtonSetText;
    da_uiButtonOnClicked uiButtonOnClicked;
    da_uiNewButton uiNewButton;
    
    da_uiBoxAppend uiBoxAppend;
    da_uiBoxDelete uiBoxDelete;
    da_uiBoxPadded uiBoxPadded;
    da_uiBoxSetPadded uiBoxSetPadded;
    da_uiNewHorizontalBox uiNewHorizontalBox;
    da_uiNewVerticalBox uiNewVerticalBox;
    
    da_uiEntryText uiEntryText;
    da_uiEntrySetText uiEntrySetText;
    da_uiEntryOnChanged uiEntryOnChanged;
    da_uiEntryReadOnly uiEntryReadOnly;
    da_uiEntrySetReadOnly uiEntrySetReadOnly;
    da_uiNewEntry uiNewEntry;
    
    da_uiCheckboxText uiCheckboxText;
    da_uiCheckboxSetText uiCheckboxSetText;
    da_uiCheckboxOnToggled uiCheckboxOnToggled;
    da_uiCheckboxChecked uiCheckboxChecked;
    da_uiCheckboxSetChecked uiCheckboxSetChecked;
    da_uiNewCheckbox uiNewCheckbox;
    
    da_uiLabelText uiLabelText;
    da_uiLabelSetText uiLabelSetText;
    da_uiNewLabel uiNewLabel;
    
    da_uiTabAppend uiTabAppend;
    da_uiTabInsertAt uiTabInsertAt;
    da_uiTabDelete uiTabDelete;
    da_uiTabNumPages uiTabNumPages;
    da_uiTabMargined uiTabMargined;
    da_uiTabSetMargined uiTabSetMargined;
    da_uiNewTab uiNewTab;
    
    da_uiGroupTitle uiGroupTitle;
    da_uiGroupSetTitle uiGroupSetTitle;
    da_uiGroupSetChild uiGroupSetChild;
    da_uiGroupMargined uiGroupMargined;
    da_uiGroupSetMargined uiGroupSetMargined;
    da_uiNewGroup uiNewGroup;
    
    da_uiSpinboxValue uiSpinboxValue;
    da_uiSpinboxSetValue uiSpinboxSetValue;
    da_uiSpinboxOnChanged uiSpinboxOnChanged;
    da_uiNewSpinbox uiNewSpinbox;
    
    da_uiProgressBarSetValue uiProgressBarSetValue;
    da_uiNewProgressBar uiNewProgressBar;
    
    da_uiSliderValue uiSliderValue;
    da_uiSliderSetValue uiSliderSetValue;
    da_uiSliderOnChanged uiSliderOnChanged;
    da_uiNewSlider uiNewSlider;
    
    da_uiNewHorizontalSeparator uiNewHorizontalSeparator;
    
    da_uiComboboxAppend uiComboboxAppend;
    da_uiComboboxSelected uiComboboxSelected;
    da_uiComboboxSetSelected uiComboboxSetSelected;
    da_uiComboboxOnSelected uiComboboxOnSelected;
    da_uiNewCombobox uiNewCombobox;

    da_uiEditableComboboxAppend uiEditableComboboxAppend;
    da_uiEditableComboboxText uiEditableComboboxText;
    da_uiEditableComboboxSetText uiEditableComboboxSetText;
    da_uiEditableComboboxOnChanged uiEditableComboboxOnChanged;
    da_uiNewEditableCombobox uiNewEditableCombobox;
    
    da_uiRadioButtonsAppend uiRadioButtonsAppend;
    da_uiNewRadioButtons uiNewRadioButtons;
    
    da_uiNewDateTimePicker uiNewDateTimePicker;
    da_uiNewDatePicker uiNewDatePicker;
    da_uiNewTimePicker uiNewTimePicker;
    
    da_uiMultilineEntryText uiMultilineEntryText;
    da_uiMultilineEntrySetText uiMultilineEntrySetText;
    da_uiMultilineEntryAppend uiMultilineEntryAppend;
    da_uiMultilineEntryOnChanged uiMultilineEntryOnChanged;
    da_uiMultilineEntryReadOnly uiMultilineEntryReadOnly;
    da_uiMultilineEntrySetReadOnly uiMultilineEntrySetReadOnly;
    da_uiNewMultilineEntry uiNewMultilineEntry;
    da_uiNewNonWrappingMultilineEntry uiNewNonWrappingMultilineEntry;

    da_uiMenuItemEnable uiMenuItemEnable;
    da_uiMenuItemDisable uiMenuItemDisable;
    da_uiMenuItemOnClicked uiMenuItemOnClicked;
    da_uiMenuItemChecked uiMenuItemChecked;
    da_uiMenuItemSetChecked uiMenuItemSetChecked;
    
    da_uiMenuAppendItem uiMenuAppendItem;
    da_uiMenuAppendCheckItem uiMenuAppendCheckItem;
    da_uiMenuAppendQuitItem uiMenuAppendQuitItem;
    da_uiMenuAppendPreferencesItem uiMenuAppendPreferencesItem;
    da_uiMenuAppendAboutItem uiMenuAppendAboutItem;
    da_uiMenuAppendSeparator uiMenuAppendSeparator;
    da_uiNewMenu uiNewMenu;

    da_uiOpenFile uiOpenFile;
    da_uiSaveFile uiSaveFile;
    da_uiMsgBox uiMsgBox;
    da_uiMsgBoxError uiMsgBoxError;
    
    da_uiAreaSetSize uiAreaSetSize;
    da_uiAreaQueueRedrawAll uiAreaQueueRedrawAll;
    da_uiAreaScrollTo uiAreaScrollTo;
    da_uiNewArea uiNewArea;
    da_uiNewScrollingArea uiNewScrollingArea;
    
    da_uiDrawNewPath uiDrawNewPath;
    da_uiDrawFreePath uiDrawFreePath;
    
    da_uiDrawPathNewFigure uiDrawPathNewFigure;
    da_uiDrawPathNewFigureWithArc uiDrawPathNewFigureWithArc;
    da_uiDrawPathLineTo uiDrawPathLineTo;
    da_uiDrawPathArcTo uiDrawPathArcTo;
    da_uiDrawPathBezierTo uiDrawPathBezierTo;
    da_uiDrawPathCloseFigure uiDrawPathCloseFigure;
    da_uiDrawPathAddRectangle uiDrawPathAddRectangle;
    da_uiDrawPathEnd uiDrawPathEnd;
    
    da_uiDrawStroke uiDrawStroke;
    da_uiDrawFill uiDrawFill;
    
    da_uiDrawMatrixSetIdentity uiDrawMatrixSetIdentity;
    da_uiDrawMatrixTranslate uiDrawMatrixTranslate;
    da_uiDrawMatrixScale uiDrawMatrixScale;
    da_uiDrawMatrixRotate uiDrawMatrixRotate;
    da_uiDrawMatrixSkew uiDrawMatrixSkew;
    da_uiDrawMatrixMultiply uiDrawMatrixMultiply;
    da_uiDrawMatrixInvertible uiDrawMatrixInvertible;
    da_uiDrawMatrixInvert uiDrawMatrixInvert;
    da_uiDrawMatrixTransformPoint uiDrawMatrixTransformPoint;
    da_uiDrawMatrixTransformSize uiDrawMatrixTransformSize;
    
    da_uiDrawTransform uiDrawTransform;
    
    da_uiDrawClip uiDrawClip;
    
    da_uiDrawSave uiDrawSave;
    da_uiDrawRestore uiDrawRestore;
    
    da_uiDrawListFontFamilies uiDrawListFontFamilies;
    da_uiDrawFontFamiliesNumFamilies uiDrawFontFamiliesNumFamilies;
    da_uiDrawFontFamiliesFamily uiDrawFontFamiliesFamily;
    da_uiDrawFreeFontFamilies uiDrawFreeFontFamilies;
    
    da_uiDrawLoadClosestFont uiDrawLoadClosestFont;
    da_uiDrawFreeTextFont uiDrawFreeTextFont;
    da_uiDrawTextFontHandle uiDrawTextFontHandle;
    da_uiDrawTextFontDescribe uiDrawTextFontDescribe;
    da_uiDrawTextFontGetMetrics uiDrawTextFontGetMetrics;
    
    da_uiDrawNewTextLayout uiDrawNewTextLayout;
    da_uiDrawFreeTextLayout uiDrawFreeTextLayout;
    
    da_uiDrawTextLayoutSetWidth uiDrawTextLayoutSetWidth;
    da_uiDrawTextLayoutExtents uiDrawTextLayoutExtents;
    da_uiDrawTextLayoutSetColor uiDrawTextLayoutSetColor;
    da_uiDrawText uiDrawText;
    
    da_uiFontButtonFont uiFontButtonFont;
    da_uiFontButtonOnChanged uiFontButtonOnChanged;
    da_uiNewFontButton uiNewFontButton;

    da_uiColorButtonColor uiColorButtonColor;
    da_uiColorButtonSetColor uiColorButtonSetColor;
    da_uiColorButtonOnChanged uiColorButtonOnChanged;
    da_uiNewColorButton uiNewColorButton;
}
