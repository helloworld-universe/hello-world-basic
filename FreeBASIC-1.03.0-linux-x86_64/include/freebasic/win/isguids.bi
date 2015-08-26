'' FreeBASIC binding for mingw-w64-v4.0.1
''
'' based on the C header files:
''   DISCLAIMER
''   This file has no copyright assigned and is placed in the Public Domain.
''   This file is part of the mingw-w64 runtime package.
''
''   The mingw-w64 runtime package and its code is distributed in the hope that it 
''   will be useful but WITHOUT ANY WARRANTY.  ALL WARRANTIES, EXPRESSED OR 
''   IMPLIED ARE HEREBY DISCLAIMED.  This includes but is not limited to 
''   warranties of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
''
'' translated to FreeBASIC by:
''   Copyright © 2015 FreeBASIC development team

#pragma once

#inclib "uuid"

#include once "_mingw_unicode.bi"

extern "C"

#define _ISGUIDS_H_

#ifdef UNICODE
	#define IID_IUniformResourceLocator IID_IUniformResourceLocatorW
#else
	#define IID_IUniformResourceLocator IID_IUniformResourceLocatorA
#endif

extern CLSID_InternetShortcut as const GUID
extern IID_IUniformResourceLocatorA as const GUID
extern IID_IUniformResourceLocatorW as const GUID

end extern
