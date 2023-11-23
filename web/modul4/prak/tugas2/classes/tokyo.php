<?php

namespace Anime;

abstract class Tokyo
{
    protected $name;
    protected $age;

    abstract public function summonCursedSpirit();

    public function __construct($name, $age)
    {
        $this->name = $name;
        $this->age = $age;
    }
}
