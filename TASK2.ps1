#1 Identify a cmdlet that produces a random number.
Get-Command *random*
Get-Random
 NOTE:- It is producing 8/9/10 digits random numbers


#2 Identify a cmdlet that displays the current dat and time

Get-Command *date*
Get-Command -Noun date
Get-Date

#3 What type of object the cmdlet from task 2 Produce?

Get-Date| gm
#ANS:System.dateTime

#4 Identify the cmdlet that displays information about installed hotfixes on windows

Get-ComputerInfo
Get-ComputerInfo -Property oshotfixes

#5 Display a list of 50 newest entries from security log.

Get-EventLog -LogName Security -Newest 50
