<?php
session_start();
$id = $_SESSION['mkid'];
$isBattle = isset($_POST['battle']);
echo '[';
if ($id) {
	include('initdb.php');
	$getCourse = mysql_fetch_array(mysql_query('SELECT course FROM `mkjoueurs` WHERE id="'.$id.'"'));
	$course = $getCourse['course'];
	if ($course) {
		$joueurs = mysql_query('SELECT j.id,j.nom,i.ignorer FROM `mkjoueurs` j LEFT JOIN `mkignores` i ON i.ignored=j.id AND i.ignorer='.$id.' WHERE j.course='.$course.' AND j.id!="'.$id.'"');
		$virgule = false;
		while ($joueur = mysql_fetch_array($joueurs)) {
			echo ($virgule ? ',':'');
			echo '[';
			echo $joueur['id'].',"'.$joueur['nom'].'",'.($joueur['ignorer']?1:0);
			echo ']';
			$virgule = true;
		}
	}
	mysql_close();
}
echo ']';
?>