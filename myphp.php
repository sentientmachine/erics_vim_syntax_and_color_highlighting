<?php     namespace foo; 
use My\Full\Classname as Another; 
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
    #superfluous spaces above 
}                   $this_is_okay_and_1234_is_null=NULL; 
$myrefref = $$myvariable; 
print "&25;";    for($x = 0; $x < 10; $x++){ 
    $yarr = array("f \u2713 oo" => "bar",  
                  "baz" => "yar"); 
    $myarr = [23 => 45%3, 
              1.58 => 99];        }     //misplaced right curly brace notwithstanding 
$myvar = !$myvar; 
/** PHP variables must have dollarsigns unless they are constants  
*Variables without dollarsigns are constants and should be dark blue bold like python longs. 
Variables that have dollarsigns are normal php variables and should be bold orange  */ 
$foobar_normal_variable = 8;  
echo $normal_foobar_orange; 
define("foobargreeting", "https://www.youtube.com/watch?v=zaiSlYBjdgs"); 
echo foobargreeting; 
echo foobargreeting . "whatever"; 
echo "whatever" . foobargreeting; 
echo "whatever" . foobargreeting . "whatever"; 
echo 'whatever' . foobargreeting . ' words whatever'; 
echo 'whatever words ' . foobargreeting; 
echo "whatever word inside " . foobargreeting . " word inside $blah whatever"; 
echo "two constants in this line: " . foobargreeting . " word " . foobargreeting; 
if (foobargreeting == 7){     }   
elseif (9 == foobargreeting){   //this should not be blue 
} 
while (foobargreeting < $foobar) { 
    echo $i++; 
}; // comment notwithstanding 
do {        echo $i++; 
} while ($foobar === foobargreeting); // Superfluous commentary "01234" notwithstanding 
do {   echo $i++; 
} while (foobargreeting < 5); # Prints "01234" 
for ($x = 0; $x < 10; $x++) { 
    echo $x; 
} // Prints "0123456789" 
echo "\n"; 
$wheels = ['bicycle' => 2, 'car' => 4]; 
// Foreach loops can iterate over arrays 
foreach ($wheels as $wheel_count) { 
}
