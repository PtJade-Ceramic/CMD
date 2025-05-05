# Programming practice — Windows Commands

## Foreword

This document was drafted following the editorial rules of the [ISO/IEC Directives, Part 2](https://www.iso.org/directives) containing modifications, mostly simplification, not specified.

## Introduction

Commands for Windows are derived from MS-DOS 1.0, [code of some of whose later versions has been reopened on GitHub](https://devblogs.microsoft.com/commandline/re-open-sourcing-ms-dos-1-25-and-2-0/).

[PtJade Ceramic][creator] is exercising programming in [commands for Windows][command-line shell]. The code and documentation are in this repository for review and reference.

[The creator][creator]'s goal is to implement an interpreter of the programming language [Brainfuck](https://esolangs.org/wiki/Brainfuck) as a batch file.

[The creator][creator] is not a native English writer, and is willing to listen to criticism on his writing and correct any grammar mistakes.

In a [command-line shell][command-line shell], to run a command:

- Type the command and press Enter; or
- Paste the command followed by a carriage return defined by [ISO/IEC 6429](https://www.iso.org/standard/12782.html).

Some commands can only be run as an administrator. To run them, the user must start another process, also an instance of a [command-line shell][command-line shell], as an administrator if the current one hasn't been run as an administrator by running the following command if the new one is Command Prompt, for example, and PowerShell has been installed:

```
PowerShell -Command "Start-Process cmd.exe -Verb RunAs"
```

## Scope

This repository provides practice on programming in [commands for Windows][commands for Windows].

## Normative references

The following documents are referred to in the text in such a way that some or all of their content constitutes requirements of this document. For dated references, only the edition cited applies. For undated references, the latest edition of the referenced document (including any amendments) applies.

- [ISO/IEC 2382, _Information technology — Vocabulary_](https://www.iso.org/standard/63598.html)
- [_Create installation media for Windows_](https://support.microsoft.com/windows/create-installation-media-for-windows-99a58364-8c02-206f-aa6f-40c3b507420d)
- [_Windows commands_][commands for Windows]
- [_PowerShell Documentation_][PowerShell]

## Terms and definitions

For this document, the terms and definitions given in [ISO/IEC 2382, _Information technology — Vocabulary_](https://www.iso.org/standard/63598.html) and [Windows commands][commands for Windows] apply.

ISO and IEC maintain terminology databases for use in standardization at the following addresses:

- ISO Online browsing platform: available at https://www.iso.org/obp
- IEC Electropedia: available at https://www.electropedia.org/

## Ways to install, start, and delete [command-line shells][command-line shell]

### Introduction of the command-line shells

See [_Command-line shells_][command-line shell].

### Starting

Start a command-line shell at:
- For Command Prompt:
   ```
   %windir%\System32\cmd.exe
   ```
- For PowerShell:
   ```
   %SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe
   ```

### Installing PowerShell

#### Ways

PowerShell is installed by default on every Windows, starting with Windows 7 SP1 and Windows Server 2008 R2 SP1 [(Wheeler, 2022)](#wheeler-2022).

**Warning: The user can't fix an instance of this program on Windows by installing one in a way different from how the one to fix is installed because neither of them is equivalent.**

See [_Installing Windows PowerShell_][install Windows PowerShell] to install this program on Windows.

The user may also [install this program on Linux and macOS](https://learn.microsoft.com/powershell/scripting/install/installing-powershell).

#### Differences among [ways on Windows][install Windows PowerShell]

The following table illustrates how instances of this program installed on Windows in ways other than that done by default are equivalent to neither each other nor the default one.

| Way | Installed location |
| --- | --- |
| [WinGet](https://learn.microsoft.com/powershell/scripting/install/installing-powershell-on-windows#winget) | `"%ProgramFiles%\PowerShell\<version>\pwsh.exe" -WorkingDirectory ~` |
| [MSI](https://learn.microsoft.com/powershell/scripting/install/installing-powershell-on-windows#msi) | `%ProgramFiles%\PowerShell\PowerShell` by default but can be changed |
| [ZIP](https://learn.microsoft.com/powershell/scripting/install/installing-powershell-on-windows#zip) | `<unzip>\PowerShell-<version>-<platform>\pwsh.exe` in which `<unzip>` is the location the user chooses to unzip the package to and `<version>` and `<platform>` are the installed version of and the platform on which running this program |
| [.NET](https://learn.microsoft.com/powershell/scripting/install/installing-powershell-on-windows#dotnet) | `$HOME\.dotnet\tools\pwsh.exe` |
| [Microsoft Store](https://learn.microsoft.com/powershell/scripting/install/installing-powershell-on-windows#msstore) | Sandbox |

### Fixing

#### Starting another [command-line shell][command-line shell]

[PowerShell][PowerShell] built in on Windows [(Wheeler, 2022)](#wheeler-2022) can be broken or [deleted](#deleting-1) if unable to run. Only as an administrator may the user fix it. However, fixing has to be by [running commands also in a command-line shell](#fixing-also-in-an-instance-of-command-line-shell-1). Such a shell can be either Command Prompt or something else that can run.

Command Prompt is built in for all versions of Windows. However, it can also be broken or [deleted](#deleting) if unable to run. For fixing the problem, it can be hard to start another [command-line shell][command-line shell] if the user can open neither this program nor another [command-line shell][command-line shell]. Only as an administrator may the user do this. It should be done by starting another instance of this program from an installation medium for the OS in the following steps:

1. (Necessary if the user doesn't have an installation medium for the OS or isn't sure about the integrity of what he has) [Create installation media for the OS](https://support.microsoft.com/en-us/windows/create-installation-media-for-windows-99a58364-8c02-206f-aa6f-40c3b507420d).
2. Keep the installation medium plugged in and go to `Settings` > `Windows Update` > `Advanced options` > (in `Others`) `Recovery` > (in `Recovery options` > `Advanced recovery`) `Reboot immediately`.
3. In the reboot page, click `Fix this computer` > `Command Prompt`.

#### Fixing also in an instance of [command-line shell][command-line shell]

Only as an administrator may the user fix [PowerShell][PowerShell] built in on Windows [(Wheeler, 2022)](#wheeler-2022) or Command Prompt. Such a user should do this in the following steps, in which the commands given have to be run also in an instance of [command-line shell][command-line shell]. Such a shell should be started as [recommended](#starting-another-command-line-shell) if no instances of this program can be running as an administrator.

1. (Necessary if the user isn't sure about the integrity of the local image of the OS) Run the following commands in sequence as an administrator [to keep the integrity of the local image of the OS](http://go.microsoft.com/fwlink/?LinkId=243077):
   ```
   DISM.exe /Online /Cleanup-Image /CheckHealth
   DISM.exe /Online /Cleanup-Image /ScanHealth
   DISM.exe /Online /Cleanup-Image /RestoreHealth
   ```
2. (Necessary if the user isn't sure about the absolute directory of the OS) Run the following command to display the absolute directory of the OS, and copy it manually:
   ```
   echo %windir%
   ```
3. Run the following command [to verify the integrity](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/sfc) of the [command-line shell][command-line shell] to fix with `<%windir%>`, following the [_Command-Line Syntax Key_][Command-Line Syntax Key], replaced with the absolute directory of the OS, copied in last step if the user isn't sure about it:
   - For Command Prompt:
      ```
      sfc /verifyfile=<%windir%>\System32\cmd.exe
      ```
   - For [PowerShell][PowerShell]:
      ```
      sfc /verifyfile=<%windir%>\System32\WindowsPowerShell\v1.0\powershell.exe
      ```
4. Run the following command [to scan the integrity of the command-line shell to fix and attempt to fix any problems if they're detected](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/sfc), with `<%windir%>`, following the [_Command-Line Syntax Key_][Command-Line Syntax Key], replaced with the absolute directory of the OS:
   - For Command Prompt:
      ```
      sfc /scanfile=<%windir%>\System32\cmd.exe
      ```
   - For [PowerShell][PowerShell]:
      ```
      sfc /scanfile=<%windir%>\System32\WindowsPowerShell\v1.0\powershell.exe
      ```
5. (Optional if not sure on the integrity of the other protected system files) Run the following command [to scan the integrity of the command-line shell fixed together with all the other protected system files, and fix those with problems if possible](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/sfc):
   ```
   sfc /scannow
   ```
6. (Optional) Start the command-line shell tried to fix to check whether it has been fixed successfully.

#### Deleting

**Warning: Neither [PowerShell][PowerShell] built in on Windows nor Command Prompt can be recovered from the recycle bin if deleted in the following way. A command-line shell is relied on many processes. Don't do this.**

Try [fixing a command-line shell](#fixing) if something is wrong with it.

It is deprecated to delete either of the [command-line shells][command-line shell]. Only as an administrator may the user do this. Such a user should do this in the following steps:

1. Run a command-line shell as an administrator. Such a command shell may be the one to be deleted if it can still run.
2. Go to the location of the [command-line shell][command-line shell] to be deleted.
3. Run the following command [to enable the administrator to recover access to the command-line shell to be deleted](https://learn.microsoft.com/windows-server/administration/windows-commands/takeown) with `<commandlineshell>`, following the [_Command-Line Syntax Key_][Command-Line Syntax Key], replaced with the [command-line shell][command-line shell] to be deleted:
   ```
   takeown /f <commandlineshell>
   ```
4. Run the following command [to grant full access to the program](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/icacls) with `<username>`, following the [_Command-Line Syntax Key_][Command-Line Syntax Key], replaced with the username of the administrator:
   ```
   icacls <commandlineshell> /grant <username>:F
   ```
5. **(Warning: The [command-line shell][command-line shell] can't be recovered from the recycle bin if deleted)** Run the following command to delete the [desired command-line shell]:
   ```
   del <commandlineshell>
   ```

## Programming practices

### Displaying the text string

#### To-display text string classic for programming beginners

The following text string is classic for beginners to try to display by programming ([Prasad, 2014](#prasad-2014)).

```
Hello, World!
```

#### Displaying the string by entering the command without preparing a file

The user should run the following command to display the string without preparing a file:

```
echo Hello, World!
```

#### Turning on or off the command echoing feature

See the [related official documentation](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/echo) for turning on or off  and checking the state of the command echoing feature.

#### Displaying the text string by entering the command to open a batch file

[Hello.bat](Hello.bat) in this repository is a batch file desplaying the string in the console. However the user can find the console crash without seeing the string clearly if opening the file directly. To avoid such a situation, the user should open the file in a [command-line shell][command-line shell] in the following steps:

1. In the command-line shell, go to the folder in which is [the file](Hello%20World.bat), which is the folder of the repository, if the user has cloned it, which is recommended, or the folder into which the user has downloaded the file, in either of the following methods:
   - Start a [command-line shell](#starting) and go to the desired folder.
   - Go to the desired folder with [File Explorer](https://support.microsoft.com/windows/file-explorer-in-windows-ef370130-1cca-9dc5-e0df-2f7416fe1cb1), right click in the blank area, and click `Open in Terminal`. If the choice disappears, search for `Terminal` on the computer. Uninstall it if able to be found. Then install it again from [Microsoft Store](https://apps.microsoft.com/detail/9N0DX20HK701).
2. Enter the name of the file to execute it:
   ```
   Hello.bat
   ```

## References

### Wheeler, 2022

Creator: WHEELER, Sean [[GitHub](https://github.com) Account at: https://github.com/sdwheeler].

Title: _Installing Windows PowerShell_.

Date of material: 2022-10-25.

Format: Web page [Farrier type: online. File format: HTML].

Name of the host archive: Previous versions of PowerShell (available from: https://learn.microsoft.com/en-us/previous-versions/powershell/scripting).

Online host: Microsoft Learn (available from: https://learn.microsoft.com).

Available from: Microsoft Learn, https://learn.microsoft.com/previous-versions/powershell/scripting/windows-powershell/install/installing-windows-powershell.

### Prasad, 2014

Creator: PRASAD, Shishir [articles available from: https://www.forbesindia.com/author/shishir-prasad].

Title: _Brian Kernighan: No one Thought C Would Become So Big_.

Title of the host serial: _Forbes India_.

Format: Web page [Farrier type: online. File format: HTML].

Edition: Updated.

Publisher location: Mumbai.

Publisher name: Network18 Media & Investments Limited.

Date of publication: 2011-11-03 [updated on: 2014-02-27].

Issue: 2011-11-18.

Copyright: Network18 Media & Investments Limited. All rights reserved.

Date of citation: 2025-05-05.

[OCLC: 1458713602](https://search.worldcat.org/en/title/1458713602).

Available from: https://www.forbesindia.com/interview/special/brian-kernighan-no-one-thought-c-would-become-so-big/29982/1.


[command-line shell]: https://learn.microsoft.com/windows-server/administration/windows-commands/windows-commands#command-line-shells
[creator]: https://github.com/PtJade-Ceramic
[commands for Windows]: https://learn.microsoft.com/windows-server/administration/windows-commands/windows-commands
[install Windows PowerShell]: https://learn.microsoft.com/powershell/scripting/windows-powershell/install/installing-windows-powershell
[PowerShell]: https://learn.microsoft.com/powershell
[Command-Line Syntax Key]: https://learn.microsoft.com/windows-server/administration/windows-commands/command-line-syntax-key
