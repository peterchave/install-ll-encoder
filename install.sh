# Standard FFMPEG build requirements
sudo apt-get update -qq && sudo apt-get -y install \
  autoconf \
  automake \
  build-essential \
  cmake \
  git-core \
  libass-dev \
  libfreetype6-dev \
  libsdl2-dev \
  libtool \
  libva-dev \
  libvdpau-dev \
  libvorbis-dev \
  libxcb1-dev \
  libxcb-shm0-dev \
  libxcb-xfixes0-dev \
  texinfo \
  wget \
  zlib1g-dev

# Optional FFMPEG assemblers
sudo apt-get -y install nasm yasm libx264-dev

# Codec x264
sudo apt-get -y install libx264-dev

# Optional font library
sudo apt-get -y install fonts-freefont-ttf

# Get DASH-LL branch from github
git clone --branch dashll https://gitlab.com/fflabs/ffmpeg.git

# Configure, make and install it
cd ffmpeg
./configure --enable-gpl --enable-libx264 --enable-nonfree --enable-filter=drawtext --enable-libfreetype
make
sudo make install

# Download test clip
cd ..
wget https://moctodemo.akamaized.net/content/1080p29-15M-MostAwesomeGameFull.mp4

# Install PM2 to run it
sudo apt-get -y install npm
sudo npm install pm2@latest -g
pm2 start script.sh
pm2 save
pm2 startup
