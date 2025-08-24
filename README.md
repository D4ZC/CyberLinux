# Kali Linux Pentesting Environment - Cyberpunk Japanese Theme

## 🚀 Descripción

Un entorno de pentesting personalizado para Kali Linux con un tema **Cyberpunk Japanese** inspirado en la estética futurista japonesa. Este repositorio incluye configuraciones optimizadas para herramientas de seguridad y hacking con una interfaz visual impactante.

## 🎨 Tema Cyberpunk Japanese

### Paleta de Colores
- **Rojo Neón**: `#FF0033`, `#FF0044`, `#FF0066`
- **Negro Tech**: `#000000`, `#0A0A0A`, `#1A1A1A`
- **Cyan Tech**: `#00FFFF`, `#00CCCC`
- **Azul Tech**: `#0066FF`, `#0044CC`

### Elementos Visuales
- ✨ Bordes con efectos de glitch y neón
- 🔥 Sombras rojas cibernéticas
- ⚡ Iconos futuristas y tecnológicos
- 🌟 Efectos de blur y transparencia
- 🎭 Estilo sutil pero elegante

## 🛠️ Componentes Configurados

### 1. **Polybar** - Barra de Estado
- Múltiples barras con información de red, VPN, IP objetivo
- Iconos cibernéticos para todas las funciones
- Colores neón para elementos activos
- Bordes redondeados con efectos de glitch

### 2. **Kitty** - Terminal
- Paleta de colores Cyberpunk completa
- Bordes rojos neón para ventanas activas
- Pestañas con estilo powerline
- Cursor personalizado con tema neón

### 3. **Neovim** - Editor de Código
- Tema Tokyo Dark para máxima compatibilidad
- Configuración optimizada para desarrollo
- Integración con el tema general

### 4. **Picom** - Compositor de Ventanas
- Sombras rojas neón personalizadas
- Efectos de blur cibernéticos
- Bordes redondeados con radio aumentado
- Transiciones suaves y elegantes

### 5. **Rofi** - Lanzador de Aplicaciones
- Interfaz Cyberpunk con bordes rojos
- Colores neón para elementos seleccionados
- Bordes redondeados y efectos visuales

### 6. **BSPWM** - Gestor de Ventanas
- Bordes rojos neón para ventanas activas
- Espaciado optimizado para el tema
- Colores de feedback personalizados

## 🚀 Instalación

1. **Clonar el repositorio:**
```bash
git clone https://github.com/tu-usuario/Kali-Linux-Environment-Pentesting.git
cd Kali-Linux-Environment-Pentesting
```

2. **Instalar dependencias:**
```bash
sudo apt update
sudo apt install -y polybar kitty neovim picom rofi bspwm sxhkd feh
```

3. **Instalar fuentes:**
```bash
# Copiar fuentes al directorio del sistema
sudo cp -r fonts/* /usr/share/fonts/
fc-cache -fv
```

4. **Configurar componentes:**
```bash
# Polybar
cp -r polybar ~/.config/

# Kitty
cp -r kitty ~/.config/

# Neovim
cp -r nvim ~/.config/

# Picom
cp -r picom ~/.config/

# Rofi
cp -r rofi ~/.config/

# BSPWM
cp -r bspwm ~/.config/

# SXHKD
cp -r sxhkd ~/.config/
```

5. **Iniciar BSPWM:**
```bash
startx
```

## 🎯 Características de Pentesting

- **Monitoreo de Red**: Barras de estado para ethernet, VPN y IP objetivo
- **Terminal Optimizada**: Kitty configurado para comandos de seguridad
- **Editor Avanzado**: Neovim con plugins para análisis de código
- **Gestión de Ventanas**: BSPWM para organización eficiente de herramientas
- **Lanzador Rápido**: Rofi para acceso instantáneo a aplicaciones

## 🔧 Personalización

### Cambiar Colores
Edita `polybar/colors.ini` para modificar la paleta de colores:
```ini
[color]
bg = #0A0A0A          # Fondo principal
fg = #FF0033          # Texto principal
ac = #FF0044          # Acento
red-glow = #FF0066    # Resplandor rojo
```

### Modificar Efectos
Ajusta `picom/picom.conf` para efectos visuales:
```ini
shadow-red = .8       # Intensidad del rojo en sombras
blur-strength = 4     # Fuerza del blur
corner-radius = 25    # Radio de esquinas
```

## 📱 Compatibilidad

- **Sistema Operativo**: Kali Linux 2023.x+
- **Entorno de Escritorio**: BSPWM
- **Gestor de Ventanas**: BSPWM
- **Compositor**: Picom
- **Terminal**: Kitty
- **Editor**: Neovim

## 🎨 Capturas de Pantalla

El tema incluye:
- Barras de estado con información de red en tiempo real
- Terminal con colores neón cibernéticos
- Ventanas con bordes rojos y efectos de sombra
- Lanzador de aplicaciones con estilo futurista
- Gestión de ventanas optimizada para pentesting

## 🤝 Contribuciones

¡Las contribuciones son bienvenidas! Si tienes ideas para mejorar el tema o agregar funcionalidades:

1. Fork el proyecto
2. Crea una rama para tu feature
3. Commit tus cambios
4. Push a la rama
5. Abre un Pull Request

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver `LICENSE` para más detalles.

## 🙏 Agradecimientos

- Inspirado en la estética Cyberpunk Japanese
- Basado en configuraciones de la comunidad Linux
- Optimizado para entornos de pentesting y seguridad

---

**⚡ Hack the Planet with Style! ⚡**
