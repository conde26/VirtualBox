@echo off
REM Autor: Jose Conde 
REM Script para crear VM Ubuntu 64 bits

REM Color CMD
Color 0A

REM Agregamos ruta al PATH
PATH=%PATH%;C:\Program Files\Oracle\VirtualBox

REM Creamos maquina virtual Ubuntu
VboxManage createvm --name "Ubuntu x64" --register --ostype "Ubuntu_64"

REM Añadios un Sata
VboxManage storagectl "Ubuntu x64" --name "SATA controller" --add sata --controller "IntelAHCI"

REM Creamos Disco Virtual de 20 GB
VboxManage createhd --filename "%HOMEDRIVE%\%HOMEPATH%\VirtualBox\Ubuntu x64 Bits\Ubuntu.vdi" --size 20000

REM Agregamos el disco al conector SATA
VboxManage storageattach "Ubuntu x64" --storagectl "SATA controller" --port 0 --device 0  --type hdd --medium "%HOMEDRIVE%\%HOMEPATH%\VirtualBox\Ubuntu x64 Bits\Ubuntu.vdi"

REM Agregamos un IDE
VboxManage storagectl "Ubuntu x64" --name "Controlador IDE" --add ide

REM Asingamos memoria RAM y VRAM
VboxManage modifyvm "Ubuntu x64" --memory 4096 --vram 128

REM Optimizamos VM
VboxManage modifyvm "Ubuntu x64" --ioapic on

REM Asignamos orden de arranque
VboxManage modifyvm "Ubuntu x64" --boot1 disk --boot2 dvd --boot3 none --boot4 none

REM Asignamos RED Adaptatador Puente
VboxManage modifyvm "Ubuntu x64" --nic1 bridged 
