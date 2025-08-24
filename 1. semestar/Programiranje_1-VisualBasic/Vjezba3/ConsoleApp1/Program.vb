Imports System
Imports System.Buffers
Imports System.ComponentModel.DataAnnotations
Imports System.Data
Imports System.Reflection.Metadata.Ecma335
Imports System.Xml.Schema

'PETLJE

'1. U�itati N cijelih brojeva (N unosi korisnik). Izra�unati i ispisati njihovu aritmeti�ku sredinu.

Module Program
    Sub main()

        Dim N As Integer
        Dim number As Integer
        Dim sum As Integer = 0

        Console.WriteLine("Koliko cijelih brojeva �elite unijeti?")
        N = Console.ReadLine()

        Console.WriteLine("Zapo�nite s unosom!")
        For i As Integer = 1 To N
            number = Console.ReadLine()
            sum += number
        Next

        Console.WriteLine($"Prosjek unesenih brojeva je {sum / N}!")

    End Sub
End Module



'U�itati N cijelih brojeva (N unosi korisnik). Ispisati najve�i i najmanji od unesenih brojeva.

'Module Program
'    Sub main()

'        Dim N As Integer
'        Dim number As Integer
'        Dim min As Integer = Integer.MaxValue
'        Dim max As Integer = Integer.MinValue

'        Console.WriteLine("Koliko cijelih brojeva �elite unijeti?")
'        N = Console.ReadLine()

'        Console.WriteLine("Zapo�nite s unosom!")
'        For i As Integer = 1 To N
'            number = Console.ReadLine()

'            If number < min Then
'                min = number
'            ElseIf number > max Then
'                max = number
'            End If
'        Next

'        Console.WriteLine($"Najve�i uneseni broj je {max}, a najmanji {min}!")

'    End Sub
'End Module



' 3. U�itavajte brojeve s konzole sve dok se upisuju neparni brojevi. 
'Izra�unajte aritmeti�ku sredinu, uzimaju�i u obzir samo brojeve ve�e od 10, a manje od 50 u izra�un.

'Module Program
'    Sub main()

'        Dim number As Integer = 0
'        Dim sum As Integer = 0
'        Dim counter As Integer = 0

'        Console.WriteLine("Unosite parne brojeve te neparni broj za prekid radnje!")

'        While number Mod 2 = 0

'            If number < 50 And number > 10 Then
'                sum += number
'                counter += 1
'            End If

'            number = Console.ReadLine()

'        End While

'        Console.WriteLine($"Rezultat: {sum / counter}")

'    End Sub
'End Module



'4. U�itavati cijele brojeve s konzole sve dok se upisuju pozitivni brojevi. Ispisati koliko je korisnik upisao prostih brojeva.

'Module Program
'    Sub main()

'        Dim number As Integer = 0
'        Dim prime As Integer = 0
'        Dim i As Integer = 0

'        Console.WriteLine("Unosite pozitivne brojeve te negativan za prekid radnje!")

'        Do

'            number = Console.ReadLine()


'            For i = 2 To number - 1

'                If number Mod i = 0 Then
'                    Exit For
'                End If

'            Next

'            If number = i Then
'                prime += 1
'            End If

'        Loop While number >= 0

'        Console.WriteLine($"Unijeli ste {prime} prostih brojeva!")

'    End Sub
'End Module



'5. Korisnik unosi prirodan broj. Provjerite unos i ispi�ite odgovaraju�uporuku ako uneseni broj nije prirodni. 
'Ispi�ite znamenke unsesenog broja jednu ispod druge, po�ev�i od one s najmanjom vrijednosti.

'Module Program
'    Sub main()

'        Dim number As Double = 0

'        Console.WriteLine("Unesite prirodni broj!")
'        number = Console.ReadLine

'        If number < 1 Or number Mod 1 <> 0 Then
'            Console.WriteLine("Uneseni broj nije prirodan!")

'        Else

'            Do

'                Console.WriteLine($"{number Mod 10}")
'                number \= 10

'            Loop While number <> 0
'        End If
'    End Sub
'End Module



'6. Korisnik unosi broj N, potrebno je napraviti ispis kao na predlo�ku. 
'N = 3
'+++
'++
'+

'Module Program
'    Sub main()

'        Dim num As Integer = 0

'        Console.WriteLine("Unesite broj!")
'        num = Console.ReadLine()

'        For i As Integer = 0 To num

'            For j As Integer = 1 To num - i

'                Console.Write("+")
'            Next

'            Console.WriteLine("")

'        Next

'    End Sub
'End Module



'7. Ispi�ite sve brojeve izme�u M i N �iji je zbroj znamenki djeljiv s brojem B. Sve brojeve unosi korisnik putem konzole.

'Module Program
'    Sub main()

'        Dim m As Integer = 0
'        Dim n As Integer = 0
'        Dim b As Integer = 0
'        Dim digitSum As Integer = 0
'        Dim tempNum As Integer = 0

'        Console.WriteLine("Unesite najve�i i najmanji broj raspona te djelitelj!")
'        m = Console.ReadLine()
'        n = Console.ReadLine()
'        b = Console.ReadLine()

'        For i As Integer = m To n
'            tempNum = i
'            While tempNum <> 0
'                digitSum += tempNum Mod 10
'                tempNum \= 10
'            End While
'            If digitSum Mod b = 0 Then
'                Console.Write($"{i}" & vbTab)
'            End If
'            digitSum = 0
'        Next

'    End Sub
'End Module

