#Reads list of role codes (an AD group) from a .txt file and displays member's name, username, department, and title. It then exports it as a .txt file.

function ExportMembersFromFile() {
    #Specify which txt file to read the codes from. One code per line.
    $MLC_Codes = Get-Content "C:\Users\60071\OneDrive - SMSC Gaming Enterprise\Projects\PowerShell\mlc_codes1.txt"
    #Specify text file output below
    $logFile = "$pwd\Non_IT_Members.txt"
    
    #Loop through each line and print it in a text file
    foreach ($MLC_Code in $MLC_Codes) {
        "`n$MLC_Code`:" | Out-File $logFile -Append
        Get-ADGroupMember -Identity $MLC_Code -Recursive | Get-ADUser -Properties DisplayName,Department,Title | Select-Object DisplayName,SAMAccountName,Department,Title | Sort-Object DisplayName | Out-File $logFile -Append
    } 
    
    
}

#Execute function:
ExportMembersFromFile

