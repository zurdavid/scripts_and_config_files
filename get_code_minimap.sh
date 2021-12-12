LOCATION=$(curl -s https://api.github.com/repos/wfxr/code-minimap/releases/latest \
| grep "tag_name" \
| awk '{print "https://github.com/wfxr/code-minimap/releases/download/" substr($2, 2, length($2)-3) "/code-minimap-" substr($2, 2, length($2)-3) "-x86_64-unknown-linux-gnu.tar.gz"}') \
; curl -L -o code-minimap.tar.gz $LOCATION

tar xzf code-minimap.tar.gz --directory ~/apps
ln -s $HOME/apps/code-minimaps $HOME/.local/bin/code-minimap
rm code-minimap.tar.gz
