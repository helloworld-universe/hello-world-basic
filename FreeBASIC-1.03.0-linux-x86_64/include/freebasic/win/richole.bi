'' FreeBASIC binding for mingw-w64-v4.0.1
''
'' based on the C header files:
''   This Software is provided under the Zope Public License (ZPL) Version 2.1.
''
''   Copyright (c) 2009, 2010 by the mingw-w64 project
''
''   See the AUTHORS file for the list of contributors to the mingw-w64 project.
''
''   This license has been certified as open source. It has also been designated
''   as GPL compatible by the Free Software Foundation (FSF).
''
''   Redistribution and use in source and binary forms, with or without
''   modification, are permitted provided that the following conditions are met:
''
''     1. Redistributions in source code must retain the accompanying copyright
''        notice, this list of conditions, and the following disclaimer.
''     2. Redistributions in binary form must reproduce the accompanying
''        copyright notice, this list of conditions, and the following disclaimer
''        in the documentation and/or other materials provided with the
''        distribution.
''     3. Names of the copyright holders must not be used to endorse or promote
''        products derived from this software without prior written permission
''        from the copyright holders.
''     4. The right to distribute this software or to use it for any purpose does
''        not give you the right to use Servicemarks (sm) or Trademarks (tm) of
''        the copyright holders.  Use of them is covered by separate agreement
''        with the copyright holders.
''     5. If any files are modified, you must cause the modified files to carry
''        prominent notices stating that you changed the files and the date of
''        any change.
''
''   Disclaimer
''
''   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS ``AS IS'' AND ANY EXPRESSED
''   OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
''   OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
''   EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY DIRECT, INDIRECT,
''   INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
''   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, 
''   OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
''   LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
''   NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
''   EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
''
'' translated to FreeBASIC by:
''   Copyright © 2015 FreeBASIC development team

#pragma once

#inclib "uuid"

#include once "richedit.bi"

extern "Windows"

#define _RICHOLE_

type _reobject
	cbStruct as DWORD
	cp as LONG
	clsid as CLSID
	poleobj as LPOLEOBJECT
	pstg as LPSTORAGE
	polesite as LPOLECLIENTSITE
	sizel as SIZEL
	dvaspect as DWORD
	dwFlags as DWORD
	dwUser as DWORD
end type

type REOBJECT as _reobject
#define REO_GETOBJ_NO_INTERFACES __MSABI_LONG(&h00000000)
#define REO_GETOBJ_POLEOBJ __MSABI_LONG(&h00000001)
#define REO_GETOBJ_PSTG __MSABI_LONG(&h00000002)
#define REO_GETOBJ_POLESITE __MSABI_LONG(&h00000004)
#define REO_GETOBJ_ALL_INTERFACES __MSABI_LONG(&h00000007)
#define REO_CP_SELECTION cast(ULONG, -1)
#define REO_IOB_SELECTION cast(ULONG, -1)
#define REO_IOB_USE_CP cast(ULONG, -2)
#define REO_NULL __MSABI_LONG(&h00000000)
#define REO_READWRITEMASK __MSABI_LONG(&h000007ff)
#define REO_CANROTATE __MSABI_LONG(&h00000080)
#define REO_OWNERDRAWSELECT __MSABI_LONG(&h00000040)
#define REO_DONTNEEDPALETTE __MSABI_LONG(&h00000020)
#define REO_BLANK __MSABI_LONG(&h00000010)
#define REO_DYNAMICSIZE __MSABI_LONG(&h00000008)
#define REO_INVERTEDSELECT __MSABI_LONG(&h00000004)
#define REO_BELOWBASELINE __MSABI_LONG(&h00000002)
#define REO_RESIZABLE __MSABI_LONG(&h00000001)
#define REO_USEASBACKGROUND __MSABI_LONG(&h00000400)
#define REO_WRAPTEXTAROUND __MSABI_LONG(&h00000200)
#define REO_ALIGNTORIGHT __MSABI_LONG(&h00000100)
#define REO_LINK __MSABI_LONG(&h80000000)
#define REO_STATIC __MSABI_LONG(&h40000000)
#define REO_SELECTED __MSABI_LONG(&h08000000)
#define REO_OPEN __MSABI_LONG(&h04000000)
#define REO_INPLACEACTIVE __MSABI_LONG(&h02000000)
#define REO_HILITED __MSABI_LONG(&h01000000)
#define REO_LINKAVAILABLE __MSABI_LONG(&h00800000)
#define REO_GETMETAFILE __MSABI_LONG(&h00400000)
#define RECO_PASTE __MSABI_LONG(&h00000000)
#define RECO_DROP __MSABI_LONG(&h00000001)
#define RECO_COPY __MSABI_LONG(&h00000002)
#define RECO_CUT __MSABI_LONG(&h00000003)
#define RECO_DRAG __MSABI_LONG(&h00000004)
type IRichEditOleVtbl as IRichEditOleVtbl_

type IRichEditOle
	lpVtbl as IRichEditOleVtbl ptr
end type

