<?php

namespace Anime;

class Sano extends Tokyo
{
    use Greet;

    private $subject;

    public function __construct($name, $age, $subject)
    {
        parent::__construct($name, $age);
        $this->subject = $subject;
    }

    public function summonCursedSpirit()
    {
        return $this->greet() . "Saya seorang atlet $this->name, $this->age tahun, kekuatan terbesar saya ada di $this->subject.";
    }
}
