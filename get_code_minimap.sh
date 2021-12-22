LOCATION=$(curl -s https://api.github.com/repos/wfxr/code-minimap/releases/latest \
| grep "tag_name" \
| awk '{print "https://github.com/wfxr/code-minimap/releases/download/" substr($2, 2, length($2)-3) "/code-minimap-" substr($2, 2, length($2)-3) "-x86_64-unknown-linux-gnu.tar.gz"}') \
; curl -L -o code-minimap.tar.gz $LOCATION

APPDIR=$HOME/apps
mkdir -p $APPDIR
tar xzf code-minimap.tar.gz --directory $APPDIR
# minimap folder has version info in its name
# the following linese remove the version info
DIR=$(ls $APPDIR | grep code-minimap) 
rm -rf $APPDIR/code-minimap
mv $APPDIR/$DIR $APPDIR/code-minimap -T

ln -s -f $HOME/apps/code-minimap/code-minimap $HOME/.local/bin/code-minimap
rm code-minimap.tar.gz
