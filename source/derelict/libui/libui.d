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
        enum libNames = "libui.so, libui.A.so";
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
            bindFunc(cast(void**)&uiQuit, "uiQuit");

            bindFunc(cast(void**)&uiControlDestroy, "uiControlDestroy");
            bindFunc(cast(void**)&uiControlShow, "uiControlShow");

            bindFunc(cast(void**)&uiWindowOnClosing, "uiWindowOnClosing");
            bindFunc(cast(void**)&uiWindowSetChild, "uiWindowSetChild");
            bindFunc(cast(void**)&uiWindowMargined, "uiWindowMargined");
            bindFunc(cast(void**)&uiWindowSetMargined, "uiWindowSetMargined");
            bindFunc(cast(void**)&uiNewWindow, "uiNewWindow");

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
