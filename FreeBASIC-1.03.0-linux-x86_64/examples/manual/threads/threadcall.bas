'' examples/manual/threads/threadcall.bas
''
'' NOTICE: This file is part of the FreeBASIC Compiler package and can't
''         be included in other distributions without authorization.
''
'' See Also: http://www.freebasic.net/wiki/wikka.php?wakka=KeyPgThreadCall
'' --------

'' Threading using "ThreadCall"

Sub thread( id As String, tlock As Any Ptr, count As Integer )
	For i As Integer = 1 To count
		MutexLock tlock
		Print "thread " & id;
		Locate , 20
		Print i & "/" & count
		MutexUnlock tlock
	Next
End Sub

Dim tlock As Any Ptr = MutexCreate()
Dim a As Any Ptr = ThreadCall thread("A", tlock, 6)
Dim b As Any Ptr = ThreadCall thread("B", tlock, 4)
ThreadWait a
ThreadWait b
MutexDestroy tlock
Print "All done (and without Dim Shared!)"
