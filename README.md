# 🚀 Pipeline de Deployment sin EC2

Este proyecto contiene una pipeline simple usando **GitHub Actions** que:

1. Lee la URL de un repositorio desde un archivo `config.properties`.
2. Clona ese repositorio privado.
3. Dependiendo de la configuración (`install=true|false`), ejecuta comandos de Terraform:
   - `install=true` → hace `terraform apply`.
   - `install=false` → hace `terraform destroy`.
   - `install` vacío o indefinido → no hace nada.
4. Opcionalmente, guarda los cambios del repo clonado y hace `git push --force`.

Todo esto se ejecuta **directamente en GitHub Actions**, sin necesidad de una instancia EC2.

---

## 📂 Estructura del proyecto

```bash
.
├── .github
│   └── workflows
│       └── deploy.yml          # Pipeline de GitHub Actions
├── config
│   └── config.properties       # Properties con la conf del repo que clona y su comportamiento
├── LICENSE.md
└── README.md

```

## ⚙️ Requisitos

- GitHub Actions habilitado.
- Token de acceso personal con permisos a repositorios privados (como REPO_ACCESS_TOKEN).
- Terraform configurado en el repositorio clonado.
- Archivo config/config.properties correctamente definido.

## 🔐 Configuración de Secrets

En tu repositorio de GitHub, ve a `Settings > Secrets and variables > Actions` y añade:

| Nombre del Secret   | Descripción                                                                |
|---------------------|----------------------------------------------------------------------------|
| `REPO_ACCESS_TOKEN` | Token de acceso a GitHub con permisos para clonar repos privados           |

## 🧩 config.properties – Ejemplo

```bash
# URL del repositorio privado a clonar
REPO_URL=https://github.com/tu-usuario/otro-repo.git

# Controla si se aplica, destruye o se omite la ejecución de Terraform
# Valores válidos:
#   install=true   -> terraform init + apply
#   install=false  -> terraform destroy
#   install=       -> (vacío o no definido) no ejecuta nada
install=true

```

## 🚀 Cómo funciona

Cada vez que haces push a un tag, GitHub Actions:

1. Lee el archivo `config/config.properties`.
2. Extrae la URL del repositorio a clonar (`REPO_URL`).
3. Clona el repositorio usando un token secreto.
4. Si `install=true`, hace `terraform apply`.
5. Si `install=false`, hace `terraform destroy`.
6. Si hay cambios en el repositorio clonado, hace `git commit` y `push --force`.

## 🧪 Ejemplo de ejecución manual (en local)

```bash
# Leer la URL
cat config/config.properties

# Clonar el repo
git clone https://github.com/tu-usuario/otro-repo.git

# Ejecutar Terraform (según valor de install)
cd otro-repo
terraform init
terraform apply -auto-approve   # o destroy, según config

```
## 📄 Licencia

Este proyecto está bajo la licencia MIT. Consulta el archivo `LICENSE` para más detalles.


# MIT License
# Copyright (c) 2025 Jose Magariño
# See LICENSE file for more details.
