<?php

namespace Anime;

include "classes/tokyo.php";
include "traits/greet.php";

class Izana extends Tokyo
{
    use Greet;

    private $cursedTechnique;

    public function __construct($name, $age, $cursedTechnique)
    {
        parent::__construct($name, $age);
        $this->cursedTechnique = $cursedTechnique;
    }

    public function summonCursedSpirit()
    {
        return $this->greet() . "saya seorang atlet yang bernama $this->name, $this->age tahun, kekuatan terbesar saya ada di $this->cursedTechnique.";
    }
}
