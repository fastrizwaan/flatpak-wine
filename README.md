# Flatpak-Wine (wine-8.0) (wine-7.0) and (wine-5.0.5) and Flatpak-Proton GE 7.49 Stable

![](https://github.com/fastrizwaan/flatpak-wine/releases/download/0.92.8/winezgui-0.92.8.png)

### Updated to Using freedesktop sdk 22.08

Official stable Wine 8.0, 7.0 and 5.0 in flatpaks for all flatpak supported distributions (https://flatpak.org/setup/), along with WineZGUI (scripts) to manage bottles/wineprefixes. Winetricks is also included complementary :-)

### Features
- [x] Create Shortcut for any selected exe.
- [x] Installer supported
- [x] Create Game Bundles and share
- [x] Save and Load Game (drive/users/$USER)
- [x] Template support

Copyright: (C) GNU GPL3 Mohammed Asif Ali Rizvan (https://github.com/fastrizwaan)

### Install using Software app: 
[install org.winehq.Wine (see instruction below)](https://github.com/fastrizwaan/flatpak-wine#for-the-impatient) from flathub 1st to install dependencies then install [flatpak-wine 8.0](https://github.com/fastrizwaan/flatpak-wine/releases/download/0.92.8/flatpak-wine8_0.92.8_20230226.flatpak) [for latest stable experience] 


### For the impatient

In a terminal window, copy paste these:

```
# Install flathub repo and dependencies for flatpak-wine
flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak --user -y install flathub org.winehq.Wine/x86_64/stable-22.08

# Download flatpak-wine8
wget -c https://github.com/fastrizwaan/flatpak-wine/releases/download/0.92.8/flatpak-wine8_0.92.8_20230226.flatpak

# Install
flatpak --user install flatpak-wine8_0.92.8_20230226.flatpak

# Run
flatpak run io.github.fastrizwaan.flatpak-wine8
```
#### Older versions

Other versions, if needed:
[flatpak-wine 7.0](https://github.com/fastrizwaan/flatpak-wine/releases/download/0.92.8/flatpak-wine7_0.92.8_20230226.flatpak) 
[flatpak-wine 5.0](https://github.com/fastrizwaan/flatpak-wine/releases/download/0.92.8/flatpak-wine5_0.92.8_20230226.flatpak) [for wine 5.0 compatible games]
[flatpak-proton-ge](https://github.com/fastrizwaan/flatpak-wine/releases/download/0.92.8/flatpak-proton-ge-7.49_0.92.8_20230226.flatpak) [for proton compatible games]
[flatpak-winezgui](https://github.com/fastrizwaan/flatpak-wine/releases/download/0.92.8/flatpak-winezgui_0.92.8_20230226.flatpak) [stable wine from flathub]

### Get Latest releases from flatpak-wine-release (8.0, 7.0, 5.0.5) and flatpak-proton (stable from flathub)

https://github.com/fastrizwaan/flatpak-wine/releases


#### What is flatpak wine?

Flatpak-wine is simply wine and winetricks bundled in a flatpak file. winetricks can be updated from More->Update winetricks option.

It includes bash scripts (WineZGUI) for GUI prompts similar to winetricks.

The wine prefixes or bottles, are handled with bash scripts.

There are 2 wineprefixes/bottles:

   default bottle (`~/.var/app/io.github.fastrizwaan.flatpak-wine7/data//winezgui/Prefixes/`)

   Game bottle    (`~/.var/app/io.github.fastrizwaan.flatpak-wine7/data/winezgui/Prefixes/GAME/`)
   
Handles both Installers and direct play exe files.

flatpak-wine has full host access, and if you want to restrict it, use flatseal app from flathub to limit the directories it can read/write. It is given full rw access on the host so that  apps/games in different partitions or directories can be run without any issues. But everything is official, there are no patches, one can check the manifest and scripts. 


### Customizing Bottles:

Both default and app/game specific bottles provide some options to customize, like winetricks gui, winecfg etc. We can open flatpak sandbox shell from the options, and run winetricks, wine like we run from terminal window.

#### Customzing flatpak-wine or game bottle with winetricks:

Install your required dlls using winetricks 

##### Commandline using terminal window:

We  can use Open Terminal feature to access command line.

##### How to access this app/wine bottle

Just go to `~/.var/app/io.github.fastrizwaan.flatpak-wine7/data/prefixes/`, and we can find all the games and default prefixes created by flatpak-wine7 here.

### Why flatpak-wine when others (lutris, playonlinux, bottles, etc.) exist?

Lutris, Bottles, Phoenicis, PlayOnLinux, either does not work consistently and or have confusing frontend / interface. 
Flatpak-wine is trying to be simple, and work as expected i.e., running exe from filemanager, and creating bottles from exe is easier in flatpak-wine.

### Why wine inside flatpak?

1. Upgrade breakage fix: When our distro updates wine, some games which work with specific version of wine will stop working. so, flatpak-wine is independent of distribution, so it will not break games with distribution upgrades of wine.
2. Consistent Version  : wine within flatpak with a fixed version (5.0.x) works across all flatpak supported distributions (https://flatpak.org/setup/). And other version like flatpak-wine-6.19 can co-exist together for other games.
3. Availability across most Linux distros: Centos like distributions do not provide 32 bit wine in their repository. Or you can't have older version of wine like wine-2.17 for older games.
4. Consistent libraries: wine in different distro may not work because of missing libraries, e.g., debian needs to enable 32 bit support. The advantage is that the shared libraries in flatpak are consistent across all distributions.  which can be used to run official wine build from winehq.
5. Works like wine bottle management apps like PlayOnLinux / Lutris for wine / Bottles app.
6. Straight forward and quick launching of Windows programs and games.

### Why wine-7.0 or wine-5.0 stable why not wine-staging?

Wine staging breaks with updates. So it is better to use stable wine than latest but unreliable wine version. 

### Can we make a flatpak bundle of Game + wine?

Yes, for that see winepak-x86_64 (https://github.com/fastrizwaan/winepak-x86_64). 
The Drawback of winepak-x86_64 bundle is that creating bundle takes a lot of time 20 minutes to hours. and it is difficult to bundle all the runtime stuff for all the games. Some games and apps can be bundled easily with that. Bottles created with flatpak-wine is a simple solution.

But one can quickly setup flatpak-wine and use the game directory, why bother with creating a flatpak-bundle when the game or app would last a few days to a few months?

### Usage (commandline):

```
flatpak run --command=wine io.github.fastrizwaan.flatpak-wine7 --version
wine-7.0
```

### How to kill/stop stuck flatpak-wine game or application?

from the terminal window run `flatpak kill io.github.fastrizwaan.flatpak-wine7` or from your desktop environment's menu `winezgui->Kill...`

### How to build the same flatpak on my system?

It's simple: build takes up to 2 hours (50 minutes on i7 4th gen)

```
git clone https://github.com/fastrizwaan/flatpak-wine.git
cd flatpak-wine/flatpak-wine7
bash ./install.sh
```

this will create a flatpak and also install it (as --user)

 
### Videos

https://youtu.be/x4PUObpG8sI                (flatpak-wine version 1.0 install instructions) old version

https://www.youtube.com/watch?v=6gmHe6faMS8 (raji game)

https://youtu.be/7vTIGOXQYfw                (kungfu strike with flatpak-wine)

https://youtu.be/IvZfBgg0Xy8                (New super lucky's tale)

https://youtu.be/VT22Ii4-Wwg                (Friday Night Funkin)

https://youtu.be/vFWWEDc9OfM                (Hob the game wine 5.0.5)
