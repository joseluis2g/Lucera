rm -r build
sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
sudo add-apt-repository ppa:apokluda/boost1.53 -y
sudo apt-get update -qq
sudo apt-get install -qq g++-4.8;
export CXX="g++-4.8" CC="gcc-4.8";
sudo apt-get -y install libboost1.53-dev libboost-system1.53-dev liblua5.2-dev libgmp3-dev libmysqlclient-dev
mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=Release ..
make
echo "Sucesso!"
