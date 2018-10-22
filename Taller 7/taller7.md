# Taller 7
## 1. Crear un manual paso a paso como se ejecuta el lenguaje plpgsql en postgressql.

1. Navegar en la consola hasta la carpeta `bin` dentro del directorio de instalación de PostgreSQL. En mi caso se encontraba en `C:\Program Files\PostgreSQL\9.5\bin`
2. Ejecutar el comando `psql -U postgres`, o reemplazar postgres por el usuario registrado. En mi caso no tenía password, pero si la tiene será solicitada.
3. Seleccionar una base de datos utilizando el comando `\c nombrebd`, en este caso `\c taller`
4. Introducir y ejecutar código del procedimiento usando la sintáxis:

        [ <<label>> ]
        [ DECLARE
        declarations ]
        BEGIN
        statements
        END [ label ];
**Ejemplo**

        CREATE FUNCTION sum_of_two_numbers(m integer, n integer) 
        RETURNS integer AS $$
                BEGIN
                        RETURN m + n;
                END;
        $$ LANGUAGE plpgsql;

4. Para ejecutar el procedimiento utilizar ``SELECT nombre_funcion(params)``.

**Ejemplo**

        SELECT sum_of_two_numbers(3, 5);