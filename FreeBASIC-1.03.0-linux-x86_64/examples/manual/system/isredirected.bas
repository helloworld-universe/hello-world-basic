'' examples/manual/system/isredirected.bas
''
'' NOTICE: This file is part of the FreeBASIC Compiler package and can't
''         be included in other distributions without authorization.
''
'' See Also: http://www.freebasic.net/wiki/wikka.php?wakka=KeyPgIsredirected
'' --------

'' A Windows based example, just for the use principle
'' Self-sufficient example, using his own .exe file as dummy input file for stdin redirection

#include "fbio.bi"

'' Quotation marks wrapping for compatibility with spaces in path name
Dim As String pathExe = """" & ExePath & """"
Dim As String fileExe = Mid(Command(0), InStrRev(Command(0), "\") + 1)
Dim As String redirection = " < """ & Command(0)
If LCase(Right(Command(0), 4)) = ".exe" Then
  redirection &= """"
Else
  redirection &= ".exe"""
End If

If Command() = "" Then  '' First process without stdin redirection
  '' Check stdin redirection
  Print "First process without stdin redirection: IsRedirected(-1) = "; Isredirected(-1)
  '' Creation of asynchronous second process with stdin redirected from file.exe
  Shell("start /d " & pathExe & " /b " & fileExe & redirection & " secondprocess")
  '' Waiting for termination of asynchronous second process
  Sleep
ElseIf Command() = "secondprocess" Then  '' Second process with stdin redirection
  '' Check stdin redirection
  Print "Second process with stdin redirection  : IsRedirected(-1) = "; Isredirected(-1)
End If
