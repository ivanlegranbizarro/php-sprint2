<?php

/* Kata 34 per l'especialitat fullstackPHP 25-4-24

Estem creant part de la lògica d'un videojoc de rol-acció i, per això necessitem programar els tipus de jugador que podrem tenir. Qualsevol jugador té un nickname, una posició horitzontal(x) i una altra vertical(y). Les posicions es representen per nombres entre el 0 i el 9. Cada jugador es pot moure en una d'aquestes 4 direccions:

A dalt
A baix
Esquerra
Dreta Per exemple, si tinc un jugador a la posició (0,0) i : • Li dic que es mogui a la dreta passa a estar a la posició (0,1) • Si després li dic que es mogui a l’esquerra passa a estar a la posició (0,0) • Si li dic després que vagi cap a baix em retornarà un missatge d’error, ja que no pot anar més a baix. Per tant, hem de mostrar un error sempre que no puguem fer aquest moviment.
A més, tenim que cada jugador pot ser d’una d’aquestes 3 classes (Guerrer, Mag,Arquer).

Els guerrers tenen una arma de dues mans (representada per un nom) i poden atacar amb ella. A més, els guerrers poden córrer, el qual els fa avançar de dues posicions en dues posicions en la direcció escollida(en lloc d’una).
Els mags tenen nombrosos encanteris que poden realitzar indicant quin és l’encanteri a fer. Dels encanteris només coneixem el nom.
Finalment, els arquers tenen un arc (representat per un nom) i un nombre de fletxes. Poden, a més, disparar, perdent una fletxa cada cop. Si ens quedem sense fletxes no podrem disparar. */




abstract class Jugador
{


  public function __construct(
    public string $nickname,
    public int $x = 0,
    public int $y = 0
  ) {
  }

  public function pedirOrden(int $movimiento = 1)
  //TODO Parametrizar los límites en la función movimiento para que no choquen con la suma de furiaBerseker
  {
    $instruccion = readline("Introduce la dirección hacia la que te quieres mover ('d' para derecha, 'i' para izquierda, 'a' para arriba, 'p' para abajo): ");

    switch ($instruccion) {
      case 'd':
        if ($this->x < 9) {
          $this->x += $movimiento;
        } else {
          echo "No puedes moverte más a la derecha.\n";
        }
        break;

      case 'i':
        if ($this->x > 0) {
          $this->x -= $movimiento;
        } else {
          echo "No puedes moverte más a la izquierda.\n";
        }
        break;

      case 'a':
        if ($this->y < 9) {
          $this->y += $movimiento;
        } else {
          echo "No puedes moverte más hacia arriba.\n";
        }
        break;

      case 'p':
        if ($this->y > 0) {
          $this->y -= $movimiento;
        } else {
          echo "No puedes moverte más hacia abajo.\n";
        }
        break;

      default:
        echo "Introduce un valor correcto ('d', 'i', 'a', 'p').\n";
        break;
    }
  }
}


class Guerrero extends Jugador
{

  public function __construct(
    public string $nickname,
    public string $armaDosManos
  ) {
  }

  public function furiaBerseker()
  {
    $this->pedirOrden(2);
  }

  public function __toString(): string
  {
    return "Este guerrero se llama $this->nickname";
  }
}

class Mago extends Jugador
{
}

echo $guerrero = new Guerrero('Pepe Hostias', 'Espadón');
