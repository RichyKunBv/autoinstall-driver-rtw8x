#!/bin/bash

# Por si acaso xd.
set -e

VERDE='\033[0;32m'
AMA='\033[0;33m'
ROJO='\033[0;31m'
MAGENTA='\033[0;35m'
DEFAULT='\033[0m'



detectar_distribucion() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        DISTRO="$ID"
        
        # Detectar familia de distribución
        if [[ "$ID" == "debian" || "$ID_LIKE" == *"debian"* ]]; then
            DISTRO_FAMILIA="debian"
        elif [[ "$ID" == "fedora" || "$ID_LIKE" == *"fedora"* || "$ID" == "rhel" || "$ID" == "centos" ]]; then
            DISTRO_FAMILIA="fedora"
        elif [[ "$ID" == "arch" || "$ID_LIKE" == *"arch"* || "$ID" == "manjaro" ]]; then
            DISTRO_FAMILIA="arch"
        else
            DISTRO_FAMILIA="desconocida"
        fi
    elif [ -f /etc/redhat-release ]; then
        DISTRO="redhat"
        DISTRO_FAMILIA="fedora"
    elif [ -f /etc/arch-release ]; then
        DISTRO="arch"
        DISTRO_FAMILIA="arch"
    else
        DISTRO="desconocida"
        DISTRO_FAMILIA="desconocida"
    fi
    
    echo -e "${VERDE}Distribución detectada: $DISTRO (Familia: $DISTRO_FAMILIA)${DEFAULT}"
}

# --- SUDO obligatorio ---
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo -e "${ROJO}Error: Ejecuta este script con sudo.${DEFAULT}"
    exit 1
fi

# Detectar distribución al inicio
detectar_distribucion

# --- Comandos ---

function instalar_dependencias() {
    echo -e "\n${AMA}› Revisando que instalar...${DEFAULT}"
    
    case "$DISTRO_FAMILIA" in
        debian)
            sudo apt update
            sudo apt install -y git make dkms build-essential linux-headers-$(uname -r)
            echo -e "${VERDE}  Dependencias instaladas.${DEFAULT}"
            ;;
        fedora)
            if command -v dnf &> /dev/null; then
            sudo dnf install -y git make dkms kernel-devel kernel-headers
            sudo dnf group install development-tools
            fi
            echo -e "${VERDE}  Dependencias instaladas.${DEFAULT}"
            ;;
        arch)
            sudo pacman -S --noconfirm --needed git make dkms base-devel linux-headers
            echo -e "${VERDE}  Dependencias instaladas.${DEFAULT}"
            ;;
        *)
            echo -e "${ROJO}  Distribución no soportada para actualización.${DEFAULT}"
            ;;
    esac
}

# Que haces en mi codigo miamor? U//w//U

function instalar_driver() {
        echo "› Revisando algo..."
        rm -rf rtw89

        echo -e "${ROJO}  Clonando repo del driver.${DEFAULT}"
        git clone https://github.com/lwfinger/rtw89.git

        echo -e "${ROJO}  Accediendo al driver.${DEFAULT}"
        cd rtw88

        echo -e "${ROJO}  Ajustando el driver.${DEFAULT}"
        sudo make dkms-install
}


function verificador() {
        echo "› Verificando ando..."

if lsmod | grep -q "rtw89_core"; then
        echo "✅ Felicidades! ya tienes internet."
else
        echo "⚠️  Si reiniciaras la PC tendrias internet."
fi
}


while true; do
    echo -e "\n${VERDE}--- Asistente de Instalacion de Driver ---${DEFAULT}"
    echo -e "${VERDE}--- Distribución: $DISTRO (Familia: $DISTRO_FAMILIA) ---${DEFAULT}"
    echo "  1. Instalar Driver RT89"
    echo -e "  ${ROJO}X. Salir${DEFAULT}"
    read -p "  Selecciona una opción: " opcion

    case $opcion in
        1)
            clear
            detectar_distribucion
            instalar_dependencias
            instalar_driver
            verificador
            read -p "Presiona [Enter] para continuar..."
            clear
            ;;
        
        [xX])
            break 
            ;;

        *)
            echo -e "\n${ROJO}  Opción no válida. Intenta de nuevo.${DEFAULT}"
            sleep 1
            clear
            ;;

    esac
done
