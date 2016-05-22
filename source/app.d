module app;

import derelict.libui.libui;

uiWindow* mainwin;

extern(C) int onClosing(uiWindow* w, void* data) nothrow @nogc
{
    uiControlDestroy(cast(uiControl*)mainwin);
    uiQuit();
    return 0;
}
 
void main()
{
    DerelictLibui.load();

    uiInitOptions o;

    //memset(&o, 0, sizeof (uiInitOptions));
    auto err = uiInit(&o);
    assert(err is null);

    mainwin = uiNewWindow("libui Example", 640, 480, 1);
    uiWindowSetMargined(mainwin, 1);
    uiWindowOnClosing(mainwin, &onClosing, null);
    
    auto colorButton = uiNewColorButton();

    uiWindowSetChild(mainwin, cast(uiControl*)colorButton);

    uiControlShow(cast(uiControl*)mainwin);

    uiMain();

    uiUninit();
	
    DerelictLibui.unload();
}