type IRichEditOleVtbl_
	QueryInterface as function(byval This as IRichEditOle ptr, byval riid as const IID const ptr, byval lplpObj as LPVOID ptr) as HRESULT
	AddRef as function(byval This as IRichEditOle ptr) as ULONG
	Release as function(byval This as IRichEditOle ptr) as ULONG
	GetClientSite as function(byval This as IRichEditOle ptr, byval lplpolesite as LPOLECLIENTSITE ptr) as HRESULT
	GetObjectCount as function(byval This as IRichEditOle ptr) as LONG
	GetLinkCount as function(byval This as IRichEditOle ptr) as LONG
	GetObject as function(byval This as IRichEditOle ptr, byval iob as LONG, byval lpreobject as REOBJECT ptr, byval dwFlags as DWORD) as HRESULT
	InsertObject as function(byval This as IRichEditOle ptr, byval lpreobject as REOBJECT ptr) as HRESULT
	ConvertObject as function(byval This as IRichEditOle ptr, byval iob as LONG, byval rclsidNew as const IID const ptr, byval lpstrUserTypeNew as LPCSTR) as HRESULT
	ActivateAs as function(byval This as IRichEditOle ptr, byval rclsid as const IID const ptr, byval rclsidAs as const IID const ptr) as HRESULT
	SetHostNames as function(byval This as IRichEditOle ptr, byval lpstrContainerApp as LPCSTR, byval lpstrContainerObj as LPCSTR) as HRESULT
	SetLinkAvailable as function(byval This as IRichEditOle ptr, byval iob as LONG, byval fAvailable as WINBOOL) as HRESULT
	SetDvaspect as function(byval This as IRichEditOle ptr, byval iob as LONG, byval dvaspect as DWORD) as HRESULT
	HandsOffStorage as function(byval This as IRichEditOle ptr, byval iob as LONG) as HRESULT
	SaveCompleted as function(byval This as IRichEditOle ptr, byval iob as LONG, byval lpstg as LPSTORAGE) as HRESULT
	InPlaceDeactivate as function(byval This as IRichEditOle ptr) as HRESULT
	ContextSensitiveHelp as function(byval This as IRichEditOle ptr, byval fEnterMode as WINBOOL) as HRESULT
	GetClipboardData as function(byval This as IRichEditOle ptr, byval lpchrg as CHARRANGE ptr, byval reco as DWORD, byval lplpdataobj as LPDATAOBJECT ptr) as HRESULT
	ImportDataObject as function(byval This as IRichEditOle ptr, byval lpdataobj as LPDATAOBJECT, byval cf as CLIPFORMAT, byval hMetaPict as HGLOBAL) as HRESULT
end type

type LPRICHEDITOLE as IRichEditOle ptr
type IRichEditOleCallbackVtbl as IRichEditOleCallbackVtbl_

type IRichEditOleCallback
	lpVtbl as IRichEditOleCallbackVtbl ptr
end type

type IRichEditOleCallbackVtbl_
	QueryInterface as function(byval This as IRichEditOleCallback ptr, byval riid as const IID const ptr, byval lplpObj as LPVOID ptr) as HRESULT
	AddRef as function(byval This as IRichEditOleCallback ptr) as ULONG
	Release as function(byval This as IRichEditOleCallback ptr) as ULONG
	GetNewStorage as function(byval This as IRichEditOleCallback ptr, byval lplpstg as LPSTORAGE ptr) as HRESULT
	GetInPlaceContext as function(byval This as IRichEditOleCallback ptr, byval lplpFrame as LPOLEINPLACEFRAME ptr, byval lplpDoc as LPOLEINPLACEUIWINDOW ptr, byval lpFrameInfo as LPOLEINPLACEFRAMEINFO) as HRESULT
	ShowContainerUI as function(byval This as IRichEditOleCallback ptr, byval fShow as WINBOOL) as HRESULT
	QueryInsertObject as function(byval This as IRichEditOleCallback ptr, byval lpclsid as LPCLSID, byval lpstg as LPSTORAGE, byval cp as LONG) as HRESULT
	DeleteObject as function(byval This as IRichEditOleCallback ptr, byval lpoleobj as LPOLEOBJECT) as HRESULT
	QueryAcceptData as function(byval This as IRichEditOleCallback ptr, byval lpdataobj as LPDATAOBJECT, byval lpcfFormat as CLIPFORMAT ptr, byval reco as DWORD, byval fReally as WINBOOL, byval hMetaPict as HGLOBAL) as HRESULT
	ContextSensitiveHelp as function(byval This as IRichEditOleCallback ptr, byval fEnterMode as WINBOOL) as HRESULT
	GetClipboardData as function(byval This as IRichEditOleCallback ptr, byval lpchrg as CHARRANGE ptr, byval reco as DWORD, byval lplpdataobj as LPDATAOBJECT ptr) as HRESULT
	GetDragDropEffect as function(byval This as IRichEditOleCallback ptr, byval fDrag as WINBOOL, byval grfKeyState as DWORD, byval pdwEffect as LPDWORD) as HRESULT
	GetContextMenu as function(byval This as IRichEditOleCallback ptr, byval seltype as WORD, byval lpoleobj as LPOLEOBJECT, byval lpchrg as CHARRANGE ptr, byval lphmenu as HMENU ptr) as HRESULT
end type

type LPRICHEDITOLECALLBACK as IRichEditOleCallback ptr
extern IID_IRichEditOle as const GUID
extern IID_IRichEditOleCallback as const GUID

end extern
