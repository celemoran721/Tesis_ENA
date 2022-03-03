<?php 

$alumno = PersonaData::getById($_GET["id"]);
$alumn = AlumnosGradoData::getAllByAlumnId($_GET["id"]);
$gr = AlumnosGradoData::getAllByOneAlumnId($_GET["id"]);
print_r($gr);
$padres = PersonaData::getAllPadre();
//$gra=$gr->id_grado;
			
				

//$pad=$alumno->getPadre;
//print_r($alumno);
?>
<br> <section class="content">
   <div class="container-fluid">
  <form class="form-horizontal" method="post" enctype="multipart/form-data" id="editalumno" action="index.php?view=updatealumno" role="form">
<div class="row">
	<div class="col-md-6">
	 <div class="card card-info">
      <div class="card-header">
	 <i class="fa "><h1>Editar Alumno</h1></i>
	</div>


   <div class="card-footer">
    <div class="row">
    <label for="inputEmail1" class="col-lg-3 control-label">Nombres</label>
    <div class="col-md-9">
      <input type="text" name="nombres" class="form-control" id="nombres" value="<?php echo $alumno->nombres; ?>" placeholder="">
    </div>
	</div>
  </div> 

  
   <div class="card-footer">
    <div class="row">
    <label for="inputEmail1" class="col-lg-3 control-label">Apellidos*</label>
    <div class="col-md-9">
      <input type="text" name="apellidos" required class="form-control" id="apellidos" value="<?php echo $alumno->apellidos; ?>" placeholder="Apellidos">
    </div>
  </div>
  </div>
  
   <div class="card-footer">
    <div class="row">
    <label for="inputEmail1" class="col-lg-3 control-label">Codigo Estudiantil*</label>
    <div class="col-md-9">
      <input type="text" name="codigo" required class="form-control" id="codigo" value="<?php echo $alumno->codigo; ?>" placeholder="Codigo">
    </div>
  </div>
  </div>
  
   <div class="card-footer">
    <div class="row">
    <label for="inputEmail1" class="col-lg-3 control-label">Fecha de Nac Registrada</label>
    <div class="col-md-9">
      <input type="text" name="fecha" value="<?php echo $alumno->fecha_nac;?>" class="form-control" id="fecha" placeholder="Fecha Registrada">
    </div>
  </div>
  </div>
  
  
   <div class="card-footer">
    <div class="row">
    <label for="inputEmail1" class="col-lg-3 control-label">Fecha de Nacimiento*</label>
  <div class="col-md-9">
   <input type="date" name="sd"  required value="<?php if(isset($_GET["sd"])){ echo $_GET["sd"]; }?>" class="form-control">
   </div>
  </div>
  </div>
  

   <div class="card-footer">
    <div class="row">
    <label for="inputEmail1" class="col-lg-3 control-label">Dirección*</label>
    <div class="col-md-9">
      <input type="text" name="direccion" required class="form-control" id="direccion" value="<?php echo $alumno->direccion; ?>" placeholder="Dirección">
    </div>
  </div>
  </div>  
  
  <div class="card-footer">
    <div class="row">
    <label for="inputEmail1" class="col-lg-3 control-label">Correo*</label>
    <div class="col-md-9">
      <input type="text" name="correo" required class="form-control" id="correo" value="<?php echo $alumno->correo; ?>" placeholder="Dirección">
    </div>
  </div>
  </div>  
  
   <div class="card-footer">
    <div class="row">
    <label for="inputEmail1" class="col-lg-3 control-label">Alergias*</label>
    <div class="col-md-9">
      <input type="text" name="alergias" required class="form-control" id="Alergias" value="<?php echo $alumno->alergias; ?>" placeholder="Alergias">
    </div>
  </div>
  </div>
  
   <div class="card-footer">
    <div class="row">
    <label for="inputEmail1" class="col-lg-3 control-label">Medicamento*</label>
    <div class="col-md-9">
      <input type="text" name="medicamento" required class="form-control" id="medicamento" value="<?php echo $alumno->medicamento; ?>" placeholder="Medicamento">
    </div>
  </div>
 </div>
 
   </div>
   
   
  <p class="alert alert-warning">* Campos obligatorios</p>
  </div>
    	<br>


  
  		   <div class="col-6">
		   
		     <div class="card card-success">
              <div class="card-header">
            
       
	              <center><i class="fa "><h1>Colegio ENA</h1></i></center>
				</div>
				

				

  
			<div class="image">
		
		        <br>
                <?php if($alumno->image!=""){?>

 
				<center> <img src="storage/alumno/<?php echo $alumno->image;?>" class="img-responsive" style="width:50%"></td> </center>
				<?php }else{
				echo "<p class='alert alert-danger'>No hay imagen Registrada</p>";}
				?>
				
		         
               </div>
			   
			   	<div class="card-footer">
                <div class="row">
				 <label for="inputEmail1" class="col-lg-3 control-label">Cambio de Imagen*</label>
                  <div class="col-9">
                     <input type="file" name="image" id="image" placeholder="">
                  </div>

                </div>
              </div>
	
  </div> 
  
  
  	 <?php foreach($alumn as $al):
	 $pad=$al->getPadre();?>
	 
  		     <div class="card card-info">
              <div class="card-header">
            
       
	              <center><i class="fa "><h1>Información del Encargado</h1></i></center>
				</div>
				

						<div class="card-footer">
							<div class="row">
							<label for="inputEmail1" class="col-lg-3 control-label">Encargado Registrado</label>
							<div class="col-md-9">
								<fieldset disabled>
							<input type="text" name="ref_nombre" value="<?php echo $pad->ref_nombre;?>" class="form-control" id="ref_nombre" placeholder="">
							</div>
							</div>
						</div> 
			   
			   
						<div class="card-footer">
							<div class="row">
							<label for="inputEmail1" class="col-lg-3 control-label">Parentesco*</label>
								<div class="col-md-9">
									<fieldset disabled>
								<input type="text" name="ref_parentesco" required class="form-control" id="ref_parentesco" value="<?php echo $alumno->ref_parentesco; ?>" placeholder="Parentesco">
								</div>
							</div>
						</div>
	
		</div> 
		  <?php endforeach;?> 
  
<div class="card card">
	 <div class="card-header">
	 </div>
 <div class="card-footer">
    <div class="col-lg-offset-8 col-lg-12">
     <input type="hidden" name="id_alumno" value="<?php echo $alumno->id;?>">
     <center> <button type="submit" class="btn btn-primary">Actualizar Alumno</button></center>
    </div>
  </div>
  </div>
	

</div>
 </div>
</form>
	</div>
</section>