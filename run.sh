cd $GOPATH/src/github.com/edgexfoundry-holding/device-camera-go

# Alternately use go run main.go or launch the binary from 'make build'
#go run main.go  \
./device-camera-go \
 -source onvif:80 \
 -source axis:554 \
 -interval 30 \
 -ip 192.168.100.1-250 \
 -scanduration 15s
