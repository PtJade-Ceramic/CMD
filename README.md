# Programming practice — Windows Commands

## Foreword

This document was drafted following the editorial rules of the [ISO/IEC Directives, Part 2](https://www.iso.org/directives) containing modifications, mostly simplification, not specified.

## Introduction

Commands for Windows are derived from MS-DOS 1.0, [code of some of whose later versions has been reopened on GitHub](https://devblogs.microsoft.com/commandline/re-open-sourcing-ms-dos-1-25-and-2-0/).

[PtJade Ceramic][creator] is exercising programming in [commands for Windows][command-line shell]. The code and documentation are in this repository for review and reference.

[The creator][creator]'s goal is to implement an interpreter of the programming language [Brainfuck](https://esolangs.org/wiki/Brainfuck) as a batch file.

[The creator][creator] is not a native English writer, and is willing to listen to criticism on his writing and correct any grammar mistakes.

Some content of this file is based on a [list of tutorials on Windows Command Line](https://www.youtube.com/playlist?list=PL6gx4Cwl9DGDV6SnbINlVUd0o2xT4JbMu)[^Roberts,2016] for which thanks should be said to the creator.

[^Roberts,2016]: ROBERTS, Bucky [[GitHub](https://github.com) Account at: https://github.com/buckyroberts]. *Windows Command Line Tutorials*. Video list. Mountain View, California: Google LLC, 2016-01-10. YouTube, https://youtube.com/playlist?list=PL6gx4Cwl9DGDV6SnbINlVUd0o2xT4JbMu [also avaailable from https://www.bilibili.com/video/BV1Yb411H769]. [2025-05-07].

The user should enter a command in a [command-line shell][command-line shell] in either of the following ways:

- Type the command and press Enter; or
- Paste the command followed by a carriage return defined by [ISO/IEC 6429](https://www.iso.org/standard/12782.html).

Some commands may only be run as an administrator. To do this, the user must start another process, also an instance of a [command-line shell][command-line shell], as an administrator if the current one hasn't been run as an administrator by entering the following command if the new one is Command Prompt, for example, and PowerShell has been installed:

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

For this document, the terms and definitions given in [ISO/IEC 2382](https://www.iso.org/standard/63598.html) and [Windows commands][commands for Windows] apply.

ISO and IEC maintain terminology databases for use in standardization at the following addresses:

- ISO Online browsing platform: available at https://www.iso.org/obp
- IEC Electropedia: available at https://www.electropedia.org/

## Ways to install, start, and delete [command-line shells][command-line shell]

### Introduction of the command-line shells

See [_Command-line shells_][command-line shell].

### Start

Start a command-line shell at:
- For Command Prompt:
   ```cmd
   %windir%\System32\cmd.exe
   ```
- For PowerShell:
   ```cmd
   %SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe
   ```

### Installation of PowerShell

#### Ways

PowerShell is installed by default on every Windows, starting with Windows 7 SP1 and Windows Server 2008 R2 SP1[^Wheeler,2022].

[^Wheeler,2022]: WHEELER, Sean [[GitHub](https://github.com) Account at: https://github.com/sdwheeler]. *Installing Windows PowerShell*. 2022-10-25. Web page [Online, HTML]. *Previous versions of PowerShell* (available from: https://learn.microsoft.com/en-us/previous-versions/powershell/scripting). Microsoft Learn (available from: https://learn.microsoft.com). Microsoft Learn, https://learn.microsoft.com/previous-versions/powershell/scripting/windows-powershell/install/installing-windows-powershell.

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

### Automatic completion of file and directory names in command shells

See the [official documentation](https://learn.microsoft.com/windows-server/administration/windows-commands/windows-commands#command-shell-file-and-directory-name-automatic-completion) to configure the specified control character entered in the [command-line shell][command-line shell] to automatically complete names of file and directory on a computer or user session.

### Help

Enter the following command following the [*Command-Line Syntax Key*][Command-Line Syntax Key] to get help for a specific `<command>`:

```cmd
<command> /?
```

### Fixing

#### Starting another [command-line shell][command-line shell]

[PowerShell][PowerShell] built in on Windows[^Wheeler,2022] can be broken or [deleted](#deleting-1) if unable to run. Only as an administrator may the user fix it. However, fixing has to be by [entering commands also in a command-line shell](#fixing-also-in-an-instance-of-command-line-shell-1). Such a shell can be either Command Prompt or something else that can run.

Command Prompt is built in for all versions of Windows. However, it can also be broken or [deleted](#deleting) if unable to run. For fixing the problem, it can be hard to start another [command-line shell][command-line shell] if the user can open neither this program nor another [command-line shell][command-line shell]. Only as an administrator may the user do this. It should be done by starting another instance of this program from an installation medium for the OS in the following steps:

1. (Necessary if the user doesn't have an installation medium for the OS or isn't sure about the integrity of what he has) [Create installation media for the OS](https://support.microsoft.com/en-us/windows/create-installation-media-for-windows-99a58364-8c02-206f-aa6f-40c3b507420d).
2. Keep the installation medium plugged in and go to `Settings` > `Windows Update` > `Advanced options` > (in `Others`) `Recovery` > (in `Recovery options` > `Advanced recovery`) `Reboot immediately`.
3. In the reboot page, click `Fix this computer` > `Command Prompt`.

#### Fixing also in an instance of [command-line shell][command-line shell]

Only as an administrator may the user fix [PowerShell][PowerShell] built in on Windows[^Wheeler,2022] or Command Prompt. Such a user should do this in the following steps, in which the commands given have to be entered also in an instance of [command-line shell][command-line shell]. Such a shell should be started as [recommended](#starting-another-command-line-shell) if no instances of this program can be running as an administrator.

1. (Necessary if the user isn't sure about the integrity of the local image of the OS) Enter the following commands in sequence as an administrator [to keep the integrity of the local image of the OS](http://go.microsoft.com/fwlink/?LinkId=243077):
   ```cmd
   DISM.exe /Online /Cleanup-Image /CheckHealth
   DISM.exe /Online /Cleanup-Image /ScanHealth
   DISM.exe /Online /Cleanup-Image /RestoreHealth
   ```
2. (Necessary if the user isn't sure about the absolute directory of the OS) enter the following command to display the absolute directory of the OS, and copy it manually:
   ```cmd
   echo %windir%
   ```
3. Enter the following command [to verify the integrity](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/sfc) of the [command-line shell][command-line shell] to fix with `<%windir%>`, following the [*Command-Line Syntax Key*][Command-Line Syntax Key], replaced with the absolute directory of the OS, copied in last step if the user isn't sure about it:
   - For Command Prompt:
      ```cmd
      sfc /verifyfile=<%windir%>\System32\cmd.exe
      ```
   - For [PowerShell][PowerShell]:
      ```cmd
      sfc /verifyfile=<%windir%>\System32\WindowsPowerShell\v1.0\powershell.exe
      ```
4. Enter the following command [to scan the integrity of the command-line shell to fix and attempt to fix any problems if they're detected](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/sfc), with `<%windir%>`, following the [*Command-Line Syntax Key*][Command-Line Syntax Key], replaced with the absolute directory of the OS:
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

**Warning: Neither [PowerShell][PowerShell] built in on Windows nor Command Prompt can be recovered from the [Recycle Bin][recycle] if deleted in the following way. A command-line shell is relied on many processes. Don't do this.**

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
5. **(Warning: The [command-line shell][command-line shell] can't be recovered from the [Recycle Bin][recycle] if deleted)** Enter the following command to delete the [desired command-line shell]:
   ```cmd
   del <commandlineshell>
   ```

## Programming practices

### Folder management

The following table illustrates commands used to manage folders.

| Command | Meaning | Usage |
| ------- | ------- | ----- |
| `cd` \| `chdir` | Change the directory | [Display the name of the current directory or change the current directory](https://learn.microsoft.com/windows-server/administration/windows-commands/cd) |
| `dir` | Directory | [Display a list of a directory's files and subdirectories](https://learn.microsoft.com/windows-server/administration/windows-commands/dir) |
| `md` \| `mkdir` | Make a directory | [Create a directory or subdirectory](https://learn.microsoft.com/windows-server/administration/windows-commands/md) |
| `rd` \| `rmdir` | Remove a directory | [Delete a directory](https://learn.microsoft.com/windows-server/administration/windows-commands/rd) |
| `tree` | Tree | [Display the directory structure of a path or of the disk in a drive graphically](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/tree) |
| `path` | Path | [Set the command path in the PATH environment variable, specifying the set of directories used to search for executable (`*.exe`) files](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/path) |
| `wmic` | [WMI](https://learn.microsoft.com/en-us/powershell/scripting/learn/ps101/07-working-with-wmi?view=powershell-7.5) command | [Displays WMI information inside an interactive command shell](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/wmic) |

### Colors of the foreground and background in the Command Prompt window

The user may enter command `color` to [change the foreground and background colors in the Command Prompt window for the current session](https://learn.microsoft.com/windows-server/administration/windows-commands/color).

### Display of text

#### Clearing the window

The user should enter the following command to [clear the Command Prompt window](https://learn.microsoft.com/windows-server/administration/windows-commands/cls):

```cmd
cls
```

#### Command echoing

See the [official documentation on related command](https://learn.microsoft.com/windows-server/administration/windows-commands/echo) for turning on or off  and checking the state of the command echoing feature.

#### Display of a spesific string

##### To-display string classic for programming beginners

The following string is classic for beginners to try to display by programming[^Prasad,2014].

[^Prasad,2014]: PRASAD, Shishir [articles available from: https://www.forbesindia.com/author/shishir-prasad]. *Brian Kernighan: No one Thought C Would Become So Big*. *Forbes India*. Web page [online, HTML]. Updated. Mumbai, Network18 Media & Investments Limited. 2011-11-03 [updated on 2014-02-27]. Issue 2011-11-18. Copyright Network18 Media & Investments Limited. All rights reserved [2025-05-05]. [OCLC: 1458713602](https://search.worldcat.org/en/title/1458713602). https://www.forbesindia.com/interview/special/brian-kernighan-no-one-thought-c-would-become-so-big/29982/1.

```
Hello, World!
```

##### Display of the string by entering a command without preparing a file

The user should enter the following command to display the string without preparing a file:

```cmd
echo Hello, World!
```

##### Display of the text string by preparing a batch file and open it

Batch files are usually created and edited in a text editor. However the user may also enter a string as the content of a batch file by entering command `copy con`. See [MicrosoftDocs](https://github.com/MicrosoftDocs)/[windowsserverdocs](https://github.com/MicrosoftDocs/windowsserverdocs) [#8067](https://github.com/MicrosoftDocs/windowsserverdocs/pull/8067) for more information.

##### Display of the text string by entering a command to open a batch file having been prepared in this repository

[Hello.bat][Hello] in this repository is a batch file desplaying the string in the console. However the user can find the console crash without seeing the string clearly if opening the file directly. To avoid such a situation, the user should open the file in a [command-line shell][command-line shell] in the following steps:

1. In the command-line shell, go to the folder in which is [the file][Hello], which is the folder of the repository, if the user has cloned it, which is recommended, or the folder into which the user has downloaded the file, in either of the following methods:
   - Start a [command-line shell](#starting) and go to the desired folder.
   - Go to the desired folder with [File Explorer](https://support.microsoft.com/windows/file-explorer-in-windows-ef370130-1cca-9dc5-e0df-2f7416fe1cb1), right click in the blank area, and click `Open in Terminal`. If the choice disappears, search for `Terminal` on the computer. Uninstall it if able to be found. Then install it again from [Microsoft Store](https://apps.microsoft.com/detail/9N0DX20HK701).
2. Enter the name of the file to execute it:
   ```cmd
   Hello.bat
   ```

#### Display of the content of a text file

The user should enter the following command to display the code in [Hello.bat][Hello] after going to its location:

```cmd
type Hello.bat
```

See the [official documentation related to this command](https://learn.microsoft.com/windows-server/administration/windows-commands/type) for more information.

[command-line shell]: https://learn.microsoft.com/windows-server/administration/windows-commands/windows-commands#command-line-shells
[creator]: https://github.com/PtJade-Ceramic
[commands for Windows]: https://learn.microsoft.com/windows-server/administration/windows-commands/windows-commands
[install Windows PowerShell]: https://learn.microsoft.com/powershell/scripting/windows-powershell/install/installing-windows-powershell
[PowerShell]: https://learn.microsoft.com/powershell
[Command-Line Syntax Key]: https://learn.microsoft.com/windows-server/administration/windows-commands/command-line-syntax-key
[Hello]: Hello.bat
[recycle]: https://support.microsoft.com/windows/find-the-recycle-bin-in-windows-885cf298-0f98-a548-9427-a1248fce4315
