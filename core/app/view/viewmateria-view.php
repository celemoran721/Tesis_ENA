<?php 

$asig = AsignacionBGMPData::getById($_GET["id"]);
$grado =  $asig->getGrado();
$materia =  $asig->getMateria();
$profesor =  $asig->getProfesor();

$profesores = ProfesoresData::getAll();
$grados = GradosData::getAll();



?>
<div class="row">
	<div class="col-md-12">
	<h1>Editar Materia</h1>
	<br>
		<form class="form-horizontal" method="post" id="editmateria" action="index.php?view=updatemateria" role="form">


<div class="form-group">
    <label for="inputEmail1" class="col-lg-3 control-label">Nombre de la Materia</label>
    <div class="col-md-6">
		<fieldset disabled>
      <input type="text" name="apellidos" class="form-control" id="apellidos" value="<?php echo $materia->nombre; ?>" placeholder="">
    </div>
  </div> 


  <br>
    <br>

   <div class="form-group">
    <label for="inputEmail1" class="col-lg-3 control-label">Grado Registrado</label>
    <div class="col-md-6">
      <input type="text" name="grado" value="<?php echo $grado->nombre;?>" class="form-control" id="grado" placeholder="Fecha Registrada">
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputEmail1" class="col-lg-3 control-label">Nuevo Grado*</label>
    <div class="col-md-6">
    <select name="id_grado" required class="form-control">
    <option value="">-- Seleccionar --</option>
    <?php foreach($grados as $grado):?>
      <option value="<?php echo $grado->id;?>"><?php echo $grado->nombre;?></option>
    <?php endforeach;?>
      </select>    </div>
  </div> 
  
  <br>
    <br>
  
   <div class="form-group">
    <label for="inputEmail1" class="col-lg-3 control-label">Profesor Registrado</label>
    <div class="col-md-6">
      <input type="text" name="profesor" value="<?php echo $profesor->nombres." ". $profesor->apellidos;?>" class="form-control" id="profesor" placeholder="Fecha Registrada">
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputEmail1" class="col-lg-3 control-label">Nuevo Profesor*</label>
    <div class="col-md-6">
    <select name="id_profesor" required class="form-control">
    <option value="">-- Seleccionar --</option>
    <?php foreach($profesores as $profesor):?>
      <option value="<?php echo $profesor->id;?>"><?php echo $profesor->nombres." ".$profesor->apellidos;?></option>
    <?php endforeach;?>
      </select>    </div>
  </div> 
  
  

  <p class="alert alert-info">* Campos obligatorios</p>

  <div class="form-group">
    <div class="col-lg-offset-2 col-lg-10">
    <input type="hidden" name="id_asig" value="<?php echo $asig->id;?>">
      <button type="submit" class="btn btn-primary">Actualizar Materia</button>
    </div>
  </div>
</form>
	</div>
</div>