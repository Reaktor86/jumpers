<?php


namespace Jumpers;

class Db
{

    private static $instances = [];
    protected $db = null;
    protected function __clone() { }

    public function __wakeup()
    {
        throw new \Exception("Cannot unserialize singleton");
    }

    public static function getInstance(): Db
    {
        $subclass = static::class;
        if (!isset(self::$instances[$subclass])) {
            self::$instances[$subclass] = new static();
        }
        return self::$instances[$subclass];
    }

    protected function __construct()
    {
        //$dbData = require($_SERVER['DOCUMENT_ROOT'] . '/ENV.php');
        //$this->db = new \mysqli("localhost", "root", "AXqH8TwF", "jumpers");
        $this->db = new \mysqli("localhost", "mysql", "mysql", "jumpers");
        $this->db->query("SET NAMES 'utf8'");
        $this->db->query('SET collation_connection = "utf8_unicode_ci"');
        //$this->db = new \mysqli("localhost", $dbData['user'], "mysql", "jumpers");
        //file_put_contents('log.txt', date("Y-m-d H:i:s") . " создан экземпляр db\n", FILE_APPEND);
    }

    public static function query($string)
    {
        $instance = static::getInstance();
        return $instance->db->query($string);
    }
}
