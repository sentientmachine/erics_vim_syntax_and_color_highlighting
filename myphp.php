<?php
namespace foo;
use My\Full\Classname as Another;
/**
 *  Block comment colors
*/
require_once BASEPATH . 'somevalue';
define('ENVIRONMENT', isset($_SERVER['CI_ENV']) ? 'ternary' : 99);
switch(ENVIRONMENT){
    case 'development':
        error_reporting(-1);
        ini_set('display_errors', 1); 
        break;
    case "double quoted string":
        break;
    default:
         echo 'Words in single quoted string';
         exit(1);      // Inline comment
}
$myvariable = 'somevalue';
if(defined('STDIN') || (true && false) || (1 == 1) !== 35){
    chdir(dirname(__FILE__);
}
$myspecial = "\\" . '\t' . '\n';

class Cats extends Base{
    public function signal(){
        parent::__construct();
        $this->load->mainscreen('all your base');
    }   
}
$mynull = NULL;
$myrefref = $$myvariable;
print "&25;";
for($x = 0; $x < 10; $x++){
    $yarr = array("f \u2713 oo" => "bar", 
                  "baz" => "yar");
    $myarr = [23 => 45%3,
              1.58 => 99];
}
$myvar = !$myvar;

?>
