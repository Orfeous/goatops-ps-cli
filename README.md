# goatops-ps-cli

Powershell script picking wisdoms from [GoatOps](https://goatops.com) 

https://github.com/binford2k/goatops

### Usage

#### Run as script

```
PS> .\goatops.ps1 -Run
    -------------------------------------------------------------------
    <[ Goats don't have a particular preference between Java and C#. ]>
    -------------------------------------------------------------------
            \
             \
              )__(
             '|oo|'________/
              |__|         |
               V ||"""""""||
                 ||       ||

```

#### Dot source it and use it as a function

```powershell
# Example backup script
try {
    ....
} catch {
    . C:\scripts\goatops.ps1
    $goatWisdom = Get-GoatWisdom;
    Write-Output "Backups failed...`n${goatWisdom}";
};
```

```
PS> .\backup.ps1
Backups failed...
    -----------------------------------------------------------------------------------------                      
    <[ Nobody can go through your goat and get you in trouble for what they find in there. ]>
    -----------------------------------------------------------------------------------------
            \
             \
              )__(
             '|oo|'________/
              |__|         |
               V ||"""""""||
                 ||       ||

```