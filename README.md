# UserMaster - App Base con Clean Architecture   valery vergara gonzalez 

##  Descripción
**UserMaster** es una aplicación móvil y web desarrollada en Flutter que implementa los principios de **Clean Architecture**, asegurando modularidad, separación de capas y mantenibilidad en la interfaz de usuario[cite: 2]. La aplicación simula el ciclo de autenticación y navegación mediante control de estados locales y temporizadores asíncronos (`Future.delayed`) sin requerir un backend externo[cite: 2].

---

##  Objetivos
* Estructurar el software siguiendo las capas de Clean Architecture: `core`, `data`, `domain` y `presentation`[cite: 1].
* Centralizar la gestión de temas y colores dentro del módulo `app_colors.dart`[cite: 5].
* Administrar rutas nombradas centralizadas en `app_routes.dart` para una navegación desacoplada[cite: 5].
* Construir flujos completos de usuario: pantalla de inicio (Splash Screen con duración de 3 segundos), Inicio de sesión (con simulación de 2 segundos), Registro, Recuperación de contraseña y Dashboard con barra de navegación inferior[cite: 3, 4].
* Configurar integración y entrega continua (CI/CD) automatizada mediante GitHub Actions hacia GitHub Pages[cite: 5].

---

##  Tech Stack
* **Lenguaje:** [Dart](https://dart.dev/)[cite: 1]
* **Framework:** [Flutter](https://flutter.dev/) (Web & Mobile)[cite: 2, 5]
* **Control de versiones:** Git & [GitHub](https://github.com/)[cite: 2, 5]
* **CI/CD:** GitHub Actions & GitHub Pages[cite: 5]

---

##  Estructura del Proyecto
```text
fluttertwo/
├── lib/
│   ├── core/                     # Núcleo y constantes compartidas
│   │   ├── constants/            # Colores (app_colors.dart) y configuraciones
│   │   ├── errors/               # Manejo de fallos y excepciones
│   │   ├── network/              # Conexiones de red
│   │   ├── themes/               # Temas de interfaz
│   │   ├── utils/                # Utilidades y formateadores
│   │   └── widgets/              # Componentes comunes transversales
│   │
│   ├── data/                     # Capa de datos
│   │   ├── datasources/          # Orígenes de datos
│   │   ├── models/               # Modelos de datos
│   │   ├── repositories/         # Implementaciones de repositorios
│   │   └── mappers/              # Conversión entre modelos y entidades
│   │
│   ├── domain/                   # Capa de dominio (reglas de negocio)
│   │   ├── entities/             # Entidades del negocio
│   │   ├── repositories/         # Contratos e interfaces
│   │   ├── usecases/             # Casos de uso
│   │   └── exceptions/           # Excepciones del dominio
│   │
│   ├── presentation/             # Capa de interfaz de usuario
│   │   ├── blocs/                # Gestión de estado
│   │   ├── pages/                # Vistas: Splash, Login, Register, Forgot Password, Dashboard, Profile
│   │   ├── widgets/              # Componentes reutilizables de UI
│   │   ├── routes/               # Enrutamiento centralizado (app_routes.dart)
│   │   └── themes/               # Temas visuales específicos
│   │
│   ├── main.dart                 # Punto de arranque
│   └── app.dart                  # Configuración base
│
├── test/                         # Pruebas unitarias y de widgets
├── assets/                       # Recursos estáticos e imágenes
├── pubspec.yaml                  # Configuración de dependencias
└── README.md                     # Documentación técnica
