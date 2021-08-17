@echo off
REM Autor: Jose Conde 
REM Script para crear VM CentOS 32 bits

REM Color CMD
Color 0A

REM Agregamos ruta al PATH
PATH=%PATH%;C:\Program Files\Oracle\VirtualBox

REM Creamos maquina virtual CentOS
VboxManage createvm --name "CentOS x32" --register --ostype RedHat 

REM Añadios un Sata
VboxManage storagectl "CentOS x32" --name "SATA controller" --add sata --controller "IntelAHCI"

REM Creamos Disco Virtual de 20 GB
VboxManage createhd --filename "%HOMEDRIVE%\%HOMEPATH%\VirtualBox\CentOS x32 Bits\CentOS.vdi" --size 20000

REM Agregamos el disco al conector SATA
VboxManage storageattach "CentOS x32" --storagectl "SATA controller" --port 0 --device 0  --type hdd --medium "%HOMEDRIVE%\%HOMEPATH%\VirtualBox\CentOS x32 Bits\CentOS.vdi"

REM Agregamos un IDE
VboxManage storagectl "CentOS x32" --name "Controlador IDE" --add ide

REM Asingamos memoria RAM y VRAM
VboxManage modifyvm "CentOS x32" --memory 4096 --vram 128

REM Optimizamos VM
VboxManage modifyvm "CentOS x32" --ioapic on

REM Asignamos orden de arranque
VboxManage modifyvm "CentOS x32" --boot1 disk --boot2 dvd --boot3 none --boot4 none

REM Asignamos RED Adaptatador Puente
VboxManage modifyvm "CentOS x32" --nic1 bridged 
