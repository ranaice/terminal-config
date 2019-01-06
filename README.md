# Zed iTerm + ZSH Theme

Instructions to set up ZSH + custom theme and plugins.  
This theme was inspired by Agnoster and [Cobalt2](https://github.com/wesbos/Cobalt2-iterm) themes.

![alt text](https://github.com/ranaice/zed-terminal-theme/blob/master/zed-theme-v2.png)

## Installation for OSX Users

### _Mandatory_

#### iTerm2
Download and install [iTerm2](https://www.iterm2.com/).

If you want the same terminal colors import ```zed.itermcolors``` (iTerm 2 -> Preferences -> Profiles -> your profile -> Colors -> *Colors Presets* dropdown -> Import)

#### ZSH + Oh My ZSH!

In order for Oh-My-Zsh to work, Zsh must be installed.  
Please run ```zsh --version``` if the result is zsh 5.1.1 or more recent you are good to go.  
If not run ```brew install zsh zsh-completions```.  

Zsh should be set as your default shell.
Run ```echo $SHELL``` from a new terminal to confirm and if it is you should see something like ```usr/bin/zsh``` or similar, if it is not then run ```hsh -s $(which zsh)```.  

Install the [Oh-My-ZSH!](https://ohmyz.sh/) framework.  
```$ sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"```

Download ```zed.zsh-theme``` and move it to ```~/.oh-my-zsh/themes```.  
Open zsh configuration file ```open ~/.zshrc```, search for ZSH_THEME, change it to ZSH_THEME="zed" and save.
Open a new terminal window to see the difference, but the icons will be broken.

#### Nerd Fonts

In order for this theme to render correctly, you will need [Nerd Fonts](https://nerdfonts.com/#home), install one you like and choose it on *iTerm preferences -> Profiles -> Text*.

### _Optional_

#### Z

Really, really useful to save time. It tracks your most acessed directories and you can access them just by typing ```z <directory_name>```. For example, imagine i use the directory *~/Demo/videos/clips/myclips* a lot, so to acess it from anywhere i just need to type ```z myclips``` and press enter and i will navigate directly to it.

Acess the [Z github](https://github.com/rupa/z), download the z.sh file and put it on your home directory(~).  

Add this line ```. ~/z.sh``` to your ```~/.zshrc``` file, so z can be run automatically every time you open the terminal, otherwise you have to run it manually.

#### Trash
Install [Trash](https://github.com/sindresorhus/trash).  
Used to send your files and directories to the trash instead of removing them permanently.

Run ```npm -v``` and if npm is installed you should see a number otherwise you can install [Node](https://nodejs.org/en/).   
```$ npm install --global trash-cli```


## Installation for Linux Users

* ```TODO```
