#!/bin/bash

# Kali Linux Environment - Cyberpunk Japanese Theme Installer
# Script de instalación automática para el tema Cyberpunk Japanese

echo "⚡ ======================================== ⚡"
echo "🚀 INSTALADOR DEL TEMA CYBERPUNK JAPANESE 🚀"
echo "⚡ ======================================== ⚡"
echo ""

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Función para imprimir con colores
print_status() {
    echo -e "${CYAN}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Verificar si estamos en Kali Linux
check_kali() {
    if [[ -f /etc/os-release ]]; then
        . /etc/os-release
        if [[ "$ID" == "kali" ]]; then
            print_success "Kali Linux detectado: $VERSION"
            return 0
        else
            print_warning "Este script está diseñado para Kali Linux, pero detectamos: $ID"
            read -p "¿Deseas continuar de todas formas? (y/N): " -n 1 -r
            echo
            if [[ $REPLY =~ ^[Yy]$ ]]; then
                return 0
            else
                exit 1
            fi
        fi
    else
        print_error "No se pudo detectar el sistema operativo"
        exit 1
    fi
}

# Actualizar sistema
update_system() {
    print_status "Actualizando el sistema..."
    sudo apt update && sudo apt upgrade -y
    print_success "Sistema actualizado"
}

# Instalar dependencias
install_dependencies() {
    print_status "Instalando dependencias..."
    
    # Dependencias principales
    sudo apt install -y \
        polybar \
        kitty \
        neovim \
        picom \
        rofi \
        bspwm \
        sxhkd \
        feh \
        fonts-hack-nerd \
        fonts-iosevka-nerd \
        fonts-source-code-pro \
        fonts-montserrat \
        fonts-helvetica \
        fonts-hurmit-nerd
    
    print_success "Dependencias instaladas"
}

# Instalar fuentes personalizadas
install_fonts() {
    print_status "Instalando fuentes personalizadas..."
    
    # Crear directorio de fuentes si no existe
    sudo mkdir -p /usr/share/fonts/cyberpunk
    
    # Copiar fuentes
    sudo cp -r fonts/* /usr/share/fonts/cyberpunk/
    
    # Actualizar caché de fuentes
    sudo fc-cache -fv
    
    print_success "Fuentes instaladas y caché actualizado"
}

# Configurar componentes
setup_components() {
    print_status "Configurando componentes..."
    
    # Crear directorio de configuración si no existe
    mkdir -p ~/.config
    
    # Copiar configuraciones
    cp -r polybar ~/.config/
    cp -r kitty ~/.config/
    cp -r nvim ~/.config/
    cp -r picom ~/.config/
    cp -r rofi ~/.config/
    cp -r bspwm ~/.config/
    cp -r sxhkd ~/.config/
    
    # Hacer ejecutables los scripts
    chmod +x ~/.config/bspwm/bspwmrc
    chmod +x ~/.config/bspwm/scripts/*.sh
    chmod +x ~/.config/polybar/launch.sh
    chmod +x ~/.config/polybar/scripts/*
    
    print_success "Componentes configurados"
}

# Configurar autostart
setup_autostart() {
    print_status "Configurando autostart..."
    
    # Crear archivo de autostart para BSPWM
    mkdir -p ~/.config/autostart
    
    cat > ~/.config/autostart/bspwm.desktop << EOF
[Desktop Entry]
Type=Application
Name=BSPWM
Exec=bspwm
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
EOF
    
    print_success "Autostart configurado"
}

# Crear archivo de configuración de sesión
setup_session() {
    print_status "Configurando sesión..."
    
    # Crear archivo .xinitrc si no existe
    if [[ ! -f ~/.xinitrc ]]; then
        cat > ~/.xinitrc << EOF
#!/bin/bash
# Kali Linux Environment - Cyberpunk Japanese Theme
# Archivo de inicio de sesión X

# Iniciar BSPWM
exec bspwm
EOF
        chmod +x ~/.xinitrc
    fi
    
    print_success "Sesión configurada"
}

# Verificar instalación
verify_installation() {
    print_status "Verificando instalación..."
    
    local errors=0
    
    # Verificar archivos de configuración
    if [[ ! -d ~/.config/polybar ]]; then
        print_error "Polybar no está configurado"
        ((errors++))
    fi
    
    if [[ ! -d ~/.config/kitty ]]; then
        print_error "Kitty no está configurado"
        ((errors++))
    fi
    
    if [[ ! -d ~/.config/nvim ]]; then
        print_error "Neovim no está configurado"
        ((errors++))
    fi
    
    if [[ ! -d ~/.config/picom ]]; then
        print_error "Picom no está configurado"
        ((errors++))
    fi
    
    if [[ ! -d ~/.config/rofi ]]; then
        print_error "Rofi no está configurado"
        ((errors++))
    fi
    
    if [[ ! -d ~/.config/bspwm ]]; then
        print_error "BSPWM no está configurado"
        ((errors++))
    fi
    
    if [[ $errors -eq 0 ]]; then
        print_success "¡Instalación completada exitosamente!"
        return 0
    else
        print_error "Se encontraron $errors errores en la instalación"
        return 1
    fi
}

# Mostrar instrucciones post-instalación
show_post_install() {
    echo ""
    echo "⚡ ======================================== ⚡"
    echo "🎉 ¡INSTALACIÓN COMPLETADA! 🎉"
    echo "⚡ ======================================== ⚡"
    echo ""
    echo "🚀 Para iniciar tu nuevo entorno Cyberpunk Japanese:"
    echo ""
    echo "   1. Cierra tu sesión actual"
    echo "   2. En la pantalla de login, selecciona 'BSPWM'"
    echo "   3. O ejecuta desde terminal: startx"
    echo ""
    echo "🔧 Comandos útiles:"
    echo "   - Super + Enter: Nueva terminal"
    echo "   - Super + D: Lanzador de aplicaciones"
    echo "   - Super + Q: Cerrar ventana"
    echo "   - Super + Shift + Q: Cerrar aplicación"
    echo ""
    echo "📁 Configuraciones ubicadas en: ~/.config/"
    echo "🎨 Personaliza colores en: ~/.config/polybar/colors.ini"
    echo ""
    echo "⚡ ¡Hack the Planet with Style! ⚡"
    echo ""
}

# Función principal
main() {
    echo "Iniciando instalación del tema Cyberpunk Japanese..."
    echo ""
    
    # Verificar sistema
    check_kali
    
    # Actualizar sistema
    update_system
    
    # Instalar dependencias
    install_dependencies
    
    # Instalar fuentes
    install_fonts
    
    # Configurar componentes
    setup_components
    
    # Configurar autostart
    setup_autostart
    
    # Configurar sesión
    setup_session
    
    # Verificar instalación
    if verify_installation; then
        show_post_install
    else
        print_error "La instalación no se completó correctamente"
        exit 1
    fi
}

# Ejecutar función principal
main "$@"
