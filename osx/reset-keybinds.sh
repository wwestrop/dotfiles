# All applications
defaults write -g NSUserKeyEquivalents "Emoji & Symbols" "^."
defaults write -g NSUserKeyEquivalents "Hide Google Chrome" "@~^$h"
defaults write -g NSUserKeyEquivalents "Hide JetBrains Rider" "@~^$h"
defaults write -g NSUserKeyEquivalents "Hide Visual Studio Code" "@~^$h"
defaults write -g NSUserKeyEquivalents "Redo" "@y"
defaults write -g NSUserKeyEquivalents "Lock Screen" "^L"


# Chrome
defaults write com.google.chrome NSUserKeyEquivalents -dict-add "Enter Full Screen" "\Uf70e"    # F11
defaults write com.google.chrome NSUserKeyEquivalents -dict-add "Exit Full Screen" "\Uf70e"     # F11
defaults write com.google.chrome NSUserKeyEquivalents -dict-add "Open Location..." "\Uf709"     # F6
defaults write com.google.chrome NSUserKeyEquivalents -dict-add "Reload This Page" "\Uf708"     # F5
defaults write com.google.chrome NSUserKeyEquivalents -dict-add "Show full history" "@h"        # Cmd+H


# Finder
defaults write com.apple.finder NSUserKeyEquivalents -dict-add "Rename" "\Uf705"


# Sourcetree
defaults write com.torusknot.SourceTreeNotMAS NSUserKeyEquivalents -dict-add "Refresh" "\Uf708"


# iTerm
defaults write com.googlecode.iterm2 NSUserKeyEquivalents -dict-add "Split Vertically with Current Profile" "@~^$\U2192"



# defaults write com.apple.universalaccess com.apple.custommenu.apps -array-add NSGlobalDomain
# defaults write com.apple.universalaccess com.apple.custommenu.apps -array-add com.google.chrome
# defaults write com.apple.universalaccess com.apple.custommenu.apps -array-add com.apple.finder
# defaults write com.apple.universalaccess com.apple.custommenu.apps -array-add com.googlecode.iterm2


killall cfprefsd -u
# /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u