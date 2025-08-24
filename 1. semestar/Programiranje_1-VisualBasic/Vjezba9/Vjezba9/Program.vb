Imports System
Imports System.Buffers
Imports System.ComponentModel.DataAnnotations
Imports System.Data
Imports System.Reflection.Metadata.Ecma335
Imports System.Xml.Schema



' KLASE

'1. Implementirajte klasu Polygon kojom opisujemo pravilni
'mnogokut, sa dva privatna polja za opisivanje duljine stranice i
'broja stranica, te metodom za izraèun opsega. U Main proceduri
'kreirati objekt tipa Polygon, te ispisati njegov opseg.

'Module Program

'    Public Class Polygon

'        Private _sideLenght As Double
'        Private _numOfSides As Short

'        Public Sub New(_sideLenght As Double, _numOfSides As Short)
'            Me._sideLenght = _sideLenght
'            Me._numOfSides = _numOfSides
'        End Sub

'        Public Function Opseg() As Double
'            Return Me._numOfSides * Me._sideLenght
'        End Function

'        Public Property Lenght() As Double
'            Get
'                Return Me._sideLenght
'            End Get
'            Set(value As Double)
'                Me._sideLenght = value
'            End Set
'        End Property

'        Public Property Num() As Short
'            Get
'                Return Me._numOfSides
'            End Get
'            Set(value As Short)
'                Me._numOfSides = value
'            End Set
'        End Property

'    End Class

'    Sub main()

'        Dim peterokut As Polygon = New Polygon(4.7, 5)
'        Dim sedmerokut As Polygon = New Polygon(5, 3)
'        Dim n As Short

'        Console.WriteLine(peterokut.Opseg)
'        sedmerokut.Num = 7
'        Console.WriteLine(sedmerokut.Num() * sedmerokut.Lenght)
'    End Sub
'End Module






'2. Implementirajte klasu Account kojom æete opisati bankovni raèun.
'Treba sadržavati polja za IBAN broj raèuna (tipa String), stanje
'(tipa Decimal), vlasnik (tipa String). Svi elementi trebaju biti
'privatni.Potrebno je kreirati svojstva (properties) IBAN (za
'dohvaæanje i postavljanje broja raèuna), Owner (vraæa ili postavlja
'vlasnika), te Balance (samo vraæa stanje). Za rad s raèunima
'osigurajte dva postupka Deposit i Withdraw. Oba postupka
'primaju Decimal parametar, kod Withdraw se oduzima stanje na
'raèunu, treba voditi raèuna je li iznos raspoloživ, te ako nije
'izbacujemo iznimku. Deposit dodaje iznos na raèun. U proceduri
'Main kreirajte raèun i obavite nekoliko transakcija da provjerite
'sve funkcionalnosti.

