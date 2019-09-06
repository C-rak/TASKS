
==========================================================TASK1==============================================================

class students{
  [string]$fname
  [string]$lname

  [string]Fullname()
  {
  return $($this.fname)*$($this.lname)
  }
  }

  $student1=[students]::new()



$student1.fname="dinesh"
$student1.lname="patil"

$student1.Fullname()

#Task 
#What will be the ouptut for the fulname for the below inputs? & why?


$student1.fname="dinesh"
$student1.lname=3

$student1.Fullname() #OUTPUT for this input will be dinesh*3
                     #REASON :- class students consist property which accept value in string + the fullname method is provide in string format.


$student1.fname=3
$student1.lname="patil"
$student1.Fullname()  #OUTPUT for this input will be 3*dinesh 
                      #Reason:- Class students considt property fname and lname which accept the value in string format



#Whatever content provided for the fname and lname will be considered as string format.
# if we remove quotes of the method fullname provided in the class then if we provide any number instead of the string 
#then it will act as an int so the output will be dineshdineshdisneh as it multiplies the the fnmae to 3times

$student1|gm



==================================================================TASK2==========================================================================



﻿
class calculator
{
     [Int32][ValidateRange(1,10)]$firstnumber =2
    [Int32][ValidateRange(1,10)]$secondnumber =10

  [int]add()
  { return $this.firstnumber+$this.secondnumber}

  [int]Multiply()
  {return $this.firstnumber*$this.secondnumber}

  [int]subtract()
  {return $this.firstnumber-$this.secondnumber}

  [int]Division()
  {return $this.firstnumber/$this.secondnumber}

  [void ]clear()

  {$this.firstnumber=$null
   $this.secondnumber=$null
   }
  
 }

 $calc=New-Object -TypeName calculator
 $calc.add()
 $calc.Division()
 $calc.Multiply()
 $calc.subtract()