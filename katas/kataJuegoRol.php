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
  {
    $instruccion = readline("Introduce la dirección hacia la que te quieres mover ('d' para derecha, 'i' para izquierda, 'a' para arriba, 'p' para abajo): ");

    switch ($instruccion) {
      case 'd':
        if ($this->x + $movimiento >= 9) {
          $this->x += $movimiento;
        } else {
          echo "No puedes moverte más a la derecha.\n";
        }
        break;

      case 'i':
        if ($this->x - $movimiento <= 0) {
          $this->x -= $movimiento;
        } else {
          echo "No puedes moverte más a la izquierda.\n";
        }
        break;

      case 'a':
        if ($this->y + $movimiento <= 9) {
          $this->y += $movimiento;
        } else {
          echo "No puedes moverte más hacia arriba.\n";
        }
        break;

      case 'p':
        if ($this->y - $movimiento >= 0) {
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

  public function __toString(): string
  {
    return "Este jugador se llama $this->nickname";
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
}

class Mago extends Jugador
{
  public function __construct(
    public string $nickname,
    public array $hechizos
  ) {
  }

  public function teRevientoConMiHechizo(string $hechizo): string
  {
    if (in_array($hechizo, $this->hechizos)) {
      return "Te voy a reventar con $hechizo";
    }
    return 'El mago aún no ha aprendido ese hechizo';
  }
}

class Arquero extends Jugador
{

  public static int $flechas = 100;

  public function __construct(
    public string $nickname,
    public string $arco
  ) {
  }

  public function dispararFlecha(): string
  {
    if (self::$flechas >= 1) {
      self::$flechas -= 1;
      return "Te disparo con mi arco $this->arco";
    }
    return 'No me quedan flechas para matarte, pérfido';
  }
}
echo $guerrero = new Guerrero('Pepe Hostias', 'Espadón');

echo $mago = new Mago('El Mágico Topo Giggio', ['¡Te ratonifico', 'Te vas a enterar, bastardo!']);

echo $arquero = new Arquero('Parafino', 'Asaetador Mortífero');
