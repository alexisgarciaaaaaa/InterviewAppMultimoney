# InterviewAppMultimoney

InterviewAppMultimoney es una aplicación iOS desarrollada en Swift que utiliza **Apollo GraphQL** para la gestión de datos.

## Características
- Implementación de **Apollo GraphQL** para la comunicación con la API.
- Arquitectura basada en **MVVM** con una capa de repositorios y servicios.
- Módulo **Core** que contiene la lógica de red y gestión de datos.

## Requisitos
- macOS con Xcode instalado.
- Swift Package Manager (SPM) para la gestión de dependencias.
- Apollo CLI para la generación de modelos GraphQL.

## Instalación
1. Clonar el repositorio:
   ```sh
   git clone https://github.com/alexisgarciaaaaaa/InterviewAppMultimoney.git
   cd InterviewAppMultimoney
   ```
2. Instalar las dependencias:
   ```sh
   swift package resolve
   ```
3. Configurar Apollo GraphQL:
   ```sh
   ./apollo-ios-cli generate
   ```
4. Abrir el proyecto en Xcode y compilar:
   ```sh
   open InterviewAppMultimoney.xcworkspace
   ```

## Estructura del Proyecto
```
InterviewAppMultimoney/
│── Core/
│   ├── Network/
│   │   ├── schema.graphqls
│   │   ├── Launches.graphql
│   │   ├── Ships.graphql
│   ├── Repositories/
│   │   ├── LaunchRepositories.swift
│   ├── Services/
│       ├── LaunchesService.swift
│── App/
│   ├── InterviewAppMultimoneyApp.swift
│── Components/
│    ├── LauchesCardsUI.swift
│    ├── RocketsCardsUI.swift
│    ├── BaseViewModel.swift
│── Features/
│    ├── TabBar/
│    ├── RocketList/
│    ├── LaunchList/
│── Utils/
│    ├── K.swift
```

## Uso
- La aplicación se conecta a un backend GraphQL y permite obtener información sobre **lanzamientos** y **naves espaciales**.
- Usa `ApolloClient` para las consultas

## Contribución
1. Hacer un fork del repositorio.
2. Crear una nueva rama (`feature/nueva-funcionalidad`).
3. Realizar un commit con los cambios (`git commit -m 'Añadir nueva funcionalidad'`).
4. Subir los cambios (`git push origin feature/nueva-funcionalidad`).
5. Crear un Pull Request.

## Licencia
Este proyecto está bajo la Licencia MIT.

