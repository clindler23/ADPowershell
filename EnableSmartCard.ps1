Get-ADUser -Filter 'Name -like "*"' -SearchBase 'OU=IT,DC=adatum,DC=COM' -Properties DisplayName | 
% {Set-ADUser $_ -SmartcardLogonRequired $true}