module app;

import derelict.libui.libui;

uiWindow* mainwin;
uiSpinbox* spinbox;
uiSlider* slider;
uiProgressBar* progressbar;

extern(C) nothrow {

    int shouldQuit(void *data)
    {
        uiControlDestroy(cast(uiControl*)(mainwin));
        return 1;
    }

    void openClicked(uiMenuItem *item, uiWindow *w, void *data)
    {
        auto filename = uiOpenFile(mainwin);
        if (filename is null) {
            uiMsgBoxError(mainwin, "No file selected", "Don't be alarmed!");
            return;
        }
        uiMsgBox(mainwin, "File selected", filename);
        uiFreeText(filename);
    }

    void saveClicked(uiMenuItem *item, uiWindow *w, void *data)
    {
        auto filename = uiSaveFile(mainwin);
        if (filename is null) {
            uiMsgBoxError(mainwin, "No file selected", "Don't be alarmed!");
            return;
        }
        uiMsgBox(mainwin, "File selected (don't worry, it's still there)", filename);
        uiFreeText(filename);
    }

    int onClosing(uiWindow* w, void* data)
    {
        uiControlDestroy(cast(uiControl*)mainwin);
        uiQuit();
        return 0;
    }

    void onSpinboxChanged(uiSpinbox *s, void *data)
    {
        update(uiSpinboxValue(spinbox));
    }

    void onSliderChanged(uiSlider *s, void *data)
    {
        update(uiSliderValue(slider));
    }
}

void update(intmax_t value) nothrow
{
    uiSpinboxSetValue(spinbox, value);
    uiSliderSetValue(slider, value);
    uiProgressBarSetValue(progressbar, value);
}
 
void main()
{
    DerelictLibui.load();

    uiInitOptions o;

    //memset(&o, 0, sizeof (uiInitOptions));
    auto err = uiInit(&o);
    assert(err is null);

    auto menu = uiNewMenu("File");
    auto item = uiMenuAppendItem(menu, "Open");
    uiMenuItemOnClicked(item, &openClicked, null);
    item = uiMenuAppendItem(menu, "Save");
    uiMenuItemOnClicked(item, &saveClicked, null);
    item = uiMenuAppendQuitItem(menu);
    uiOnShouldQuit(&shouldQuit, null);

    menu = uiNewMenu("Edit");
    item = uiMenuAppendCheckItem(menu, "Checkable Item");
    uiMenuAppendSeparator(menu);
    item = uiMenuAppendItem(menu, "Disabled Item");
    uiMenuItemDisable(item);
    item = uiMenuAppendPreferencesItem(menu);

    menu = uiNewMenu("Help");
    item = uiMenuAppendItem(menu, "Help");
    item = uiMenuAppendAboutItem(menu);

    mainwin = uiNewWindow("libui Control Gallery", 640, 480, 1);
    uiWindowSetMargined(mainwin, 1);
    uiWindowOnClosing(mainwin, &onClosing, null);

    auto box = uiNewVerticalBox();
    uiBoxSetPadded(box, 1);
    uiWindowSetChild(mainwin, cast(uiControl*)(box));

    auto hbox = uiNewHorizontalBox();
    uiBoxSetPadded(hbox, 1);
    uiBoxAppend(box, cast(uiControl*)(hbox), 1);

    auto group = uiNewGroup("Basic Controls");
    uiGroupSetMargined(group, 1);
    uiBoxAppend(hbox, cast(uiControl*)(group), 0);

    auto inner = uiNewVerticalBox();
    uiBoxSetPadded(inner, 1);
    uiGroupSetChild(group, cast(uiControl*)(inner));

    uiBoxAppend(inner,
        cast(uiControl*)(uiNewButton("Button")),
        0);
    uiBoxAppend(inner,
        cast(uiControl*)(uiNewCheckbox("Checkbox")),
        0);
    auto entry = uiNewEntry();
    uiEntrySetText(entry, "Entry");
    uiBoxAppend(inner,
        cast(uiControl*)(entry),
        0);
    uiBoxAppend(inner,
        cast(uiControl*)(uiNewLabel("Label")),
        0);

    uiBoxAppend(inner,
        cast(uiControl*)(uiNewHorizontalSeparator()),
        0);

    uiBoxAppend(inner,
        cast(uiControl*)(uiNewDatePicker()),
        0);
    uiBoxAppend(inner,
        cast(uiControl*)(uiNewTimePicker()),
        0);
    uiBoxAppend(inner,
        cast(uiControl*)(uiNewDateTimePicker()),
        0);

    uiBoxAppend(inner,
        cast(uiControl*)(uiNewFontButton()),
        0);

    uiBoxAppend(inner,
        cast(uiControl*)(uiNewColorButton()),
        0);

    auto inner2 = uiNewVerticalBox();
    uiBoxSetPadded(inner2, 1);
    uiBoxAppend(hbox, cast(uiControl*)(inner2), 1);

    group = uiNewGroup("Numbers");
    uiGroupSetMargined(group, 1);
    uiBoxAppend(inner2, cast(uiControl*)(group), 0);

    inner = uiNewVerticalBox();
    uiBoxSetPadded(inner, 1);
    uiGroupSetChild(group, cast(uiControl*)(inner));

    spinbox = uiNewSpinbox(0, 100);
    uiSpinboxOnChanged(spinbox, &onSpinboxChanged, null);
    uiBoxAppend(inner, cast(uiControl*)(spinbox), 0);

    slider = uiNewSlider(0, 100);
    uiSliderOnChanged(slider, &onSliderChanged, null);
    uiBoxAppend(inner, cast(uiControl*)(slider), 0);

    progressbar = uiNewProgressBar();
    uiBoxAppend(inner, cast(uiControl*)(progressbar), 0);

    group = uiNewGroup("Lists");
    uiGroupSetMargined(group, 1);
    uiBoxAppend(inner2, cast(uiControl*)(group), 0);

    inner = uiNewVerticalBox();
    uiBoxSetPadded(inner, 1);
    uiGroupSetChild(group, cast(uiControl*)(inner));

    auto cbox = uiNewCombobox();
    uiComboboxAppend(cbox, "Combobox Item 1");
    uiComboboxAppend(cbox, "Combobox Item 2");
    uiComboboxAppend(cbox, "Combobox Item 3");
    uiBoxAppend(inner, cast(uiControl*)(cbox), 0);

    cbox = uiNewEditableCombobox();
    uiComboboxAppend(cbox, "Editable Item 1");
    uiComboboxAppend(cbox, "Editable Item 2");
    uiComboboxAppend(cbox, "Editable Item 3");
    uiBoxAppend(inner, cast(uiControl*)(cbox), 0);

    auto rb = uiNewRadioButtons();
    uiRadioButtonsAppend(rb, "Radio Button 1");
    uiRadioButtonsAppend(rb, "Radio Button 2");
    uiRadioButtonsAppend(rb, "Radio Button 3");
    uiBoxAppend(inner, cast(uiControl*)(rb), 1);

    auto tab = uiNewTab();
    uiTabAppend(tab, "Page 1", cast(uiControl*)uiNewHorizontalBox());
    uiTabAppend(tab, "Page 2", cast(uiControl*)uiNewHorizontalBox());
    uiTabAppend(tab, "Page 3", cast(uiControl*)uiNewHorizontalBox());
    uiBoxAppend(inner2, cast(uiControl*)(tab), 1);

    uiControlShow(cast(uiControl*)(mainwin));
    uiMain();
    uiUninit();
	
    DerelictLibui.unload();
}
