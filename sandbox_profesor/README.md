# Taller Flutter - Programación Imperativa y Orientada a Objetos

Este repositorio contiene el taller base de prácticas de Flutter para la asignatura. Aquí trabajaremos estructuras de control, programación imperativa y clases en Dart. A lo largo del curso, este repositorio se irá actualizando con nuevas prácticas, ejemplos y ampliaciones.

## 1. Clona este proyecto usando un **fork**

Para trabajar sobre tu propia copia del taller:

1. Accede al repositorio original del taller:  
   https://github.com/CarlosBasulto/tallerflutter.git

2. Haz clic en el botón **Fork** (arriba a la derecha).

3. Selecciona tu cuenta personal. GitHub creará una copia del repositorio en tu cuenta.

4. Una vez hecho el fork, **clona tu fork localmente** en tu equipo con este comando:

   ```bash
   git clone https://github.com/TU_USUARIO/tallerflutter.git
   ```

   Reemplaza `TU_USUARIO` por tu nombre de usuario de GitHub.

## 2. Cómo mantener tu fork actualizado con el original

A lo largo del curso, el profesor actualizará el repositorio original. Para que tú puedas obtener los nuevos ejercicios o prácticas, sigue estos pasos.

### Solo se hace una vez: añadir el repositorio original como remoto

Abre una terminal dentro de tu carpeta del proyecto clonado y ejecuta:

```bash
git remote add upstream https://github.com/CarlosBasulto/tallerflutter.git
```

Este comando te permite tener acceso al repositorio original para poder sincronizar los cambios más adelante.

### Cada vez que el profesor publique nuevos cambios

1. Descarga los cambios del repositorio original:

   ```bash
   git fetch upstream
   ```

2. Mezcla esos cambios en tu rama principal:

   ```bash
   git merge upstream/main
   ```

3. (Opcional) Si tienes conflictos, resuélvelos y guarda los cambios. Luego haz commit.

4. (Opcional) Puedes subir tus cambios actualizados a tu fork en GitHub:

   ```bash
   git push origin main
   ```

## Recomendaciones

- No trabajes directamente en la rama `main`. Puedes crear ramas para cada práctica si lo deseas.
- Repite los pasos anteriores cada vez que el profesor indique que se ha actualizado el taller.
- Si tienes problemas al hacer `merge`, consulta antes de modificar el código manualmente.

## Autor del taller

Repositorio original del profesor:  
https://github.com/CarlosBasulto/tallerflutter.git

## Organización del espacio de trabajo: uso del sandbox

Para evitar conflictos al sincronizar los forks de los alumnos con el repositorio original del profesor, se ha definido una estructura de trabajo basada en carpetas personales.

### Carpeta `sandbox_profesor`

En este repositorio original existe una carpeta llamada:

```
sandbox_profesor/
```

Esta carpeta contiene ejemplos y soluciones del profesor. **No debe ser modificada ni copiada directamente por los alumnos.**

---

### Instrucciones para los alumnos

Cada alumno debe crear en su fork una carpeta propia con el siguiente formato:

```
sandbox_nombreusuario/
```

Por ejemplo, si tu usuario de GitHub es `pablo123`, tu carpeta de trabajo deberá ser:

```
sandbox_pablo123/
```

Todos los proyectos, prácticas o pruebas que realices deben almacenarse dentro de tu sandbox personal.

---

### ¿Por qué se utiliza esta estructura?

- Evita conflictos de `merge` con la rama `main` del repositorio original.
- Permite que cada alumno trabaje con independencia en su fork sin sobrescribir ni colisionar con los ejercicios del profesor.
- Facilita que el profesor pueda actualizar la rama principal con nuevas prácticas sin afectar al trabajo individual de los alumnos.

---

### Recomendaciones

- Usa exclusivamente tu carpeta `sandbox_nombreusuario` para desarrollar tus ejercicios.
- No modifiques carpetas ajenas ni la carpeta `sandbox_profesor`.
- Si el profesor actualiza el repositorio, puedes sincronizar tu fork sin preocuparte por conflictos.