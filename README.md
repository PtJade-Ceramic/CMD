# Programming exercises — Windows Commands

## Foreword

This document was drafted following the editorial rules of the [ISO/IEC Directives, Part 2](https://www.iso.org/directives), however, containing modifications, mostly simplification, not specified.

## Introduction

Commands for Windows are derived from MS-DOS 1.0, [code of some of whose later versions has been reopened on GitHub](https://devblogs.microsoft.com/commandline/re-open-sourcing-ms-dos-1-25-and-2-0/).

[PtJade Ceramic](https://github.com/PtJade-Ceramic) is exercising programming in [commands for Windows](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands). The code and documentation are in this repository for review and reference.

[The creator](https://github.com/PtJade-Ceramic)'s goal is to implement an interpreter of the programming language [Brainfuck](https://esolangs.org/wiki/Brainfuck) as a batch file.

[The creator](https://github.com/PtJade-Ceramic) is not a native English writer, and is willing to listen to criticism on his writing and correct any grammar mistakes.

In a [command-line shell](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands#command-line-shells), to run a command:

- Type the command and press Enter; or
- Paste the command followed by a carriage return defined by [ISO/IEC 6429](https://www.iso.org/standard/12782.html).

Some commands can only be run as an administrator. To run them, the user must start another process, also an instance of a [command-line shell](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands#command-line-shells), as an administrator if the current one hasn't been run as an administrator by running the following command if the new one is Command Prompt, for example, and PowerShell has been installed:

```
PowerShell -Command "Start-Process cmd.exe -Verb RunAs"
```

## Scope

This repository provides exercises on programming in [commands for Windows](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands).

## Normative references

The following documents are referred to in the text in such a way that some or all of their content constitutes requirements of this document. For dated references, only the edition cited applies. For undated references, the latest edition of the referenced document (including any amendments) applies.

- [ISO/IEC 2382, _Information technology — Vocabulary_](https://www.iso.org/standard/63598.html)
- [_Create installation media for Windows_](https://support.microsoft.com/en-us/windows/create-installation-media-for-windows-99a58364-8c02-206f-aa6f-40c3b507420d)
- [_Windows commands_](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands)
- [_Installing Windows PowerShell_](https://learn.microsoft.com/en-us/previous-versions/powershell/scripting/windows-powershell/install/installing-windows-powershell)

## Terms and definitions

For this document, the terms and definitions given in [ISO/IEC 2382, _Information technology — Vocabulary_](https://www.iso.org/standard/63598.html) and [Windows commands](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands) apply.

## Ways to install and delete [command-line shells](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands#command-line-shells)

### Introduction of the command-line shells

See [_Command-line shells_](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands#command-line-shells).

### Command Prompt

#### Starting

Start this program at:

```
%windir%\System32\cmd.exe
```

#### Fixing

##### Starting another [command-line shell](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands#command-line-shells)

This program is built in for all versions of Windows. It can be broken or [deleted](#deleting) however if unable to run. For fixing the problem, it can be hard to start another [command-line shell](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands#command-line-shells) if the user can open neither this program nor other [command-line shell](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands#command-line-shells). Only as an administrator may the user do this. Such a user should do this by starting another instance of this program from an installation medium for the OS in the following steps:

1. (Necessary if the user doesn't have an installation medium for the OS or isn't sure about the integrity of what he has) [Create installation media for the OS](https://support.microsoft.com/en-us/windows/create-installation-media-for-windows-99a58364-8c02-206f-aa6f-40c3b507420d).
2. Keep the installation medium plugged in and go to `Settings` > `Windows Update` > `Advanced options` > (in `Others`) `Recovery` > (in `Recovery options` > `Advanced recovery`) `Reboot immediately`.
3. In the reboot page, click `Fix this computer` > `Command Prompt`.

##### Fixing also in an instance of [command-line shell](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands#command-line-shells)

Only as an administrator may the user fix this program. Such a user should do this in the following steps in which the commands given has to be run also in an instance of [command-line shell](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands#command-line-shells). Such shell should be started as [recommended](#starting-another-command-line-shell) if no instance of this program can be running as an administrator.

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
3. Run the following command [to verify the integrity of this program](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/sfc) with `<%windir%>`, following the [_Command-Line Syntax Key_](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/command-line-syntax-key), replaced with the absolute directory of the OS, copied in last step if the user isn't sure about it:
   ```
   sfc /verifyfile=<%windir%>\System32\cmd.exe
   ```
4. Run the following command [to scan the integrity of this program and attempt to fix any problems if they're detected](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/sfc), with `<%windir%>`, following the [_Command-Line Syntax Key_](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/command-line-syntax-key), replaced with the absolute directory of the OS:
   ```
   sfc /scanfile=<%windir%>\System32\cmd.exe
   ```
5. Run the following command [to scan the integrity of this program, together with all the other protected system files, and fix those with problems if possible](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/sfc):
   ```
   sfc /scannow
   ```
6. (Optional) Start this program to check whether it has been fixed successfully.

#### Deleting

**Warning: Many processes rely on this program. It can't be recovered from the recycle bin if deleted in the following way. Don't do this.**

The user should try [fixing this program](#fixing) instead if something is wrong with it.

It is deprecated to delete this program. Only as an administrator may the user do this. Such a user should do this in the following steps:

1. Go to `%windir%\System32`.
2. Run `cmd.exe` as an administrator.
3. Run the following command [to enable an administrator to recover access to this program](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/takeown):
   ```
   takeown /f cmd.exe
   ```
4. Run the following command [to grant full access to the program](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/icacls) with `<username>`, following the [_Command-Line Syntax Key_](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/command-line-syntax-key), replaced with the username of the administrator:
   ```
   icacls cmd.exe /grant <username>:F
   ```
5. **(Warning: This program can't be recovered from the recycle bin if deleted)** Run the following command to delete this program:
   ```
   del cmd.exe
   ```

### PowerShell

#### Starting

Start this program at:

```
%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe
```

#### Installing

This program is installed by default on every Windows, starting with Windows 7 SP1 and Windows Server 2008 R2 SP1.

See [_Installing Windows PowerShell_](https://learn.microsoft.com/en-us/previous-versions/powershell/scripting/windows-powershell/install/installing-windows-powershell).

#### Fixing

##### Starting another [command-line shell](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands#command-line-shells)

It can be broken or [deleted](#deleting-1) however if unable to run. Only as an administrator may the user fix it. To do this, such a user must [run commands also in a command-line shell](#fixing-also-in-an-instance-of-command-line-shell-1). Such shell can be either Command Prompt or [something else that can run](#starting-another-command-line-shell).

##### Fixing also in an instance of [command-line shell](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands#command-line-shells)

Only as an administrator may the user fix this program. Such a user should do this in the following steps in which the commands given has to be run also in an instance of [command-line shell](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands#command-line-shells). Such shell should be started as [recommended](#starting-another-command-line-shell-1) if no instance of this program can be running as an administrator.

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
3. Run the following command [to verify the integrity of this program](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/sfc) with `<%windir%>`, following the [_Command-Line Syntax Key_](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/command-line-syntax-key), replaced with the absolute directory of the OS, copied in last step if the user isn't sure about it:
   ```
   sfc /verifyfile=<%windir%>\System32\powershell.exe
   ```
4. Run the following command [to scan the integrity of this program and attempt to fix any problems if they're detected](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/sfc), with `<%windir%>`, following the [_Command-Line Syntax Key_](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/command-line-syntax-key), replaced with the absolute directory of the OS:
   ```
   sfc /scanfile=<%windir%>\System32\powershell.exe
   ```
5. Run the following command [to scan the integrity of this program, together with all the other protected system files, and fix those with problems if possible](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/sfc):
   ```
   sfc /scannow
   ```
6. (Optional) Start this program to check whether it has been fixed successfully.

#### Deleting

**Warning: This program can't be recovered from the recycle bin if deleted in the following way. Don't do this.**

Try [fixing this program](#fixing-1) instead if something is wrong with it.

It is deprecated to delete this program. Only as an administrator may the user do this. Such a user should do this in the following steps:

1. Go to `%windir%\System32\WindowsPowerShell\v1.0`.
2. Run `powersehll.exe` as administrator.
3. Run the following command [to enable an administrator to recover access to this program](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/takeown):
   ```
   takeown /f powershell.exe
   ```
4. Run the following command [to grant full access to the program](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/icacls) with `<username>`, following the [_Command-Line Syntax Key_](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/command-line-syntax-key), replaced with the username of the administrator:
   ```
   icacls powershell.exe /grant <username>:F
   ```
5. **(Warning: This program can't be recovered from the recycle bin if deleted)** Run the following command to delete this program:
   ```
   del powershell.exe
   ```
