""" Kata 33 per l'especialitat fullstackPHP 11-4-24

Ens ha abduït una secta numerològica. Per deixar-nos sortir ens han demanat que els fem un programa per ajudar-los en les seves ambicions.

Hem de fer un programa que, donat un número enter positiu ens digui el seu significat. Per això haurem de:

Reduir el número a una xifra mitjançant la suma recurrent de les seves xifres. Per exemple: Si tenim un 13, la seva reducció és 4; si tenim 172, la reducció és 1.

Retornar el seu "significat" corresponent seguint aquesta relació:

0, el tot.
1, individualitat.
2, dualitat.
3, raó.
4, estabilitat.
5, amor.
6, destrucció.
7, saviessa.
8, poder.
9, generositat.
Exemples:

Input

123
542
Output

Destrucció
Dualitat
Nota: El mentor/a no té ni idea de numerologia per tant, no us ho preneu a la valenta :) """


def convertir_num_a_array(num: int) -> list:
  return [int(x) for x in str(num)]


def sumar_array(array: list) -> int:
  calculo = sum(array)
  if calculo > 9:
    return int(str(calculo)[0])
  return calculo

def procesar_numero (num: int) -> str:
    array_numero = convertir_num_a_array(num)
    reduccion = sumar_array(array_numero)

    match reduccion:
        case 0:
            return "Tot"
        case 1:
            return "Individualitat"
        case 2:
            return "Dualitat"
        case 3:
            return "Raó"
        case 4:
            return "Estabilitat"
        case 5:
            return "Amor"
        case 6:
            return "Destrucció"
        case 7:
            return "Saviessa"
        case 8:
            return "Poder"
        case 9:
            return "Generositat"




array_numero_1= [1,3]
array_numero_2= [1,7,2]


print(procesar_numero(172))
