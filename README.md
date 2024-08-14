# Uso de funciones PL/SQL en PostgreSQL

<p align="justify">
Una función (function) en PostgreSQL son sentencias SQL agrupadas y precompiladas para ejecutarse en bloque dentro del servidor, a diferencia de las consultas SQL donde cada consulta es procesada en tiempo de ejecución por el servidor , las funciones procedurales son compilados cuando son creados, ya que el servidor asume que serán ejecutados más de una vez, un función ofrece las siguientes ventajas:
<ul>
<li>
No sobrecarga la comunicación cliente/servidor al evitar enviar una consulta tras otra, en su lugar procesa una consulta tras otra y envía únicamente el resultado.
</li>
<li>
Cuando y se ejecuta la primera vez se crea un plan preparado de ejecución, las siguientes ejecuciones reutilizan el plan preparado.
</li>
<li>
Agrega estructuras de control y capacidad de calculo al lenguaje SQL.
</li>
<li>
Las mismas consultas están disponibles para varias aplicaciones.
</li>
<li>
Seguridad los datos solo están accesibles mediante las funciones y evita el uso de SQL injection.
</li>
</ul>
</p>
<p align="justify">
De los lenguajes más utilizados para crear funciones en postgreSQL, se encuentra PL/pgSQL, el cual se distribuye como un módulo cargable junto con postgreSQL, para emplearlo en nuestra base de datos es necesario darlo de alta, de la siguiente manera.
Para agregar el soporte a PL/SQL en caso que la base de datos no la soporte se ejecuta el siguiente comando:
<tt>createlang plpgsql [database]</tt>
en nuestro ejemplo:
<tt>createlang plpgsql pubs</tt>
</p>
<p align="justify">
Revisamos si ya lo tenemos disponible en nuestra base de datos para utilizarlo La sintaxis de PL/pgSQL (similar al lenguaje PL/SQL de Oracle)
Para comprobar la instalación del lenguaje PL/SQL.
<tt>psql [database] -c "select oid,lanname from pg_language"</tt>
<tt>
  oid  | lanname  
-------+----------
    12 | internal
    13 | c
    14 | sql
 13585 | plpgsql
(4 rows)
</tt>
</p>
<h4>Utilizando PL/pgSQL con C#</h4>
<p align="justify">
En este ejemplo usaremos PL/pgSQL y C# para resolver un requerimiento practico como seria relacionar la columna city de nuestra tabla authors en nuestra base de datos con una tabla llamada cities donde se encontrará la información de la columna ciudad mas un identificador.
</p>
Fig Diagrama entidad relacion
<div align="center">
	<img src="ado3_fig3.jpg"/>
</div>
<p align="justify">
La relación deberá de quedar de la siguiente manera, donde la columna city se debe cambiar por la clave primaria de la tabla cities que tendrá como clave primaria la clave de la ciudad y una columna adicional llamada city que contendrá el nombre de la ciudad.
</p>
<div align="center">
	<img src="tbcities.png"/>
</div>
<p align="justify">
Ahora usamos la siguiente función AddCities(varchar) para tomar los valores de la columna city en la tabla authors, crear un identificador único para la llave primaria, insertar ese valor de clave primaria junto con el nombre de la ciudad y por último sustituir los valores en la columna city y reemplazarlos con el valor de la llave primaria en la tabla cities.
</p>
<div align="center">
	<img src="addcities.png"/>
</div>
Lo compilamos

<tt>mcs /t:winexe -r:System.Data,Npgsql -pkg:gtk-sharp-2.0 ExecutePgFunction.cs</tt>

Podemos probar nuestro programa invocando la funcion version() predeterminada de PostgreSQL.

Fig 6 Ejecutando la función version() de PostgreSQL
<div align="center">
	<img src="ado3_fig6.jpg"/>
</div>
Al ejecutar la función sin argumentos desde el formulario se vera el mismo resultado.

Fig 7 El programa ejecutando función version().
<div align="center">
	<img src="ado3_fig7.jpg"/>
</div>

<p align="justify">
Aquí el driver de PostgreSQL para .NET ejecuta la función usando la clase NpgsqlCommand la cual recibe como argumento el nombre de la función y la conexión al servidor donde se encuentra.
</p>
<tt>NpgsqlCommand cmd = new NpgsqlCommand(“version”, conn);</tt>
<p align="justify">
Si la función recibe parámetros, debemos de crear una instancia de la clase NpgsqlParameter() por cada uno de los parametros que reciba, es muy importante no olvidar indicarle a la clase NpgsqlCommand que el comando que ejecutaremos es un stored procedure o una función pl/sql, esto lo hacemos mediante la instrucción:
<tt>cmd.CommandType = System.Data.CommandType.StoredProcedure;</tt>
Para mayor referencia no olvidar leer la documentación del data provider para PostgreSQL. Si todo es ejecutado correctamente, ya podemos probar la función AddCities con el argumento del nombre de la ciudad y debe devolvernos la clave primaria de la tabla cities.
</p>
Fig 8 El programa ejecutando la función AddCities
<div align="center">
	<img src="ado3_fig8.jpg"/>
</div>