# Variable Compleja

## Colaboradores
- Nombre 1
- Nombre 2  

## Estructura del proyecto
- `main.tex` - Documento principal, contiene las llamadas a las demás partes del documento.
- `preamble.tex` - Paquetes utilizados, índice enespañol, y geometría (márgenes) de páginas.
- `appendices` - Apéndices 
- `chapters/` - Capítulos del artículo
- `chapters/chapter_n/` - Carpeta que contiene las secciones del Capítulo n.
- `images/` - Imágenes y gráficos
- `indices/` - Índices del documento.
- `styles/theoremstyle.tex` - Definición de /newcommands y /newtheorems 
- `styles/titlepage.tex` - Portada del documento
- `tikz_helpers/` - Funciones para generar figuras con Tikz. Ejemplo: Plano complejo, puntos, segmentos, etc.
- `references.bib` - Referencias bibliográficas

## Flujo de trabajo colaborativo
### Al iniciar tu sesión de trabajo:
1. Asegurar que tienes la versión más reciente:
- git checkout main
- git pull origin main

2. Crear/actualizar tu rama de trabajo:
- git checkout -b feature/mi-seccion

    O si ya existe: 
- git checkout feature/mi-seccion
- git rebase main  # Actualizar con cambios de main

### Mientras trabajas:
3. Hacer commits frecuentes y descriptivos. Por ejemplo:
- git add sections/01-introduction.tex
- git commit -m "feat: añadir párrafo sobre antecedentes históricos"

- git add figures/diagram1.png sections/01-introduction.tex
- git commit -m "feat: añadir diagrama explicativo en introducción"

4. Subir cambios a tu rama:
- git push origin feature/mi-seccion

### Al terminar tu sesión del día o cuando terminas una parte:
5. Actualizar con cambios de main antes de crear PR (Pull Request):
- git checkout main
- git pull origin main
- git checkout feature/mi-seccion
- git rebase main

6. Si hay conflictos, resolverlos y continuar:
- git add . && git rebase --continue

7. Subir cambios actualizados:
- git push origin feature/mi-seccion --force-with-lease

## Compilación
- Usar LaTeX Workshop en VS Code
- O compilar manualmente: `pdflatex main.tex`

## Estrategia para evitar conflictos en las ramas:
### I. Archivo de asignaciones 
- assignments.md
### II. Responsabilidades por archivo:

#### Persona 1: Juan
- sections/01-introduction.tex
- figures/intro-*

#### Persona 2: María  
- sections/02-methodology.tex
- figures/method-*

#### Persona 3: Carlos
- sections/03-results.tex
- figures/results-*

#### Persona 4: Ana
- sections/04-conclusions.tex
- bibliography.bib (coordinadora de referencias)

### III. Comunicación entre el equipo:
📢 AVISOS IMPORTANTES:
- "Voy a trabajar en introduction.tex las próximas 2 horas"
- "Terminé mi sección, PR listo para revisión"
- "Conflicto en bibliography.bib, coordinar con Ana"

### IV. Comandos de Seguridad
#### Verificar estado antes de trabajar
- git status
- git branch -v
- git log --oneline -5

#### Verificar que main está actualizado
- git fetch origin
- git status

#### Backup antes de operaciones arriesgadas
- git branch backup-$(date +%Y%m%d) 

#### Ver diferencias antes de hacer merge
- git diff main..feature/mi-seccion

### V. Manejo de Conflictos Comunes
#### Conflictos en bibliograpy.bib:
1. Una persona (Ana) se encarga de bibliography.bib
2. Otros envían referencias por separado

3. Crear archivo temporal para nuevas referencias
- echo "@article{nueva2024, title={...}}" >> new-refs.txt
- git add new-refs.txt
- git commit -m "refs: añadir referencia para sección metodología"

#### Resolución de Conflictos paso a paso:
 Cuando git rebase muestra conflictos:
- git status  # Ver archivos en conflicto

Abrir VS Code - GitLens mostrará opciones:
- Accept Current Change | Accept Incoming Change | Accept Both Changes

Después de resolver:
- git add .
- git rebase --continue

Si algo sale mal, volver al estado anterior:
- git rebase --abort  
