<?php
if (isset($_POST['nom']) && isset($_POST['auteur']) && isset($_POST['mode'])) {
	include('getId.php');
	include('initdb.php');
	include('ip_banned.php');
	$mode = $_POST['mode'];
	if (isBanned()) {
		mysql_close();
		exit;
	}
	$save = true;
	$maxCups = 18;
	if (isset($_POST['cid'.$maxCups])) unset($_POST['cid'.$maxCups]);
	for ($i=0;isset($_POST['cid'.$i]);$i++) {
		if (!mysql_numrows(mysql_query('SELECT * FROM `mkcups` WHERE id='. $_POST['cid'. $i] .' AND identifiant="'. $identifiants[0] .'" AND identifiant2="'. $identifiants[1] .'" AND identifiant3="'. $identifiants[2] .'" AND identifiant4="'. $identifiants[3] .'"'. ($mode ? '':' AND mode="'. $mode .'"')))) {
			$save = false;
			break;
		}
	}
	if ($save) {
		$nbCups = $i;
		$optionsJson = isset($_POST['opt']) ? $_POST['opt']:'';
		setcookie('mkauteur', $_POST['auteur'], 4294967295,'/');
		if (isset($_POST['id'])) {
			if (mysql_numrows(mysql_query('SELECT * FROM mkmcups WHERE id="'. $_POST['id'] .'" AND identifiant="'. $identifiants[0] .'" AND identifiant2="'. $identifiants[1] .'" AND identifiant3="'. $identifiants[2] .'" AND identifiant4="'. $identifiants[3] .'"'))) {
				mysql_query('UPDATE `mkmcups` SET nom="'. $_POST['nom'] .'",auteur="'. $_POST['auteur'] .'",options="'.$optionsJson.'" WHERE id="'. $_POST['id'] .'"');
				$cupId = $_POST['id'];
			}
			else
				$save = false;
		}
		else {
			mysql_query('INSERT INTO `mkmcups` VALUES(NULL,CURRENT_TIMESTAMP(),'.$identifiants[0].','.$identifiants[1].','.$identifiants[2].','.$identifiants[3].',0,0,0,0,"'. $mode .'","'. $_POST['nom'] .'","'. $_POST['auteur'] .'","'.$optionsJson.'")');
			$cupId = mysql_insert_id();
			include('session.php');
			if ($id) {
				$getFollowers = mysql_query('SELECT follower FROM `mkfollowusers` WHERE followed="'. $id .'"');
				while ($follower = mysql_fetch_array($getFollowers))
					mysql_query('INSERT INTO `mknotifs` SET type="follower_circuit", user="'. $follower['follower'] .'", link="4,'.$cupId.'"');
			}
		}
	}
	if ($save) {
		if (isset($_POST['id']))
			mysql_query('DELETE FROM `mkmcups_tracks` WHERE mcup="'. $cupId .'"');
		for ($i=0;isset($_POST['cid'.$i]);$i++)
			mysql_query('INSERT INTO `mkmcups_tracks` VALUES("'.$cupId.'",'.$i.',"'.$_POST['cid'.$i].'")');
		if (isset($_POST['cl'])) {
			include('challenge-associate.php');
			challengeAssociate('mkmcups',$cupId,$_POST['cl']);
		}
		echo $cupId;
	}
	else
		echo -1;
	mysql_close();
	include('cache_creations.php');
	@unlink(cachePath("mcuppreview$cupId.png"));
}
?>