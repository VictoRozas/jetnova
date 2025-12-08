# Manual de uso de GitHub – Proyecto Jetnova

## 1. Objetivo
Este manual describe el flujo de trabajo en GitHub para el desarrollo del sistema Jetnova.
Su finalidad es estandarizar la gestión de versiones, ramas y despliegues del equipo.

## 2. Estructura del repositorio
El repositorio está organizado de la siguiente manera:
- `/backend`: contiene el servidor en Flask que expone la API de consulta de vuelos.
- `/img`: imágenes utilizadas por el frontend.
- `/`: raíz del proyecto con páginas HTML y scripts JS del frontend.
- `/.github/workflows`: scripts de GitHub Actions para CI/CD.
- `/docs/manual-github`: documentación del flujo de trabajo en GitHub.

## 3. Ramas utilizadas
- `main`: rama estable. Contiene la versión final desplegada en GitHub Pages.
- `develop` (si la usan): rama de integración donde se juntan las features antes de pasar a main.
- `feature/*`: ramas para nuevas funcionalidades (ej: feature/reservas, feature/pago).

## 4. Flujo de trabajo del equipo
1. Cada desarrollador crea una rama feature desde develop (o main si no usan develop).
2. Se implementa la funcionalidad.
3. Se realizan commits con mensajes claros.
4. Se sube la rama al repositorio remoto.
5. Se crea un Pull Request para revisión.
6. Tras la aprobación, se hace merge a develop o main.
7. Al hacer merge a main se ejecuta el CD y se despliega automaticamente.

## 5. Crear una rama feature
```bash
git checkout main
git pull
git checkout -b feature/nombre-funcionalidad
