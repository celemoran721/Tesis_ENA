<?php
	//print_r($_POST["id_padre"]);

if(count($_POST)>0){
	
	$alumno = PersonaData::getById($_POST["id_alumno"]);
	$alumno->nombres = $_POST["nombres"];
	$alumno->apellidos = $_POST["apellidos"];
	$alumno->fecha_nac = $_POST["sd"];
	$alumno->direccion = $_POST["direccion"];
	$alumno->codigo= $_POST["codigo"];
	$alumno->correo= $_POST["correo"];
	$alumno->alergias = $_POST["alergias"];
	$alumno->medicamento = $_POST["medicamento"];
	//$alumno->id_padre = $_POST["id_padre"];
	//$alumno->ref_parentesco = $_POST["ref_parentesco"];
	//$profesor->updateP();
	
		  if(isset($_FILES["image"])){
		  
    $image = new Upload($_FILES["image"]);
	 
    if($image->uploaded){
      $image->Process("storage/alumno/");
      if($image->processed){
        $alumno->image = $image->file_dst_name;
        $al= $alumno->updateAlumno_with_image();
		
						
      }
    }else{

 $al= $alumno->updateAl();
 						
  
    }
  }
  else{
	

  }


//print "<script>window.location='index.php?view=alumnos';</script>";

}
$gr = AlumnosGradoData::getAllByOneAlumnId($_POST["id_alumno"]);

print "<script>window.location='index.php?view=viewgrado_crear_alumno&id=$gr->id_grado';</script>";
?>
