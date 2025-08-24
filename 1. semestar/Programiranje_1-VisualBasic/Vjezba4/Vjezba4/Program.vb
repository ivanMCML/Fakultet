Imports System
Imports System.Buffers
Imports System.ComponentModel.DataAnnotations
Imports System.Data
Imports System.Reflection.Metadata.Ecma335
Imports System.Xml.Schema



'OPERATORI

1. Uèitati N cijelih brojeva (N unosi korisnik). Izraèunati i ispisati
aritmetièku sredinu unesenih parnih brojeva osim onih koji
završavaju s 4.

Module Program
    Sub main()

        Dim N As Integer = 0
        Dim num As Integer = 0
        Dim sum As Integer = 0
        Dim counter As Integer = 0

        Console.WriteLine("Koliko cijelih brojeva želite unijeti?")
        N = Console.ReadLine()

        Console.WriteLine("Zapoènite s unosom!")
        For i As Integer = 1 To N
            num = Console.ReadLine()
            If num Mod 2 = 0 AndAlso num Mod 10 <> 4 Then
                sum += num
                counter += 1
            End If
        Next

        Console.WriteLine($"Aritmetièka sredina unesenih parnih brojeva koji ne završavaju znamenkom 4 je {sum / counter}!")
    End Sub
End Module




'2. Uèitati 5 troznamenkastih brojeva. Ispisati broj koji ima najveæu
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

'        Console.WriteLine($"Najveæu znamenku stotica ima {maxHundred}, desetica {maxTen}, a jedinica {maxOne}!")

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



'4. Uèitati 10 troznamenkastih brojeva i za svaki od uèitanih brojeva
'ispisati aritmetièku sredinu njegovih znamenki.

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

'            Console.WriteLine($"Aritmetièka sredina znamenki broja {threeDigitNum} je {digitSum / 3}!")
'            digitSum = 0
'        Next

'    End Sub
'End Module




'5. Uèitavati brojeve dok se ne unese broj 5. Ispisati zbroj uèitanih
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


'6. Uèitavati troznamenkaste brojeve dok je zbroj znamenki paran.
'Ispisati koliko je brojeva uèitano.

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
'nulu.Za svaki uneseni broj provjerite i ispišite sadrži li njegov
'binarni zapis bit težine 8. Ako ne sadrži, taj bit postavite u
'vrijednost 1.Ispišite dobiveni broj.

'Module Program
'    Sub main()

'        Dim num As Integer

'        Console.WriteLine("Unosite brojeve te 0 za kraj!")
'        num = Console.ReadLine()

'        While num <> 0

'            If (num And 8) = 8 Then
'                Console.WriteLine($"Broj {num} na bitu težine 8 sadrži 1!")
'            Else
'                Console.WriteLine($"Kada bi broj {num} imao 1 na bitu težine 8, bio bi {num Or 8}!")
'            End If
'            num = Console.ReadLine()
'        End While

'    End Sub
'End Module
