# ALClass

## Repository to simplify education steps

Hi Class,
This repo is about to help you to get your first simple steps made. As shown by your teacher you can use this as a starting point.

After you have cloned this repository within VS Code you should be able to run some powershell :)
These commands will take care that you have the latest version of BC-ContainerHelper and it will also have scripts available to start up your first container.

Have fun and good luck!

**ATTENTION**:
As you are using Powershell maybe for the first time you will be prompted - in lucky cases - with some dialogs about confirming access e.g. for Nuget or Powershell Gallery. Of course you should grant access to that.

In some cases you will see some red text, saying something about Execution policies:

## Policies

Some people had policy issues and also some concerns on what the commands was that they used...
to wrap this is I wrote a small summary:
 
Powershell has a quite strong restriction model to block scripts from executing. This can be handled in several ways and on several scopes:

By running the following you get your current setup.

```powershell
Get-ExecutionPolicy -List | Format-Table -AutoSize
```

For me it looks like this:

|Scope|ExecutionPolicy|
|-----|---------------|
|MachinePolicy|Undefined|
|UserPolicy|Undefined|
|Process|Undefined|
|CurrentUser|RemoteSigned|
|LocalMachine|Undefined|


You can change any of those if you want with:

```powershell
Set-Executionpolicy
```

The expected execution policy values are as follows:

- AllSigned. Requires that all scripts and configuration files are signed by a trusted publisher, including scripts written on the local computer.

- Bypass. Nothing is blocked and there are no warnings or prompts.

- Default. Sets the default execution policy. Restricted for Windows clients or RemoteSigned for Windows servers.

- RemoteSigned. Requires that all scripts and configuration files downloaded from the Internet are signed by a trusted publisher. The default execution policy for Windows server computers.

- Restricted. Doesn't load configuration files or run scripts. The default execution policy Windows client computers.

- Undefined. No execution policy is set for the scope. Removes an assigned execution policy from a scope that is not set by a Group Policy. If the execution policy in all scopes is Undefined, the effective execution policy is Restricted.

- Unrestricted. Loads all configuration files and runs all scripts. If you run an unsigned script that was downloaded from the Internet, you are prompted for permission before it runs.

It is quite interesting to check the different powershell environments that you may use: ISE, Powershell x86 (32bit), Powershell (64-bit), VS Code Integrated shell. They may have different setups! So my VS Code (which uses a 64bit Powershell) looks e.g. like this:

```powershell
Get-ExecutionPolicy -List | Format-Table -AutoSize
```

|Scope|ExecutionPolicy|
|-----|---------------|
|MachinePolicy|Undefined|
|UserPolicy|Undefined|
|Process|RemoteSigned|
|CurrentUser|RemoteSigned|
|LocalMachine|Unrestricted|

## What you should do now

To get you going on the next sessions with powershell task I recommend you to set it like the following:

```powershell
Set-Executionpolicy -Scope CurrentUser -ExecutionPolicy UnRestricted
```

### If you want to know more read here

<https://docs.microsoft.com/en-gb/powershell/module/Microsoft.PowerShell.Security/Set-ExecutionPolicy?view=powershell-5.1>

<https://blog.netspi.com/15-ways-to-bypass-the-powershell-execution-policy/>

**HINT**:
You should review your current settings and adjust them to a minimum risk setup ((at least as long as you are not sure about)