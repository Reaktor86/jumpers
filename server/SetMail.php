<?php


namespace Jumpers;


class SetMail
{
    protected $mailLogin = 'jumpersgame';
    protected $mailFull = 'jumpersgame@mail.ru';
    protected $mailPass = 'ARu1YjA2';

    public function getMailParams()
    {
        return ['mailLogin' => $this->mailLogin, 'mailFull' => $this->mailFull, 'mailPass' => $this->mailPass];
    }
}