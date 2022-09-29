<!DOCTYPE html>
<html>
<head>
<noscript>
  <META HTTP-EQUIV="Refresh" CONTENT="0;URL=java.html">
</noscript>
<article id="contenedor_carga">
	<article id="carga"></article>
</article>
<script src="../Imagenes/jquery_fade.min.js"></script>
<script src="func_admin.js"> </script>
<script>
	window.onload = function(){
	var contenedor = document.getElementById('contenedor_carga');
	contenedor.style.visibility = 'hidden';
	contenedor.style.opacity = '0';
	var carg = document.getElementById('carga');
    carg.style.animationPlayState = "paused"; 
	}
</script>
<script>
$(document).ready(function(){
$("#check").click(function(){
    $("#ex").fadeToggle("fast");
    $("#el").fadeToggle("fast");
    if($("#check").prop('checked') ) {
        $("#boton_eliminar").fadeIn("fast");
        $("#boton_exportacion").fadeIn("fast");
        $("#boton_eliminar").animate({left: '27px'});
        $("#boton_exportacion").animate({left: '27px'});
        
    }
    else{
        $("#boton_eliminar").fadeOut("fast");
        $("#boton_exportacion").fadeOut("fast");
        $("#boton_eliminar").animate({left: '-65px'});
        $("#boton_exportacion").animate({left: '-52px'});
    }
});
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <meta name="viewport" content="width=device-width, initial-scale=1"/> 
<style type="text/css">
@import url("historial_org.css");
</style>
<link href="historial_org.css" rel="stylesheet" type="text/css">
<!-- <img class="dis" src="Imagenes/logo.jpg" width="318" height="160"> -->
<title>Historial Registro Emprendedores - Municipalidad de Peralillo </title>
<body oncopy="return false" onpaste="return false" oncontextmenu="return false">
<div> 
<?php
header( "Content-Type: text/html;charset=utf-8" );
SESSION_START();
$nom=$_SESSION['usuarios'];
$cla=$_SESSION['claves'];
$identificador=$_SESSION['i'];
if($nom == "" && $cla == "" && $identificador == ""){
SESSION_START();
SESSION_UNSET();
SESSION_DESTROY();
header("Location:../login.php");
}
else{
    if ($identificador=="Administrador"){
    }else{
        SESSION_START();
	SESSION_UNSET();
	SESSION_DESTROY();
        header("Location:../login.php");
    }
}
?>
<p></p>
<input type="checkbox" class="checkbox" id="check">
    <label class="menu" for="check">|||</label>
    <div class="left-panel" id="left_panel">
        <div class="ex" id="ex">
        </div>
        <!--<div class="el" id="el">
        </div>-->
    </div>
<img class="dis" src="../Imagenes/logomuni.png">
<p class="titulo75">MUNICIPALIDAD DE PERALILLO</p>
<p class="copy">Copyright © 2019 | Diseñado por N.A.B para Muniperalillo</p>
<ul class="nav nav-pills nav-stacked">
  <ul class="dropdown">
        <li><a class="active" onclick="location.href = '#home'">Historial Registro Emprendedores</a></li>
  </ul>
</ul>
</div>
<section>
<p class= "titulo2" align="center"> Historial Registro Emprendedores</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div id="tablascroll" class="tablascroll">
<form action="historial_org.php" method="POST">
<table id="tabla_registro" class="tabla" border="2" style="background-color: #F9F9F9;">
    <thead>
    <tr>
        <!--<th><button type="submit" id="boton_eliminar" class="boton_eliminar" name="elres" value=""><span class="tooltipeliminar"></span></button></th>-->
        <th>Rut</th>
        <th>Nombre</th>
        <th>Apellido Pat.</th>
	    <th>Apellido Mat.</th>
	    <th>Comuna</th>
	    <th>Dirección</th>
	    <th>Telefono</th>
	    <th>Email</th>
	    <th>Actividad SII</th>
	    <th>1° Factura/Boleta</th>
	    <th>2° Boleta Honorario</th>
	    <th>Act. Economica</th>
	    <th>Busca Financiamiento</th>
	    <th>Interez Capacitación</th>
        <th></th>
    </tr>
    </thead>
    <?php
    header("Content-Type: text/html;charset=utf-8");
    if(isset($_POST["buscar"])){
        $dato = $_POST['bus'];
        $conexion = mysqli_connect("localhost","cre37351_root","lacomunagana","cre37351_emprendedor") or die ("Error");
        mysqli_set_charset($conexion,"utf8");
        $consulta = "Call Buscar_Emprendedor('%".$dato."%')";
        $ejecutar = mysqli_query($conexion,$consulta);
        $i = 0;
    	while ($row = mysqli_fetch_array($ejecutar)) 
    	{
            $c1 = $row[0];
            $c2 = $row[1];
    	    $c3 = $row[2];
    	    $c4 = $row[3];
    	    $c5 = $row[4];
    	    $c6 = $row[5];
    	    $c7 = $row[6];
    	    $c8 = $row[7];
    	    $c9 = $row[8];
    	    $c10 = $row[9];
    	    $c11 = $row[10];
    	    $c12 = $row[11];
    	    $c13 = $row[12];
    	    $c14 = $row[13];
	        $i++;
       ?>
           <tr class="objetos">
            <!--<td><input type="checkbox" class="checkbox2" name="marca_eliminacion[]" style="text-align:center" value="<?php echo $c1; ?>"/></td>-->
            <td><?php echo $c1; ?></td>
            <td><?php echo $c2; ?></td>
            <td><?php echo $c3; ?></td>
            <td><?php echo $c4; ?></td>
            <td><?php echo $c5; ?></td>
            <td><?php echo $c6; ?></td>
            <td><?php echo $c7; ?></td>
            <td><?php echo $c8; ?></td>
            <td><?php echo $c9; ?></td>
            <td><?php echo $c10; ?></td>
            <td><?php echo $c11; ?></td>
            <td><?php echo $c12; ?></td>
            <td><?php echo $c13; ?></td>
            <td><?php echo $c14; ?></td>
           <!--<td><a class="eliminar_usuario" id="eliminars" onclick="eliminar_user('<?php echo $c1; ?>');"></a></td>-->
            </tr>
   <?php } }?>
</table>
</form>
</div>
<form action="historial_org.php" method="POST">
<input type="text" class="bus" id="bus" name="bus" style="text-align:center" placeholder="Ingrese Datos a Buscar..." size="30" autocomplete="off"/> <input type="submit" class="buscar" name="buscar" value="Buscar"/> </p>
</form>
</p>
<p>
<?php 
header( "Content-Type: text/html;charset=utf-8" );
$conexion = mysqli_connect("localhost","cre37351_root","lacomunagana","cre37351_emprendedor") or die ("Error");
 mysqli_set_charset($conexion,"utf8");
if(isset($_GET["eliminar"])){
        $recuperacion_id = $_GET["eliminar"];
	    $ejecutar = mysqli_query($conexion, "Call Borrar_Emp ('".$recuperacion_id."')");
    if($ejecutar){
		echo "<script>alert('Datos eliminado correctamente')</script>"; 
    }
    echo "<script language=Javascript> location.href=\"historial_org.php\"; </script>"; 
}
?>
<?php 
header( "Content-Type: text/html;charset=utf-8" );
$conexion = mysqli_connect("localhost","cre37351_root","lacomunagana","cre37351_emprendedor") or die ("Error");
 mysqli_set_charset($conexion,"utf8");
    if(isset($_POST["elres"])){
	    foreach ($_POST['marca_eliminacion'] as $marcador){
            $ejecutar = mysqli_query($conexion, "Call Borrar_Emp ('".$marcador."')");
        }
        if($ejecutar){
		echo "<script>alert('Datos eliminado correctamente')</script>"; 
        }
     echo "<script language=Javascript> location.href=\"historial_org.php\"; </script>"; 
    }
?>
<?php
if(isset($_POST["ce"])){
		SESSION_START();
		SESSION_UNSET();
		SESSION_DESTROY();
		header("Location:../login.php");
	}
?>
<form id="form" class="form" name="form" method="POST">
<input type="submit" onclick="" id="ce" class="ce" name="ce" value="Cerrar Sesion">
</form>
</section>
</body>
<script src="exportar_documentos/jquery-1.12.4.min.js"></script>
<script src="exportar_documentos/FileSaver.min.js"></script>
<script src="exportar_documentos/Blob.min.js"></script>
<script src="exportar_documentos/xls.core.min.js"></script>
<script src="exportar_documentos/tableexport.js"></script>
<script>
$("table").tableExport({
	formats: ["xlsx"], //Tipo de archivos a exportar ("xlsx","txt", "csv", "xls")
	position: 'button',  // Posicion que se muestran los botones puedes ser: (top, bottom)
	bootstrap: false,//Usar lo estilos de css de bootstrap para los botones (true, false)
	fileName: "Historial Registro Emprendedores",    //Nombre del archivo 
});
</script>
</head>
</html>