Module Program

    Public Class Owner
        Private _firstName As String
        Private _lastName As String

        Public Sub New(ime As String, prezime As String)
            Me._firstName = ime
            Me._lastName = prezime
        End Sub

        Public Property Ime() As String
            Get
                Return Me._firstName
            End Get
            Set(value As String)
                Me._firstName = value
            End Set
        End Property

        Public Property Prezime() As String
            Get
                Return Me._lastName
            End Get
            Set(value As String)
                Me._lastName = value
            End Set
        End Property

    End Class



    Public Class Account

        Inherits Owner

        Private _iban As String
        Private _balance As Decimal

        Public Sub New(iban As String, ime As String, prezime As String, balance As Decimal)
            MyBase.New(ime, prezime)
            Me._iban = iban
            Me._balance = balance

        End Sub

        Public Property Iban() As String
            Get
                Return Me._iban
            End Get
            Set(value As String)
                Me._iban = value
            End Set
        End Property

        Public ReadOnly Property Balance() As String
            Get
                Return Me._balance.ToString & "e"
            End Get
        End Property

        Private WriteOnly Property Balance_W() As Decimal
            Set(value As Decimal)
                If Me._balance >= value Then
                    Me._balance = Me._balance - value
                Else
                    Console.WriteLine("Na raèunu nemate dovoljan iznos!")
                End If
            End Set
        End Property

        Public Sub Deposite(euro As Decimal)

            Me._balance += euro
        End Sub

        Public Sub Withdraw(euro As Decimal)

            Balance_W() = euro
        End Sub

    End Class



    Sub main()

        Dim ime As String
        Dim prezime As String
        Dim iban As String


        GetFirstAndLastName(ime, prezime)


        Console.WriteLine("Iban:")
        iban = Console.ReadLine()


        Dim acc As Account = New Account(iban, ime, prezime, 0)
        Dim i As Short = 1


        Do
            If i < 0 Or i > 4 Then
                Console.WriteLine("Neispravan unos!")
            End If

            Console.WriteLine($"Dodajte novac{vbTab}1")
            Console.WriteLine($"Podignite novac{vbTab}2")
            Console.WriteLine($"Promijenite korisnièko ime{vbTab}3")
            Console.WriteLine($"Promijenite IBAN{vbTab}4")
            Console.WriteLine($"Zatvorite raèun{vbTab}0")

            i = Console.ReadLine()

            Select Case i
                Case 1
                    Console.WriteLine("Koliko novca Želite dodati?")
                    acc.Deposite(Console.ReadLine())

                Case 2
                    Console.WriteLine("Koliko novca želite podignuti?")
                    acc.Withdraw(Console.ReadLine())

                Case 3
                    GetFirstAndLastName(ime, prezime)
                    acc.Ime = ime
                    acc.Prezime = prezime

                Case 4
                    Console.WriteLine("Unesite iban:")
                    acc.Iban = Console.ReadLine()

            End Select

            Console.WriteLine()
            Console.WriteLine($"Ime: {acc.Ime}")
            Console.WriteLine($"Prezime: {acc.Prezime}")
            Console.WriteLine($"IBAN: {acc.Iban}")
            Console.WriteLine($"Stanje na raèunu: {acc.Balance}")
            Console.WriteLine()

        Loop Until (i = 0)



    End Sub

    Public Sub GetFirstAndLastName(ByRef ime As String, ByRef prezime As String)

        Dim temp As String
        Dim n As Integer
        Dim c As Char


        Console.WriteLine("Ime i prezime:")
        temp = (Console.ReadLine()).ToLower

        n = temp.IndexOf(" ")
        prezime = temp.Substring(n + 1)
        temp = temp.Remove(n)

        ime = temp(0)
        c = ime.ToUpper()
        ime = c & temp.Remove(0, 1)

        temp = prezime(0)
        c = temp.ToUpper()
        prezime = c & prezime.Remove(0, 1)
    End Sub

End Module








'Module Program

'    Public Class Album

'        Private _ime As String
'        Private _izvodac As String
'        Private _godina As Integer

'        Public Sub New(ime As String, izvodac As String, godina As Integer)

'            Me._ime = ime
'            Me._izvodac = izvodac
'            Me._godina = godina

'        End Sub

'        Public Property ImeAlbuma() As String
'            Get
'                Return Me._ime
'            End Get
'            Set(value As String)
'                Me._ime = value
'            End Set
'        End Property

'        Public Property Izvodac() As String
'            Get
'                Return Me._izvodac
'            End Get
'            Set(value As String)
'                Me._izvodac = value
'            End Set
'        End Property

'        Public Property Godina() As Integer
'            Get
'                Return Me._godina
'            End Get
'            Set(value As Integer)
'                Me._godina = value
'            End Set
'        End Property

'    End Class

'    Sub main()

'        Dim albumi As Album() = New Album(1) {New Album("Vuco 4", "Vuco", 2005), New Album("Nevermind", "Nirvana", 1991)}
'        Dim alb As Album = New Album("Danijela", "Mart", 2005)


'    End Sub
'End Module





'Module Program

'    Public Class Artikl

'        Private _naziv As String
'        Private _cijena As Double

'        Public Sub New(naziv As String, cijena As Double)

'            Me._naziv = naziv
'            Me._cijena = cijena

'        End Sub

'        Public Property Naziv() As String
'            Get
'                Return Me._naziv
'            End Get
'            Set(value As String)
'                Me._naziv = value
'            End Set
'        End Property

