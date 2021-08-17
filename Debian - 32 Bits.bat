@echo off
REM Autor: Jose Conde 
REM Script para crear VM Debian 32 bits

REM Color CMD
Color 0A

REM Agregamos ruta al PATH
PATH=%PATH%;C:\Program Files\Oracle\VirtualBox

REM Creamos maquina virtual Debian
VboxManage createvm --name "Debian x32" --register --ostype Debian 

REM Añadios un Sata
VboxManage storagectl "Debian x32" --name "SATA controller" --add sata --controller "IntelAHCI"

REM Creamos Disco Virtual de 20 GB
VboxManage createhd --filename "%HOMEDRIVE%\%HOMEPATH%\VirtualBox\Debian x32 Bits\Debian.vdi" --size 20000

REM Agregamos el disco al conector SATA
VboxManage storageattach "Debian x32" --storagectl "SATA controller" --port 0 --device 0  --type hdd --medium "%HOMEDRIVE%\%HOMEPATH%\VirtualBox\Debian x32 Bits\Debian.vdi"

REM Agregamos un IDE
VboxManage storagectl "Debian x32" --name "Controlador IDE" --add ide

REM Asingamos memoria RAM y VRAM
VboxManage modifyvm "Debian x32" --memory 2048 --vram 128

REM Optimizamos VM
VboxManage modifyvm "Debian x32" --ioapic on

REM Asignamos orden de arranque
VboxManage modifyvm "Debian x32" --boot1 disk --boot2 dvd --boot3 none --boot4 none

REM Asignamos RED Adaptatador Puente
VboxManage modifyvm "Debian x32" --nic1 bridged 
