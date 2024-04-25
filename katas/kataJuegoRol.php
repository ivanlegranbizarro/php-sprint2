<?php

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
