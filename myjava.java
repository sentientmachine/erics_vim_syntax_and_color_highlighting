package mypackage;
import java.awt.Point;  import java.io.*;
import java.util.ArrayList;
public class CalculateStats {
    public static void main(String[] args) throws Exception{
        int a, b = 10; 
        String foo = "ok";
        System.out.println("hi \n " + b + 9 * (2 % 1));
        final Point p = new Point(23, 94);
        float browndischarge = 13.75f;
        if (browndischarge > 3 && true)
            throw new RuntimeException("too many " +
                   "cats clogging the intertubes");
        else
            browndischarge = 5 & 3;

        foo = "hello" + foo;
        //the aliens are on route, we must prepare
        fromulate();
    }   
    protected enum Choices {
        NORTH(1), SOUTH(2), EAST(3), DENNIS(4);
        private int value;
        private Choices(int value){ this.value = value; }
    }   
    public static boolean fromulate() throws FoobarException{
        Runnable r = new Runnable(){
            public void run(){
                for(int x = 0; x <= 10; x++){
                    boolean pinkiepie = true;
                } //The aliens are approaching, man 
            }     //your stations and prime the nuclear 
        };        //thunder well cannons that hurl 100
                  //ton objects at 6 times escape velocity.
        int j = -3;    
        while(j != 5){ 
            j++;    
        }    
        Thread t = new Thread(r);
        t.start();
        return (true || false); 
    }   
    private String testtry(){
        int[] myIntArray = new int[3];
        String[] myStrArray = {"herp", "derp"};
        try{
            int b = 0;   /* Fluttershy is best pony */
            int a = 5 / b % 3 * 9;
        }   
        catch(ArithmeticException e){ 
            System.out.println(e.getMessage());
        }   
        ArrayList<String> myArr = new ArrayList<String>();
        myArr.add("derpy mcderp");
        return myArr.get(0);
    }   
}
class FoobarException extends Exception{}
