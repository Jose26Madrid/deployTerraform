# 🚀 EC2 Pipeline Deployment

Este proyecto contiene una pipeline simple usando **GitHub Actions** que:

1. Clona este repositorio en una instancia EC2.
2. Ejecuta un comando separado que imprime `hola mundo` en esa misma instancia.

Todo se realiza de forma remota a través de **SSH**, usando claves privadas seguras gestionadas como *secrets* de GitHub.

## 📂 Estructura del proyecto

```bash
.
├── .github
│   └── workflows
│       └── deploy.yml          # Pipeline de GitHub Actions
├── scripts
│   ├── clone_repo.sh           # Script para clonar el repositorio en EC2
│   └── say_hello.sh            # Script para imprimir "hola mundo"
└── README.md

```

## ⚙️ Requisitos

- Instancia EC2 en funcionamiento (con acceso por SSH).
- GitHub Actions habilitado.
- Clave privada `.pem` con permisos SSH al EC2.
- Repositorio remoto accesible por HTTPS.
- Puertos abiertos: `22` (SSH).

## 🔐 Configuración de Secrets

En tu repositorio de GitHub, ve a `Settings > Secrets and variables > Actions` y añade:

| Nombre del Secret | Descripción                                           |
|-------------------|-------------------------------------------------------|
| `EC2_HOST`        | IP pública o DNS de tu instancia EC2                 |
| `EC2_SSH_KEY`     | Clave privada SSH (`.pem`) para acceder al EC2       |

## 🚀 Cómo funciona

Cada vez que haces push a la rama `main`, GitHub Actions:

1. Se conecta por SSH a tu instancia EC2.
2. Ejecuta `scripts/clone_repo.sh`, que clona este repositorio dentro del EC2.
3. Luego ejecuta `scripts/say_hello.sh`, que imprime `hola mundo`.

Todo esto se define en el archivo [`deploy.yml`](.github/workflows/deploy.yml).

## 🧪 Prueba manual

También puedes ejecutar los scripts directamente en tu EC2 para probarlos:

```bash
# Clonar el repo (dentro de EC2)
bash scripts/clone_repo.sh https://github.com/tu-usuario/tu-repo.git ~/mi-repo

# Ejecutar hola mundo
bash scripts/say_hello.sh


```
## 📄 Licencia

Este proyecto está bajo la licencia MIT. Consulta el archivo `LICENSE` para más detalles.
