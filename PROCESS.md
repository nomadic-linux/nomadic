## Process
The installation process happens in three steps.  First, the operating system is "normalized" so that nomadic will run.  Next, the necessary packages are installed.  Then the device is configured to autostart on the nomadic [base](/BASE.md) network.

1. Normalize environment.
    1. determine underlying os.
    2. install sudo and git.
    3. add $USER to sudo group.
2. Package installation.
    1. Install [core](/CORE.md) utilities.
    2. HUB? Install [hub](/HUB.md) utilities.
    3. DEV? Install [dev](/DEV.md) utilities.
3. Configuration.
    1. autostart nomadic.
    2. HUB: autostart browser.
    3. DEV: autostart terminal.
    
    
