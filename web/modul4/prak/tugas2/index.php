<?php

include "classes/izana.php";
include "classes/sano.php";

use Anime\Sano;
use Anime\Izana;

$izana = new Izana("Izana Kurokawa", 18, "Pukulan");
echo $izana->summonCursedSpirit() . PHP_EOL;

$sano = new Sano("Sano Manjiro", 14, "Tendangan");
echo $sano->summonCursedSpirit() . PHP_EOL;
