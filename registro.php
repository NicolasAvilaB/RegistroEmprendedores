<!DOCTYPE html>
<html>
<head>
<noscript>
  <META HTTP-EQUIV="Refresh" CONTENT="0;URL=java.html">
</noscript>
<article id="contenedor_carga">
	<article id="carga"></article>
</article>
<script>
	window.onload = function(){
	var contenedor = document.getElementById('contenedor_carga');
	contenedor.style.visibility = 'hidden';
	contenedor.style.opacity = '0';
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <meta name="viewport" content="width=device-width, initial-scale=1"/> 
<style type="text/css">
@import url("registro.css");
</style>
<link rel="icon" href="logo.png">
<link href="registro.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/lib/w3.css">
<!-- <img class="dis" src="Imagenes/logo.jpg" width="318" height="160"> -->
<title>Registro Emprendedores - Municipalidad de Peralillo </title>
<body oncopy="return false" onpaste="return false" oncontextmenu="return false">
<div> 
<script src="func.js"> </script>
<p></p>
<img class="dis" src="./logomuni.png">
<p class="titulo75">MUNICIPALIDAD DE PERALILLO</p>
<p class="copy"><a href='https://nicolas.systemchile.com' type='button' style="color:white;text-decoration: none;" class='btn btn-primary' target='_blank'>Copyright © 2018 | Diseñado por Nicolas Avila Biskupovic para Muniperalillo</a></p>
<p class= "titulo2" align="center"> Registro de Emprendedores</p>
</div>
<section>
<form id="form1" name="form1" action="registro.php" method="POST" onSubmit="return validar(this)">
<p>&nbsp;</p>
<p class= "titulo3">Rut: <input type="text" class="rut" id="rut" name="rut" style="text-align:center" placeholder="Ingrese su Rut..." size="30" maxlength="10" required oninput="checkRut(this)" autocomplete="off"/> </p>
<p class= "titulo3">Nombre: <input type="text" class="nombre" id="nombre" name="nombre" style="text-align:center" placeholder="Ingrese Nombre..." size="30" onkeypress="return valida_letras(event)" maxlength="45" autocomplete="off"/> </p>

<p class= "titulo3">Apellido Paterno: <input type="text" class="ape" id="ape" name="ape" style="text-align:center" placeholder="Ingrese Apellido Paterno..." size="30" onkeypress="return valida_letras(event)" onKeyUp="mayuscula2(this.value,this.id)" maxlength="45" autocomplete="off"/> </p>

<p class= "titulo3">Apellido Materno: <input type="text" class="ape2" id="ape2" name="ape2" style="text-align:center" placeholder="Ingrese Apellido Materno..." size="30" onkeypress="return valida_letras(event)" maxlength="45"  autocomplete="off"/> </p>

<p class= "titulo3">Comuna: <input type="text" class="comuna" id="comuna" name="comuna" style="text-align:center" placeholder="Ingrese Comuna..." size="30" onkeypress="return valida_letras(event)" maxlength="45"  autocomplete="off"/>  </p>

<p class= "titulo3">Direccion: <input type="text" class="direccion" id="direccion" name="direccion" style="text-align:center" placeholder="Ingrese Direccion..." size="30" onkeypress="return valida_letras_numeros(event)" maxlength="75"  autocomplete="off"/>  </p>

<p class= "titulo3">Telefono +56 9: <input type="text" class="telefono" id="telefono" name="telefono" style="text-align:center" placeholder="Ingrese 8 Digitos de su Telefono..." size="30" onkeypress="return valida(event)" maxlength="8"  autocomplete="off"/> </p>

<p class= "titulo3">Email: <input type="text" class="email" id="email" name="email" style="text-align:center" placeholder="Ingrese Correo Electronico..." size="30" maxlength="75" onKeyUp="javascript:validateMail('email')"  autocomplete="off"/>  </p>

<p class= "titulo3">¿Posee Iniciación de Actividades ante el SII?: <select id="1" name="1">
  <option value="Si">Si</option>
  <option value="No">No</option>
</select>
</p>

<p class= "titulo3">Primera Categoria (Factura/Boleta): <select id="2" name="2">
  <option value="Si">Si</option>
  <option value="No">No</option>
</select>
</p>

<p class= "titulo3">Segunda Categoria (Boletas Honorarios): <select id="3" name="3">
  <option value="Si">Si</option>
  <option value="No">No</option>
</select>
</p>

<p class= "titulo3">Actividad Economica que Desarrolla o desea Desarrollar: <input type="text" class="actividad" id="actividad" name="actividad" style="text-align:center" placeholder="Ingrese Actividad Economica..." maxlength="295" onkeypress="return valida_letras_numeros(event)" size="30" autocomplete="off"/>  </p>

<p class= "titulo3">¿Busca Financiamiento?: <select id="4" name="4">
  <option value="Si">Si</option>
  <option value="No">No</option>
</select>
</p>

<p class= "titulo3">¿Interez en Capacitacion: <select id="5" name="5">
  <option value="Si">Si</option>
  <option value="No">No</option>

<input type="submit" onclick="" id="gu" class="g" name="gu" value="Guardar"> 
</select>
</p>

<p><script>
function focusnombre(){
document.getElementById('t').focus();
}

function mayuscula(obj,nom)
{
obj = obj.toUpperCase();
document.getElementById('t').value=obj;
}

function mayuscula2(obj,nom)
{
obj = obj.toUpperCase();
document.getElementById('ti2').value=obj;
}
</script>
</p>
<p>

<?php 
$var = "";
  if(isset($_POST["gu"])){
	include('functions.php'); 
    header("Content-Type: application/json; charset=UTF-8");
    header("Content-Type: text/html;charset=utf-8");
    $rut = $_POST["rut"];
	$nombre = ucfirst($_POST["nombre"]);
	$ape = $_POST["ape"];
	$ape2 = $_POST["ape2"];
	$comuna= $_POST["comuna"];
	$direccion = $_POST["direccion"];
	$telefono = $_POST["telefono"];
	$email = $_POST["email"];
	$actividad = $_POST["actividad"];
	$a = $_POST["1"];
	$b = $_POST["2"];
	$c = $_POST["3"];
	$d = $_POST["4"];
	$e = $_POST["5"];
    if ($rut < 10){
    	echo "<script>alert('Advertencia: No has Habilitado Javascript en tu Navegador Web')</script>";
    	header("Location: java.html");
    }
    elseif ($telefono <= 10){
    	echo "<script>alert('Advertencia: No has Habilitado Javascript en tu Navegador Web')</script>";
    	header("Location: java.html");
    }
    else{
	    if ($resultset = getSQLResultSet("Call Comprobar_Rut('$rut')")) {
	        while ($row = $resultset->fetch_array(MYSQLI_NUM)) {
	            $var = $row['0'];
	        }
        }
        if ($rut == $var){
            echo "<script>alert('Rut ya Existente')</script>";
	    }
        else{
            ejecutarSQLCommand("Call Ingresar_Futuro_Emprendedor ('$rut','$nombre','$ape','$ape2','$comuna','$direccion','$telefono','$email','$a','$b','$c','$actividad','$d','$e')");
            echo "<script>alert('Datos ingresados correctamente')</script>";
		}
    }
}
?>
</section>
</body>
</head>
</html>
