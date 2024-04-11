<?php

function convertir_num_a_array(int $num): array
{
  $array = array_map('intval', str_split($num));
  return $array;
}

function sumar_array(array $array): int
{
  $calculo = array_sum($array);
  if ($calculo > 9) {
    return intval(strval($calculo)[0]);
  }
  return $calculo;
}

function procesar_numero(int $num): string
{
  $array_numero = convertir_num_a_array($num);
  $reduccion = sumar_array($array_numero);

  return match ($reduccion) {
    0 => "Tot",
    1 => "Individualitat",
    2 => "Dualitat",
    3 => "Raó",
    4 => "Estabilitat",
    5 => "Amor",
    6 => "Destrucció",
    7 => "Saviessa",
    8 => "Poder",
    9 => "Generositat",
    default => "Error",
  };
}

$array_numero_1 = [1, 3];
$array_numero_2 = [1, 7, 2];

echo procesar_numero(172);
