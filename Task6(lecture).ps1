


#import computer csv file

$computers=import-csv C:\computer.csv

#import service csv file

$services = import-csv C:\services.csv

#connect to one computer

foreach($comp in $computers)

{
    $username = $comp.username
    $password = $comp.password | ConvertTo-SecureString -AsPlainText -Force

    $credential = New-Object -TypeName System.Management.Automation.PSCredential $username,$password

    
    
        test-connection -ComputerName $comp.computername -ErrorVariable EV -ErrorAction SilentlyContinue -Count 1 |out-null

        If($EV -ne $null)
        {
            "not able to reach to $($comp.computername)" | out-file C:\error.log -Append
        
        }
        else
        {
            $pssessionoption = New-PSSessionOption -SkipCACheck -SkipCNCheck -SkipRevocationCheck




             $compcompliancestatus=Invoke-Command -ComputerName $comp.computername -Credential $credential -Port 5986 -UseSSL -SessionOption $pssessionoption -ScriptBlock {
        
               $serviceoutput= $using:services | select @(@{l="name";e={$_.servicename}}) |  Get-Service | ?{$_.status -eq "Running"} | select name
              
               $servicecount = $serviceoutput | Measure-Object

               if( $servicecount.count -gt 0)
               {
                    $compliancestatus ="Noncompliance"
               
               }
               else
               {
                       $compliancestatus ="compliance"
               
               }
        
                # check the status of service


                #if any of the services status is running , then noncompliance 
             
                $noncompliance = [pscustomobject]@{computername=$env:computername;compstatus=$compliancestatus;services=$serviceoutput}
             
                
             $noncompliance
             
            

             }

           
           
           $compcompliancestatus  | Export-Csv C:\computercompliancestatus.csv -Append
        
        
        }

  

}




#output 

#TYPE Deserialized.System.Management.Automation.PSCustomObject
"computername","compstatus","services","PSComputerName","RunspaceId","PSShowComputerName"
"COMP1","Noncompliance","@{Name=BITS}","comp1","a25d2445-2a8c-444b-94b3-b462f933f901","True"
"COMP1","Noncompliance","@{Name=Netlogon}","comp1","a25d2445-2a8c-444b-94b3-b462f933f901","True"
"COMP2","Noncompliance","@{Name=BITS}","comp2","4bccae80-1380-46bf-b3e3-363fe6765056","True"
"COMP2","Noncompliance","@{Name=Netlogon}","comp2","4bccae80-1380-46bf-b3e3-363fe6765056","True"
