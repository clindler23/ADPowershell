#Imports Users data from CSV update -path to meet your needs.
$Users = Import-Csv -Path "C:\users\Administrator\NewJoin.csv"

#creates new OU not needed if OU already exist.
New-ADOrganizationalUnit STUDENTS -ProtectedFromAccidentalDeletion $false
#loops thru Users 
foreach ($User in $Users) {

$username = $user.SamAccountname

if (Get-ADUser -f{samaccountname -eq $username}) {
Write-Warning "A user with the $username already exist"
}
else
{
    $userprops =@{
        SamAccountName = $user.SamAccountname
        AccountPassword = (ConvertTo-SecureString $User.AccountPassword -AsPlainText -Force)
        path = $user.Path
        GivenName = $User.GivenName
        Surname = $user.Surname
        Name = $User.Name
        displayName = $User.DisplayName
        userPrincipalName = $User.GivenName + "@adatum.com"
        Enabled = $true
    }
        New-ADUser @userprops    }

}