'        Public Property Cijena() As Double
'            Get
'                Return Me._cijena
'            End Get
'            Set(value As Double)
'                Me._cijena = value
'            End Set
'        End Property

'    End Class



'    Public Class Knjiga

'        Inherits Artikl
'        Private _autor As String

'        Public Sub New(naziv As String, cijena As Double, autor As String)

'            MyBase.New(naziv, cijena)
'            Me._autor = autor

'        End Sub

'        Public Property Autor() As String
'            Get
'                Return Me._autor
'            End Get
'            Set(value As String)
'                Me._autor = value
'            End Set
'        End Property

'    End Class




'    Sub main()

'        Dim niz As Artikl() = New Artikl(2) {New Artikl("banana", 1.97), New Artikl("kruh", 1.47), New Knjiga("Preobražaj", 9, "Kafka")}


'    End Sub
'End Module






'Module Program

'    Public Class Krug

'        Private _radius As Double

'        Public Sub New(r As Double)
'            Me._radius = r
'        End Sub

'        Public Property Radius() As Double
'            Get

'                Return Me._radius
'            End Get
'            Set(value As Double)
'                If value > 0 Then
'                    Me._radius = value
'                Else
'                    Console.WriteLine("Radijus ne može bit negativan!")
'                End If
'            End Set
'        End Property

'        Public Function Area() As Double
'            Return Me._radius * Me._radius * Math.PI
'        End Function

'    End Class

'    Sub main()

'        Dim kr As Krug = New Krug(4)
'        kr.Radius() = 2

'        Console.WriteLine(kr.Area)
'    End Sub
'End Module





'Module Program

'    Public Class Referenca

'        Private _recenica As String

'        Public Sub New(recenica As String)
'            Me._recenica = recenica
'        End Sub

'        Public ReadOnly Property Duljina() As Integer
'            Get
'                Return Me._recenica.Length
'            End Get
'        End Property

'        Public Function Promijeni(orig As Char, novi As Char) As String

'            Me._recenica = Me._recenica.Replace(orig, novi)

'            Return Me._recenica
'        End Function

'    End Class

'    Sub main()

'        Dim rec As Referenca = New Referenca("Hajduk Živi Vjeèno")

'        Console.WriteLine($"Recenica duljine {rec.Duljina()} znakova glasi {rec.Promijeni("i"c, "b"c)}")

'    End Sub
'End Module




'Module Program

'    Public Class Kvadar

'        Private _a As Integer
'        Private _b As Integer
'        Private _c As Integer

'        Public Sub New(a As Integer, b As Integer, c As Integer)
'            Me._a = a
'            Me._b = b
'            Me._c = c
'        End Sub

'        Public Function Volumen() As Integer
'            Return Me._a * Me._b * Me._c
'        End Function

'    End Class

'    Public Class Kocka
'        Inherits Kvadar

'        Public Sub New(a As Integer)
'            MyBase.New(a, a, a)
'        End Sub

'    End Class

'    Sub main()

'        Dim kvad As Kvadar = New Kvadar(4, 5, 6)
'        Dim koc As Kocka = New Kocka(5)

'        Console.WriteLine($"kvadar: {kvad.Volumen}     kocka: {koc.Volumen}")

'    End Sub
'End Module








'Module drugi
'    Public Class Album
'        Private _naziv As String
'        Private _izvodac As String
'        Private _godina As Integer
'        Public Property Naziv() As String
'            Get
'                Return Me._naziv
'            End Get
'            Set(value As String)
'                Me._naziv = value
'            End Set
'        End Property
'        Public Property Izvodac() As String
'            Get
'                Return Me._izvodac
'            End Get
'            Set(value As String)
'                Me._izvodac = value
'            End Set
'        End Property
'        Public Property Godina() As Integer
'            Get
'                Return Me._godina
'            End Get
'            Set(value As Integer)
'                Me._godina = value
'            End Set
'        End Property
'        Public Sub New(a As String, b As String, c As Integer)
'            Me.Naziv = a
'            Me.Izvodac = b
'            Me.Godina = c
'        End Sub

'    End Class
'    Sub main()
'        Dim alb As Album = New Album(Console.ReadLine(), Console.ReadLine(), Console.ReadLine())

'    End Sub
'End Module