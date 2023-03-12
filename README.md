# Flatpak-Wine (wine-8.0) and Flatpak-WineZGUI (wine-8.0)

![](https://github.com/fastrizwaan/flatpak-wine/releases/download/0.94.9/winezgui-0.94.9.png)

### Features

- [x] Create Shortcut for any selected exe.

- [x] Installer supported

- [x] Create Game Bundles and share

- [x] Save and Load Game (drive/users/$USER)

- [x] Template support
  
  ### Installation:
  
  In a terminal window, copy paste these:
  
  ```
  flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  flatpak --user -y install flathub org.winehq.Wine/x86_64/stable-22.08
  wget -c https://github.com/fastrizwaan/flatpak-wine/releases/download/0.95.1/flatpak-winezgui_0.95.1_20230312.flatpak
  flatpak --user install flatpak-winezgui_0.95.1_20230312.flatpak
  flatpak -y remove io.github.fastrizwaan.WineZGUI
  
  ```
  
  Get flatpak-wine8 flatpak from https://github.com/fastrizwaan/flatpak-wine/releases
  
  #### What is flatpak-wine and flatpak-WineZGUI?
  
  Flatpak-wine is simply wine and winetricks bundled in a flatpak file. Here wine is built and included in the flatpak.
  Flatpak-WineZGUI is flathub's wine (org.winehq.Wine) + WineZGUI scripts. Here wine is not built/bundled for the flatpak.
  
  #### Where are the game prefixes?
  
  Wine by default uses ~/.wine as prefix. But WineZGUI uses different prefix location
  Game bottles/Prefixes:    `~/.var/app/io.github.fastrizwaan.WineZGUI/data/winezgui/Prefixes/`

#### Can it handle installers and directplay exe files?

Yes, what works with standard wine should work. If an exe won't work test it with `flatpak run --command=wine io.github.fastrizwaan.WineZGUI <GAME>.exe` which will use `~/.wine` as prefix.

#### How are installers handled by WineZGUI?

Prefix and Launch Script for both Installers and direct play exe files are created. Once the installer is launched, it creates new launch scripts for the found installed exe in the installer's prefix.

#### Is it safe?

flatpak-wine and flatpak-WineZGUI have full host/filesystem access, and if you want to restrict it, use flatseal app from flathub to limit the directories it can read/write. It is given full rw access on the host so that  apps/games in different partitions or directories can be run without any issues. But everything is official, there are no patches, one can check the manifest and scripts. 

### Customizing Bottles:

Both default and app/game specific bottles provide some options to customize, like winetricks gui, winecfg etc. We can open flatpak sandbox shell from the options, and run winetricks, wine like we run from terminal window.

#### Customzing flatpak-wine or game bottle with winetricks:

Install your required dlls using winetricks 

##### Commandline using terminal window:

We  can use Open Terminal feature to access command line.

##### How to access this app/wine bottle

Just go to `~/.var/app/io.github.fastrizwaan.WineZGUI/data/prefixes/`, and we can find all the games and default prefixes created by flatpak-WineZGUI here.

### Why flatpak-wine when others (lutris, playonlinux, bottles, etc.) exist?

Lutris, Bottles, Phoenicis, PlayOnLinux, q4wine, WineGUI, etc. have confusing frontend / interface. They are prefix oriented, that is the user is asked to create a prefix then choose a setup/exe file to work with that prefix.
Flatpak-wine is trying to be simple, opening an exe with flatpak-WineZGUI creates a prefix automatically for any installer/exe to isolate it, which is way faster. Though every new prefix takes around a couple hundred megabytes disk space.

### Why wine inside flatpak?

1. Upgrade breakage fix: When our distro updates wine, some games which work with specific version of wine will stop working. so, flatpak-wine is independent of distribution, so it will not break games with distribution upgrades of wine.

2. Consistent Version  : wine within flatpak with a fixed version (5.0.x) works across all flatpak supported distributions (https://flatpak.org/setup/). And other version like flatpak-wine-6.19 can co-exist together for other games.

3. Availability across most Linux distros: Centos like distributions do not provide 32 bit wine in their repository. Or you can't have older version of wine like wine-2.17 for older games.

4. Consistent libraries: wine in different distro may not work because of missing libraries, e.g., debian needs to enable 32 bit support. The advantage is that the shared libraries in flatpak are consistent across all distributions.  which can be used to run official wine build from winehq.

5. Works like wine bottle management apps like PlayOnLinux / Lutris for wine / Bottles app.

6. Straight forward and quick launching of Windows programs and games.
   
   ### Why wine stable why not wine-staging?
   
   Wine staging breaks with updates. So it is better to use stable wine than latest but unreliable wine version. 
   
   ### Can we make a flatpak bundle of Game + wine?
   
   Yes, for that see winepak-x86_64 (https://github.com/fastrizwaan/winepak-x86_64). 
   The Drawback of winepak-x86_64 bundle is that creating bundle takes a lot of time 20 minutes to hours. and it is difficult to bundle all the runtime stuff for all the games. Some games and apps can be bundled easily with that. Bottles created with flatpak-wine is a simple solution.
   But one can quickly setup flatpak-wine and use the game directory, why bother with creating a flatpak-bundle when the game or app would last a few days to a few months?
   
   ### Usage (commandline):
   
   ```
   flatpak run --command=wine io.github.fastrizwaan.WineZGUI --version
   wine-8.0
   ```
   
   ### How to kill/stop stuck flatpak-wine game or application?
   
   from the terminal window run `flatpak kill io.github.fastrizwaan.WineZGUI` or from your desktop environment's menu `winezgui->Kill...`
   
   ### How to build the same flatpak on my system?
   
   It's simple: build takes up to 2 hours (50 minutes on i7 4th gen)
   
   ```
   git clone https://github.com/fastrizwaan/flatpak-wine.git
   cd flatpak-wine/flatpak-winezgui
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
