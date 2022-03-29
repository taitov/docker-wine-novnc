# docker-wine-novnc
```
docker run --rm -it -p 8080:8080 taitov/wine-novnc
```
```
docker run --rm -it -p 8080:8080 -v /path/to/workdir:/application -e APPLICATION=helloworld.exe taitov/wine-novnc
```
```
docker run --rm -it -p 8080:8080 -v /path/to/workdir:/application -e APPLICATION=helloworld.exe -e WORKDIR=/application/some_dir -e DISPLAY_WIDTH=1024 -e DISPLAY_HEIGHT=800 taitov/wine-novnc
```
```
docker run --rm -it -p 8080:8080 -e COMMAND="wine explorer /desktop=application,\${DISPLAY_WIDTH}x\${DISPLAY_HEIGHT} regedit" taitov/wine-novnc
```
