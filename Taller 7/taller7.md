# Taller 7
## 1. Crear un manual paso a paso como se ejecuta el lenguaje plpgsql en postgressql.

Se realizará utilizando pgadmin.
1. Seleccionar una base de datos
2. Abrir menú  `Execute arbitrary SQL queries` en la barra de tareas superior.
3. Introducir y ejecutar código del procedimiento usando la sintáxis:

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
Ahora podrá visibilizar su función en el menú Schemas/public/Functions de pgAdmin

4. Para ejecutar el procedimiento utilizar ``SELECT nombre_funcion(params)``. Se puede realizar en la misma ventana de pgAdmin, o donde sea necesario.

**Ejemplo**

        SELECT sum_of_two_numbers(3, 5);