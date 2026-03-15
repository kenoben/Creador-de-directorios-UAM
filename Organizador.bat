@echo off
setlocal enabledelayedexpansion
:: Configuración de codificación para UTF-8 (acentos y emojis)
chcp 65001 >nul

:: Definición del carácter Escape para colores ANSI
for /f "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do set "ESC=%%b"

:: Definición de Paleta Cromática (RGB)
set "C_PURP=%ESC%[38;2;109;68;166m"
set "C_BLUE=%ESC%[38;2;3;90;166m"
set "C_GREN=%ESC%[38;2;9;166;3m"
set "C_YELL=%ESC%[38;2;242;203;5m"
set "C_ORAN=%ESC%[38;2;242;145;27m"
set "RESET=%ESC%[0m"

:menu_inicio
cls
echo %C_BLUE%
echo UAM ARQUITECTURA
echo.                                         
echo %RESET%
echo %C_PURP%======================================================================
echo           GESTIÓN DE DIRECTORIOS ACADÉMICOS - ARQUITECTURA
echo ======================================================================%RESET%
echo %C_YELL% SELECCIONE EL AÑO LECTIVO:%RESET%
echo  1. Primer Año
echo  2. Segundo Año
echo  3. Tercer Año
echo.
set /p anio="%C_ORAN% ^> Escriba el número y después presione la tecla ENTER/INTRO %RESET%"

if "%anio%"=="1" goto anio1
if "%anio%"=="2" goto anio2
if "%anio%"=="3" goto anio3
echo Opción inválida.
pause
goto menu_inicio

:anio1
cls
echo %C_PURP%======================================================================
echo           SELECCIÓN DE CUATRIMESTRE - PRIMER AÑO
echo ======================================================================%RESET%
echo  1. Primer Cuatrimestre
echo  2. Segundo Cuatrimestre
echo  3. Tercer Cuatrimestre
echo.
set /p cuat="%C_ORAN% ^> Escriba el número y después presione la tecla ENTER/INTRO %RESET%"
if "%cuat%"=="1" goto c1
if "%cuat%"=="2" goto c2
if "%cuat%"=="3" goto c3
goto anio1

:anio2
cls
echo %C_PURP%======================================================================
echo           SELECCIÓN DE CUATRIMESTRE - SEGUNDO AÑO
echo ======================================================================%RESET%
echo  4. Cuarto Cuatrimestre
echo  5. Quinto Cuatrimestre
echo  6. Sexto Cuatrimestre
echo.
set /p cuat="%C_ORAN% ^> Escriba el número y después presione la tecla ENTER/INTRO %RESET%"
if "%cuat%"=="4" goto c4
if "%cuat%"=="5" goto c5
if "%cuat%"=="6" goto c6
goto anio2

:anio3
cls
echo %C_PURP%======================================================================
echo           SELECCIÓN DE CUATRIMESTRE - TERCER AÑO
echo ======================================================================%RESET%
echo  7. Séptimo Cuatrimestre
echo  8. Octavo Cuatrimestre
echo  9. Noveno Cuatrimestre
echo.
set /p cuat="%C_ORAN% ^> Escriba el número y después presione la tecla ENTER/INTRO %RESET%"
if "%cuat%"=="7" goto c7
if "%cuat%"=="8" goto c8
if "%cuat%"=="9" goto c9
goto anio3

:c1
set materias="Periodos y Determinantes Históricos de la Arquitectura" "Introducción a la Teoría de la Arquitectura" "Dibujo Arquitectónico y Maquetismo" "Iniciación al Proyecto" "Sistemas Constructivos" "Dibujo Bidimensional por Computadoras"
goto crear

:c2
set materias="Fundamentos de Estructura" "Arquitectura Mesoamericana y del Siglo XVI al XVIII" "Metodología del Programa Arquitectónico" "Axonometría e Isométricos" "Diseño Arquitectónico I" "Suelos, Cimentaciones, Muros y lozas" "Dibujo Tridimensional por Computadora"
goto crear

:c3
set materias="Iniciación al Criterio Estructural" "Análisis Morfológico" "Dibujo en Croquis y Claroscuro" "Diseño Arquitectónico II" "Geometría Plana y del Espacio" "Cimentaciones Profundas y Marcos" "Dibujo por Computadora I"
goto crear

:c4
set materias="Criterio Estructural" "Principios de Urbanismo" "Dibujo en Color" "Diseño Arquitectónico III" "Superficies y Formas Geométricas" "Megaconstrucciones y Prefabricación" "Dibujo por Computadora II"
goto crear

:c5
set materias="Arquitectura del Siglo XIX y XX" "Arquitectura y Ciudad" "Taller de Proyectos I" "Instalaciones Básicas" "Iniciación a la Administración de Obra" "Presentación Final por Computadora I"
goto crear

:c6
set materias="La Participación en el Diseño Urbano y Arquitectura I" "Diseño Urbano Ambiental" "Taller de Proyectos II" "Instalaciones Especiales" "Costos y Programación de Obra" "Presentación Final por Computadora II"
goto crear

:c7
set materias="La Participación en el Diseño Urbano y Arquitectura II" "Diseño de Interiores" "Taller de Proyectos III" "Paisajismo I" "Iluminación de Arquitectura" "Arquitectura Bioclimática"
goto crear

:c8
set materias="Diseño de Exposiciones" "Seminario de Tesis I" "Paisajismo II" "Arquitectura y Medio Ambiente" "Edificios Inteligentes"
goto crear

:c9
set materias="Diseño de Oficinas" "Seminario de Tesis II" "Residencia Profesional"
goto crear

:crear
cls
:: Definir carpeta base según el cuatrimestre seleccionado
if "%cuat%"=="1" set "cuatrimestre=Primer Cuatrimestre"
if "%cuat%"=="2" set "cuatrimestre=Segundo Cuatrimestre"
if "%cuat%"=="3" set "cuatrimestre=Tercer Cuatrimestre"
if "%cuat%"=="4" set "cuatrimestre=Cuarto Cuatrimestre"
if "%cuat%"=="5" set "cuatrimestre=Quinto Cuatrimestre"
if "%cuat%"=="6" set "cuatrimestre=Sexto Cuatrimestre"
if "%cuat%"=="7" set "cuatrimestre=Séptimo Cuatrimestre"
if "%cuat%"=="8" set "cuatrimestre=Octavo Cuatrimestre"
if "%cuat%"=="9" set "cuatrimestre=Noveno Cuatrimestre"

mkdir "%cuatrimestre%" 2>nul

echo %C_YELL%RELACIÓN DE ASIGNATURAS A GENERAR (%cuatrimestre%):%RESET%
for %%m in (%materias%) do echo  %C_PURP%-%RESET% %%~m
echo.
set /p confirmar="%C_ORAN%¿Confirmar la creación de la infraestructura de carpetas? (S/N): %RESET%"
if /i "%confirmar%" neq "S" goto menu_inicio

for %%m in (%materias%) do (
    mkdir "%cuatrimestre%\%%~m\Trabajos de clase" 2>nul
    mkdir "%cuatrimestre%\%%~m\Proyectos" 2>nul
    mkdir "%cuatrimestre%\%%~m\Trabajo final" 2>nul
)

echo.
echo %C_GREN%Proceso finalizado exitosamente.%RESET%
echo.
echo %C_BLUE%Hecho con ❤️ por Esteban Camacho Leines%RESET%
echo.
pause
exit