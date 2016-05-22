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

alias cstring = const(char)*;

extern(C) @nogc nothrow
{
    alias da_uiInit = cstring function(uiInitOptions *options);
    alias da_uiUninit = void function();

    alias da_uiFreeInitError = void function(const char *err);

    alias da_uiMain = void function();
    alias da_uiQuit = void function();
/+
// TODO write a test for this after adding multiline entries
_UI_EXTERN void uiQueueMain(void (*f)(void *data), void *data);

_UI_EXTERN void uiOnShouldQuit(int (*f)(void *data), void *data);

_UI_EXTERN void uiFreeText(char *text);
+/

    alias da_uiControlDestroy = void function(uiControl *);
/+
_UI_EXTERN uintptr_t uiControlHandle(uiControl *);
_UI_EXTERN uiControl *uiControlParent(uiControl *);
_UI_EXTERN void uiControlSetParent(uiControl *, uiControl *);
_UI_EXTERN int uiControlToplevel(uiControl *);
_UI_EXTERN int uiControlVisible(uiControl *);
+/
    alias da_uiControlShow = void function(uiControl *);
/+
_UI_EXTERN void uiControlHide(uiControl *);
_UI_EXTERN int uiControlEnabled(uiControl *);
_UI_EXTERN void uiControlEnable(uiControl *);
_UI_EXTERN void uiControlDisable(uiControl *);+/

alias onWindowClosingFunction = int function(uiWindow* w, void* data) nothrow;

//_UI_EXTERN char *uiWindowTitle(uiWindow *w);
//_UI_EXTERN void uiWindowSetTitle(uiWindow *w, const char *title);
    alias da_uiWindowOnClosing = void function(uiWindow *w, onWindowClosingFunction f, void* data);
    alias da_uiWindowSetChild = void function(uiWindow *w, uiControl *child);
    alias da_uiWindowMargined = int function(uiWindow *w);
    alias da_uiWindowSetMargined = void function(uiWindow *w, int margined);
    alias da_uiNewWindow = uiWindow* function(cstring title, int width, int height, int hasMenubar);

    //_UI_EXTERN void uiColorButtonColor(uiColorButton *b, double *r, double *g, double *bl, double *a);
//_UI_EXTERN void uiColorButtonSetColor(uiColorButton *b, double r, double g, double bl, double a);
//_UI_EXTERN void uiColorButtonOnChanged(uiColorButton *b, void (*f)(uiColorButton *, void *), void *data);
    alias da_uiNewColorButton = uiColorButton* function();
}

__gshared
{
    da_uiInit uiInit;
    da_uiUninit uiUninit;

    da_uiFreeInitError uiFreeInitError;
    da_uiMain uiMain;
    da_uiQuit uiQuit;

    da_uiControlDestroy uiControlDestroy;
    da_uiControlShow uiControlShow;

    da_uiWindowOnClosing uiWindowOnClosing;
    da_uiWindowSetChild uiWindowSetChild;
    da_uiWindowMargined uiWindowMargined;
    da_uiWindowSetMargined uiWindowSetMargined;
    da_uiNewWindow uiNewWindow;

    da_uiNewColorButton uiNewColorButton;
}
