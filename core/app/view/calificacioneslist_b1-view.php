	 <?php
	 $bimestre = BimestresData::getById($_GET["id"]);
	 $usuario = PersonaData::getById($_SESSION["persona_id"]);
	// $calificacion = CalificacionCategoriaData::getAllCal();
	 $_SESSION['bimestre_id']=$bimestre->id ;
	
	 
	//print_r($_SESSION['bimestre_id']);
	 $res="0";
     ?>
	 <br> <section class="content">
      <div class="container-fluid">
        <!-- row -->
        <div class="row">
          <div class="col-12">
            <!-- jQuery Knob -->
              <div class="card card-info">
              <div class="card-header">
            
                 
                  <i class="fa "><h2><p class="text">Materias Asignadas al Profesor: <?php echo $usuario->nombres." ".$usuario->apellidos ?> </p> </h2></i>
         

                <div class="card-tools">
                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
					<i class="fa fa-download"></i> Descargar <span class="caret"></span>
				  </button>
				    <ul class="dropdown-menu" role="menu">
				<li><a href="report/providers-word.php"><h6 class = "text-dark">Word 2007 (.docx)</h6></a></li>
				
					</ul>	 
                </div>
				
              </div>
			  </div>
			  </div>
		
<br>

			
			
  	          <div class="col-12">
            <!-- jQuery Knob -->
              <div class="card card-warning">
              <div class="card-header">
            
       <i class="fa "><h3><?php echo $bimestre->nombre ?></h3></i>
	   
	
		
				</div>
				
				         <?php
		$asignacion = AsignacionBGMPData::getAllByProfMatId($usuario->id);
		// print_r($asignacion);
	
		if(count($asignacion)>0){
			
		?>
				
			<table class="table table-bordered table-hover table-striped "> 
			<thead>
			<th>Materia</th>
			<th>Cantidad de anuncios</th>
			<th></th>
			<th>Cantidad de tareas</th>
			<th></th>
			
			
			
			</thead>
			
			<?php
			foreach($asignacion as $materia){
			$mat =  $materia->getMateria();
			$dato= AsignacionBGMPData ::getAllMatProfBy($usuario->id,$mat->id);
			//$cat = TareaMateriaData::getAllCountCal($mat->id);
			//$cat = AsignacionBGMPData::getAllCountCal($usuario->id,$mat->id,$_SESSION['bimestre_id']);
			//print_r($cat);
			 $_SESSION['asig_id']=$dato->id_materia ;
			//print_r($_SESSION['asig_id']);
			?>
				<tr>
				<td style="width:100px;"><?php echo $mat->nombre; ?></td>



				<td style="width:125px;" >
				<fieldset disabled>
				<?php 
				$idanuncio = AsignacionAnuncioData::getAllCountMat($mat->id,$_SESSION['bimestre_id']);
				?>
				<form id="form-<?php 
				echo $mat->id; ?>">
				<?php foreach($idanuncio as $a):
				//val es la cantidad de tareas que traigo de la data en el conteo
				if ( count($a->val) >= 1 ){
			    ?>
				<option value="<?php echo $a->id;?>"><?php echo $a->val;?></option>
                <?php }
				else{
					?><option value="<?php echo $a->id;?>"><?php echo "0";?></option>
				<?php
				}
				?>
				<?php
				endforeach;?></form>
				</td >
				
				<td style="width:40px;"> <small>
				<a href="index.php?view=anuncios&id_mat=<?php echo $materia->id_materia; ?>" class="btn btn-sm btn-sm"><i class="fa fa-plus-circle nav-icon"> Anuncios</i></a>
				</small>  </td>
				
				
				
				
				<td style="width:100px;" >
				<fieldset disabled>
				<?php 
				$idmate = AsignacionTareaData::getAllCountCal($mat->id,$_SESSION['bimestre_id']);
				?>
				<form id="form-<?php 
				echo $mat->id; ?>">
				<?php foreach($idmate as $m):
				//val es la cantidad de tareas que traigo de la data en el conteo
				if ( count($m->val) >= 1 ){
			    ?>
				<option value="<?php echo $m->id;?>"><?php echo $m->val;?></option>
                <?php }
				else{
					?><option value="<?php echo $m->id;?>"><?php echo "0";?></option>
				<?php
				}
				?>
				<?php
				endforeach;?></form>
				</td >
				
				<td style="width:60px;"> <small>
				<a href="index.php?view=tareas&id_mat=<?php echo $mat->id; ?>" class="btn btn-sm btn-sm"><i class="fa fa-plus-circle nav-icon"> Tareas</i></a>
				</small>  </td>
				
				
				
				

				<td style="width:60px;"> <small>
				<a href="index.php?view=view_calificaciones_list&id_mat=<?php echo $mat->id; ?>" class="btn btn-sm btn-sm"><i class="fa fa-eye"></i></a>
				</small>  </td>

				<?php

			}



		}else{
			echo "<p class='alert alert-danger'>No hay Materia asignadas</p>";
		}


		?>


	</div>
</div>

	



	</div>
	
</div>
</section>