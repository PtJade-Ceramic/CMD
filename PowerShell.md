# PowerShell
## Installation of Windows
See [Microsoft webpage](https://www.microsoft.com/windows/windows-11?ocid=cmmjr61s3k2#pchealthcheck) for the installation of Windows.
## Installation of PowerShell
### Ways
See the [documentation](https://learn.microsoft.com/powershell/scripting/install/install-powershell).

PowerShell is installed by default on every Windows, starting with Windows 7 SP1 and Windows Server 2008 R2 SP1[^Wheeler,%202022].

[^Wheeler,%202022]: WHEELER, Sean [[GitHub](https://github.com) Account at: https://github.com/sdwheeler]. *Installing Windows PowerShell*. 2022-10-25. Web page [Online, HTML]. Microsoft Learn, https://learn.microsoft.com/previous-versions/powershell/scripting/windows-powershell/install/installing-windows-powershell.
> [!CAUTION]
> The user can't fix an instance of this program on Windows by installing one in a way different from how the one to fix is installed because neither of them is equivalent.
## Start of PowerShell
### General
See the [documentation](https://learn.microsoft.com/powershell/scripting/windows-powershell/starting-windows-powershell).
### [Windows PowerShell][Windows PowerShell] in Windows Terminal
See the [documentation](https://learn.microsoft.com/windows/terminal/install#set-your-default-terminal-application) to set Windows Terminal as the default application running Windows PowerShell.

See the [documemtation](https://learn.microsoft.com/windows/terminal/faq#----windows-------------shell) to start Windows PowerShell in Windows Terminal.
### [Windows PowerShell][Windows PowerShell] running as administrator
See the [documenttion](https://learn.microsoft.com/powershell/scripting/learn/ps101/01-getting-started#where-to-find-powershell) on starting PowerShell.

Enter the following command in a restricted PowerShell instance to start a new instance as administrator:
```powershell
Start-Process powershell -Verb RunAs
```
See the [documentation](https://learn.microsoft.com/powershell/scripting/windows-powershell/starting-windows-powershell#powershell-binary-name) for the binary name of your desired version.
## Help
### General
See the [documentation](https://learn.microsoft.com/powershell/scripting/learn/ps101/02-help-system).

Enter the following command to see the introduction of **Windows PowerShell Help System**.
```powershell
Get-Help
```
The following output has been shortened:
```output
...

LONG DESCRIPTION
    ...

    Windows PowerShell does not include help files, but you can read the
    help topics online, or use the Update-Help cmdlet to download help files
    to your computer and then use the Get-Help cmdlet to display the help
    topics at the command line.

    You can also use the Update-Help cmdlet to download updated help files
    as they are released so that your local help content is never obsolete.

    ...

  ONLINE HELP
    You can find help for Windows PowerShell online in the TechNet Library
    beginning at http://go.microsoft.com/fwlink/?LinkID=108518.

    To open online help for any cmdlet or function, type:

        Get-Help <cmdlet-name> -Online

  UPDATE-HELP
    To download and install help files on your computer:

       1. Start Windows PowerShell with the "Run as administrator" option.
       2. Type:

          Update-Help

    ...

    For more information about the Update-Help cmdlet, type:

       Get-Help Update-Help -Online

    or go to: http://go.microsoft.com/fwlink/?LinkID=210614


  GET-HELP
    ...

    To get help for a cmdlet, type:

        Get-Help <cmdlet-name>

    To get online help, type:

        Get-Help <cmdlet-name> -Online

    The titles of conceptual topics begin with "About_".
    To get help for a concept or language element, type:

        Get-Help About_<topic-name>

    To search for a word or phrase in all help files, type:

        Get-Help <search-term>

    For more information about the Get-Help cmdlet, type:

        Get-Help Get-Help -Online

    or go to: http://go.microsoft.com/fwlink/?LinkID=113316


  EXAMPLES:
      Save-Help              : Download help files from the Internet and saves
                               them on a file share.
      Update-Help            : Downloads and installs help files from the
                               Internet or a file share.
      Get-Help Get-Process   : Displays help about the Get-Process cmdlet.
      Get-Help Get-Process -Online
                             : Opens online help for the Get-Process cmdlet.
      Help Get-Process       : Displays help about Get-Process one page at a time.
      Get-Process -?         : Displays help about the Get-Process cmdlet.
      Get-Help About_Modules : Displays help about Windows PowerShell modules.
      Get-Help remoting      : Searches the help topics for the word "remoting."

  SEE ALSO:
      about_Updatable_Help
      Get-Help
      Save-Help
      Update-Help
```
```powershell
Get-Help Get-Help -Online
```
Enter the following command to download help files:
```powershell
Start-Process powershell -ArgumentList Update-Help -Verb RunAs
```
```powershell
Get-Help Get-Help
```
The output is to long to read. Enter the following command to see what you can do with it (see the [documentation](https://learn.microsoft.com/powershell/scripting/learn/ps101/03-discovering-objects) for more information):
```powershell
Get-Help Get-Help | Get-Member
```
```output
   TypeName: MamlCommandHelpInfo#Microsoft.PowerShell.Core#Get-Help

Name          MemberType   Definition
----          ----------   ----------
Equals        Method       bool Equals(System.Object obj)
GetHashCode   Method       int GetHashCode()
GetType       Method       type GetType()
ToString      Method       string ToString()
alertSet      NoteProperty MamlCommandHelpInfo#alertSet alertSet=@{alert=System.Management.Automation.PSObject[]}
Category      NoteProperty string Category=Cmdlet
Component     NoteProperty object Component=null
description   NoteProperty psobject[] description=System.Management.Automation.PSObject[]
details       NoteProperty MamlCommandHelpInfo#details details=@{description=System.Management.Automation.PSObject[]; verb=Get; n...
examples      NoteProperty MamlCommandHelpInfo#examples examples=@{example=System.Management.Automation.PSObject[]}
Functionality NoteProperty object Functionality=null
inputTypes    NoteProperty MamlCommandHelpInfo#inputTypes inputTypes=@{inputType=@{type=@{name=None}; description=System.Manageme...
ModuleName    NoteProperty string ModuleName=Microsoft.PowerShell.Core
Name          NoteProperty string Name=Get-Help
parameters    NoteProperty MamlCommandHelpInfo#parameters parameters=@{parameter=System.Management.Automation.PSObject[]}
PSSnapIn      NoteProperty PSSnapInInfo PSSnapIn=Microsoft.PowerShell.Core
relatedLinks  NoteProperty MamlCommandHelpInfo#relatedLinks relatedLinks=@{navigationLink=System.Management.Automation.PSObject[]}
returnValues  NoteProperty MamlCommandHelpInfo#returnValues returnValues=@{returnValue=System.Management.Automation.PSObject[]}
Role          NoteProperty object Role=null
Synopsis      NoteProperty string Synopsis=Displays information about PowerShell commands and concepts.
syntax        NoteProperty MamlCommandHelpInfo#syntax syntax=@{syntaxItem=System.Management.Automation.PSObject[]}
```
```powershell
(Get-Help Get-Help).GetType()
```
```output
IsPublic IsSerial Name                                     BaseType
-------- -------- ----                                     --------
True     False    PSCustomObject                           System.Object
```
```powershell
(Get-Help Get-Help).GetType() | Get-Member
```
The following output has been shortened:
```output
   TypeName: System.RuntimeType

Name                           MemberType Definition
...                            ...        ...
FullName                       Property   string FullName {get;}
```
```powershell
(Get-Help Get-Help).GetType().FullName
```
```
System.Management.Automation.PSCustomObject
```
### Filter help output
There are too many members of the output of `Get-Help Get-Help`, whose `MemberType`s can be collected by the following command (see the [documentation](https://learn.microsoft.com/powershell/scripting/learn/ps101/03-discovering-objects#properties) for more information):
```powershell
Get-Help Get-Help | Get-Member | Select-Object MemberType -Unique
```
Enter the following command to see the NoteProperties of the members of the output of `Get-Help Get-Help` only:
```powershell
Get-Help Get-Help | Get-Member | Where-Object MemberType -EQ 'NoteProperty' | Select-Object Name, Definition
```
Enter commands like the following to view those NoteProperties of the members of the output of `Get-Help Get-Help` in which you are interested only:
```powershell
(Get-Help Get-Help).Name
```
```powershell
(Get-Help Get-Help).Synopsis
```
```powershell
(Get-Help Get-Help).Description
```
```powershell
(Get-Help Get-Help).Examples
```
### Parameters
#### General
```powershell
(Get-Help Get-Help).Parameters
```
There is a global indentation in the format of the output. Have a look at what we can do with it:
```powershell
(Get-Help Get-Help).Parameters | Get-Member
```
The following output has been shortened:
```output
...
Name        MemberType   Definition
----        ----------   ----------
...
parameter   NoteProperty psobject[] parameter=System.Management.Automation.PSObject[]
```
View that property and you can find that the global indentation disapears:
```powershell
(Get-Help Get-Help).Parameters.Parameter
```
The output is still too long to read. Enter commands like the following to filter information for those parameters in which you are interested (see the [documentation](https://learn.microsoft.com/powershell/scripting/learn/ps101/04-pipelines?) for more information):
```powershell
(Get-Help Get-Help).Parameters.Parameter | Where-Object Name -eq 'Name'
```
```powershell
(Get-Help Get-Help).Parameters.Parameter | Where-Object Name -EQ 'Parameter'
```
Enter the following command to see more information:
```powershell
Get-Help about_Parameters
```
#### Compared to pipelines
See the [issue](https://github.com/PowerShell/PowerShell/issues/4242).
### Syntax
Enter the following command to see `Get-Help`'s syntax diagram (or see the [documentation](https://learn.microsoft.com/powershell/module/microsoft.powershell.core/get-help#syntax)):
```powershell
(Get-Help Get-Help).Syntax
```
The output is nearly the same as the following command (see the [documentation](https://learn.microsoft.com/powershell/module/microsoft.powershell.core/about/about_command_syntax?view=powershell-7.5#get-command) for more information):
```powershell
Get-Command Get-Help -Syntax
```
## Explore PowerShell
See the [documentation](https://learn.microsoft.com/powershell/scripting/discover-powershell?view=powershell-7.5#using-cmdlets-to-explore-powershell).
## Troubleshooting
### When to do this
[Windows PowerShell][Windows PowerShell][^Wheeler,%202022] can be broken or uninstalled if unable to run. Do as listed in this clause to repair it.
### Install a newer version
[Installing](https://learn.microsoft.com/powershell/scripting/install/install-powershell-on-windows) a [newer version](https://aka.ms/PSWindows) as an alternative may also repair the old one automatically. If Windows PowerShell cannot run yet, you can also enter commands in the newer version to repair the old one.
### Repair [Windows PowerShell][Windows PowerShell] by entering commands in the newly installed PowerShell
1. Enter the following commands [to keep the Windows local image's integrity](http://go.microsoft.com/fwlink/?LinkId=243077):
   ```powershell
   Start-Process pwsh.exe -ArgumentList '-NoExit', '-Command', @'
   Repair-WindowsImage -CheckHealth -Online
   Repair-WindowsImage -ScanHealth -Online
   Repair-WindowsImage -RestoreHealth -Online
   '@ -Verb RunAs
   ```
> [!TIP]
> This step is necessary if the user isn't sure about the the Windows local image's intigrity.
2. Enter the following command [to verify the integrity](https://learn.microsoft.com/windows-server/administration/windows-commands/sfc) of the [Windows PowerShell][Windows PowerShell]:
   ```cmd
   sfc /verifyfile=%windir%\System32\WindowsPowerShell\v1.0\powershell.exe
   ```
3. Enter the following command [to scan the integrity of the command-line shell to fix and attempt to fix any problems if they're detected](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/sfc), with `<%windir%>`, following the [*Command-Line Syntax Key*][Command-Line Syntax Key], replaced with the absolute directory of the OS:
   - For Command Prompt:
      ```cmd
      sfc /scanfile=<%windir%>\System32\cmd.exe
      ```
   - For [PowerShell][PowerShell]:
      ```cmd
      sfc /scanfile=<%windir%>\System32\WindowsPowerShell\v1.0\powershell.exe
      ```
5. (Optional if not sure on the integrity of the other protected system files) Enter the following command [to scan the integrity of the command-line shell fixed together with all the other protected system files, and fix those with problems if possible](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/sfc):
   ```cmd
   sfc /scannow
   ```
6. (Optional) Start the command-line shell tried to fix to check whether it has been fixed successfully.
### Deletion
> [!CAUTION]
> Neither [PowerShell][PowerShell] built in on Windows nor Command Prompt can be recovered from the [Recycle Bin][recycle] if deleted in the following way. A command-line shell is relied on many processes. Don't do this.

Try [fixing a command-line shell](#fixing) if something is wrong with it.

It is deprecated to delete either of the [command-line shells][command-line shell]. Only as an administrator may the user do this. Such a user should do this in the following steps:

1. Run a command-line shell as an administrator. Such a command shell may be the one to be deleted if it can still run.
2. Go to the location of the [command-line shell][command-line shell] to be deleted.
3. Enter the following command [to enable the administrator to recover access to the command-line shell to be deleted](https://learn.microsoft.com/windows-server/administration/windows-commands/takeown) with `<commandlineshell>`, following the [*Command-Line Syntax Key*][Command-Line Syntax Key], replaced with the [command-line shell][command-line shell] to be deleted:
   ```cmd
   takeown /f <commandlineshell>
   ```
4. Enter the following command [to grant full access to the program](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/icacls) with `<username>`, following the [*Command-Line Syntax Key*][Command-Line Syntax Key], replaced with the username of the administrator:
   ```cmd
   icacls <commandlineshell> /grant <username>:F
   ```
> [!CAUTION]
> The [command-line shell][command-line shell] can't be recovered from the [Recycle Bin][recycle] if deleted.
5. Enter the following command to delete the [desired command-line shell]:
   ```cmd
   del <commandlineshell>
   ```

[install Windows PowerShell]: https://learn.microsoft.com/powershell/scripting/windows-powershell/install/installing-windows-powershell
[command-line shell]: https://learn.microsoft.com/windows-server/administration/windows-commands/windows-commands#command-line-shells
[Windows PowerShell]: https://learn.microsoft.com/powershell/scripting/what-is-windows-powershell