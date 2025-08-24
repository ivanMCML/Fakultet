Imports System
Imports System.Buffers
Imports System.ComponentModel.DataAnnotations
Imports System.Data
Imports System.Reflection.Metadata.Ecma335
Imports System.Xml.Schema



'OPERATORI

1. U�itati N cijelih brojeva (N unosi korisnik). Izra�unati i ispisati
aritmeti�ku sredinu unesenih parnih brojeva osim onih koji
zavr�avaju s 4.

Module Program
    Sub main()

        Dim N As Integer = 0
        Dim num As Integer = 0
        Dim sum As Integer = 0
        Dim counter As Integer = 0

        Console.WriteLine("Koliko cijelih brojeva �elite unijeti?")
        N = Console.ReadLine()

        Console.WriteLine("Zapo�nite s unosom!")
        For i As Integer = 1 To N
            num = Console.ReadLine()
            If num Mod 2 = 0 AndAlso num Mod 10 <> 4 Then
                sum += num
                counter += 1
            End If
        Next

        Console.WriteLine($"Aritmeti�ka sredina unesenih parnih brojeva koji ne zavr�avaju znamenkom 4 je {sum / counter}!")
    End Sub
End Module




'2. U�itati 5 troznamenkastih brojeva. Ispisati broj koji ima najve�u
'znamenku stotica, desetica ili jedinica.

'Module Program
'    Sub main()

'        Dim threeDigitNum As Integer
'        Dim maxHundred As Integer = 0
'        Dim maxTen As Integer = 0
'        Dim maxOne As Integer = 0

'        Console.WriteLine("Unesite 5 troznamenkastih brojeva!")
'        For i As Integer = 0 To 4
'            threeDigitNum = Console.ReadLine()

'            If threeDigitNum > maxHundred Then
'                maxHundred = threeDigitNum
'            End If
'            If threeDigitNum Mod 100 > maxTen Mod 100 Then
'                maxTen = threeDigitNum
'            End If
'            If threeDigitNum Mod 10 > maxOne Mod 10 Then
'                maxOne = threeDigitNum
'            End If

'        Next

'        Console.WriteLine($"Najve�u znamenku stotica ima {maxHundred}, desetica {maxTen}, a jedinica {maxOne}!")

'    End Sub
'End Module





'3. Prebrojite koliko brojeva unutar zadanog raspona (koji unosi
'korisnik putem konzole) ima znamenku jedinice vrijednosti 9.

'Module Program
'    Sub main()

'        Dim min As Integer
'        Dim max As Integer
'        Dim counter As Integer = 0

'        Console.WriteLine("Unesite gornju i donju granicu raspona!")
'        min = Console.ReadLine()
'        max = Console.ReadLine()

'        For i As Integer = min To max
'            If i Mod 10 = 9 Then
'                counter += 1
'            End If
'        Next

'        Console.WriteLine($"Unutar zadanog raspona {counter} brojeva ima 9 za znamenku jedinice!")

'    End Sub
'End Module



'4. U�itati 10 troznamenkastih brojeva i za svaki od u�itanih brojeva
'ispisati aritmeti�ku sredinu njegovih znamenki.

'Module Program
'    Sub main()

'        Dim threeDigitNum As Integer
'        Dim digitSum As Integer = 0
'        Dim tempNum As Integer = 0

'        Console.WriteLine("Unesite 10 troznamenkastih brojeva!")
'        For i As Integer = 0 To 9
'            threeDigitNum = Console.ReadLine()
'            tempNum = threeDigitNum

'            While tempNum <> 0
'                digitSum += tempNum Mod 10
'                tempNum \= 10
'            End While

'            Console.WriteLine($"Aritmeti�ka sredina znamenki broja {threeDigitNum} je {digitSum / 3}!")
'            digitSum = 0
'        Next

'    End Sub
'End Module




'5. U�itavati brojeve dok se ne unese broj 5. Ispisati zbroj u�itanih
'brojeva, te one koji su djeljivi s 5 ili sa 7.

'Module Program
'    Sub main()

'        Dim num As Integer = 0
'        Dim sum As Integer = 0

'        Console.WriteLine("Unosite brojeve, a za kraj radnje unesite broj 5!")
'        num = Console.ReadLine()
'        While num <> 5
'            sum += num
'            If num Mod 5 = 0 Or num Mod 7 = 0 Then
'                Console.WriteLine("Broj je dijeljiv s 5 ili 7!")
'            End If
'            num = Console.ReadLine()
'        End While

'        Console.WriteLine($"Suma unesenih brojeva je {sum}!")

'    End Sub
'End Module


'6. U�itavati troznamenkaste brojeve dok je zbroj znamenki paran.
'Ispisati koliko je brojeva u�itano.

'Module Program
'    Sub main()

'        Dim num As Integer = 0
'        Dim counter As Integer = 0

'        Do
'            counter += 1
'            num = Console.ReadLine()
'        Loop While ((num \ 100) + ((num Mod 100)) \ 10 + (num Mod 10)) Mod 2 = 0

'        Console.WriteLine($"Uneseno je {counter} brojeva!")
'    End Sub
'End Module



'7. Korisnik putem konzole unosi cijele brojeve sve dok ne unese
'nulu.Za svaki uneseni broj provjerite i ispi�ite sadr�i li njegov
'binarni zapis bit te�ine 8. Ako ne sadr�i, taj bit postavite u
'vrijednost 1.Ispi�ite dobiveni broj.

'Module Program
'    Sub main()

'        Dim num As Integer

'        Console.WriteLine("Unosite brojeve te 0 za kraj!")
'        num = Console.ReadLine()

'        While num <> 0

'            If (num And 8) = 8 Then
'                Console.WriteLine($"Broj {num} na bitu te�ine 8 sadr�i 1!")
'            Else
'                Console.WriteLine($"Kada bi broj {num} imao 1 na bitu te�ine 8, bio bi {num Or 8}!")
'            End If
'            num = Console.ReadLine()
'        End While

'    End Sub
'End Module
