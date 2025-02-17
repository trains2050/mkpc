<?php
include('session.php');
if (!$id) {
	echo "Vous n'&ecirc;tes pas connect&eacute;";
	exit;
}
include('language.php');
include('initdb.php');
if (!$id) {
	echo "Vous n'&ecirc;tes pas connect&eacute;";
	mysql_close();
	exit;
}
require_once('getRights.php');
if (!hasRight('manager')) {
	echo "Vous n'&ecirc;tes pas administrateur";
	mysql_close();
	exit;
}
if (hasRight('admin')) {
	$rolePrefix = $language ? 'of ':'d\'';
	$roleName = $language ? 'administrator':'administrateur';
}
elseif (hasRight('moderator')) {
	$rolePrefix = $language ? 'of ':'de ';
	$roleName = $language ? 'moderator':'modérateur';
}
else {
	$rolePrefix = $language ? 'of ':'d\'';
	$roleName = $language ? 'event host':'animateur';
}
?>
<!DOCTYPE html>
<html lang="<?php echo $language ? 'en':'fr'; ?>">
<head>
<title>Mario Kart PC</title>
<?php
include('heads.php');
?>
<link rel="stylesheet" type="text/css" href="styles/forum.css" />
<style type="text/css">
h2 {
	margin-bottom: 5px;
}
ul {
	display: inline-block;
	margin-top: 0px;
	padding-left: 10px;
	padding-right: 10px;
}
li {
	list-style: none;
}
li strong {
}
.action-ctn {
	display: block;
	color: black;
	text-decoration: none;
	background-color: #FD9;
	margin: 8px 0;
	padding: 4px 6px;
	border-radius: 5px;
}
a.action-ctn:hover {
	background-color: #FEA;
	color: black;
}
.action-title {
	font-weight: bold;
	display: block;
	color: #F60;
	font-size: 1.2em;
}
.action-title strong {
	color: #C33;
}
.action-desc {
	color: #966;
}
</style>
<?php
include('o_online.php');
?>
</head>
<body>
<?php
include('header.php');
$page = 'forum';
include('menu.php');
?>
<main>
	<h1><?php echo $language ? 'Admin page':'Page admin'; ?></h1>
	<p class="success"><?php
	echo $language ? "Your $roleName rank gives you the following rights. Make good use of it!":"Votre grade $rolePrefix$roleName vous donne les droits suivants. Faites-en bon usage !";
	?></p>
	<h2><?php echo $language ? "Member management":"Gestion des membres"; ?></h2>
	<ul>
		<?php
		if (hasRight('moderator')) {
			?>
		<li>
			<a class="action-ctn" href="nick-history.php">
				<div class="action-title"><?php echo $language ? "See <strong>nick change history</strong>":"Voir l'historique des <strong>changements de pseudo</strong>"; ?></div>
				<div class="action-desc"><?php echo $language ? "To monitor people who would abuse of this option.":"Pour surveiller les membres qui abuseraient de cette option."; ?></div>
			</a>
		</li>
		<li>
			<a class="action-ctn" href="edit-pseudo.php">
				<div class="action-title"><?php echo $language ? "Edit member <strong>nick</strong>":"Changer le <strong>pseudo</strong> d'un membre"; ?></div>
				<div class="action-desc"><?php echo $language ? "Can be useful if a member has a troll nick for example":"Peut servir si un membre a un pseudo troll par exemple"; ?></div>
			</a>
		</li>
			<?php
		}
		?>
		<li>
			<a class="action-ctn" href="updatepts.php">
				<div class="action-title"><?php echo $language ? "Give / Remove <strong>points</strong> in the <strong>online mode</strong>":"Donner/retirer des <strong>points</strong> dans le <strong>mode en ligne</strong>"; ?></div>
				<div class="action-desc"><?php echo $language ? "As a reward for a tournament, or as punishment after a cheat...":"En récompense suite à un tournoi, ou comme punition après une triche..."; ?></div>
			</a>
		</li>
		<?php
		if (hasRight('organizer')) {
			?>
		<li>
			<a class="action-ctn" href="awards.php">
				<div class="action-title"><?php echo $language ? "Award a <strong>reward</strong>":"Attribuer des <strong>titres</strong>"; ?></div>
				<div class="action-desc"><?php echo $language ? "Following an official event (oscars, festival, ...)":"Suite à un événement officiel (oscars, festival, ...)"; ?></div>
			</a>
		</li>
			<?php
		}
		if (hasRight('moderator')) {
			?>
		<li>
			<a class="action-ctn" href="doublecomptes.php">
				<div class="action-title"><?php echo $language ? "See <strong>double accounts</strong>":"Voir les <strong>double comptes</strong>"; ?></div>
				<div class="action-desc"><?php echo $language ? "If a &quot;new&quot; member seems suspicious... (tool not 100% reliable)":"Si un &quot;nouveau&quot; membre vous parait louche... (outil pas 100% fiable)"; ?></div>
			</a>
		</li>
		<li>
			<a class="action-ctn" href="edit-country.php">
				<div class="action-title"><?php echo $language ? "Edit member <strong>country</strong>":"Changer le <strong>pays</strong> d'un membre"; ?></div>
				<div class="action-desc"><?php echo $language ? "Can be useful if a troll member has put a fake country for example":"Peut servir si un membre troll a renseigné un faux pays par exemple"; ?></div>
			</a>
		</li>
		<li>
			<a class="action-ctn" href="ban-player.php">
				<div class="action-title"><?php echo $language ? "<strong>Ban</strong> a member":"<strong>Bannir</strong> un membre"; ?></div>
				<div class="action-desc"><?php echo $language ? "Use it as a last resort, the member in question will not be able to post anything on the site":"À utiliser en dernier recours, le membre en question ne pourra alors plus rien poster sur le site"; ?></div>
			</a>
		</li>
			<?php
		}
		?>
	</ul>
	<?php
	if (hasRight('moderator')) {
		?>
	<h2>Gestion des partages</h2>
	<ul>
		<li>
			<a class="action-ctn" href="creations.php?admin=1">
				<div class="action-title"><?php echo $language ? "Delete a <strong>custom track</strong>":"Supprimer un <strong>circuit</strong>"; ?></div>
				<div class="action-desc"><?php echo $language ? "If the content of the track is inappropriate or in case of plagiarism":"Si le contenu d'un circuit est inapproprié ou en cas de plagiat"; ?></div>
			</a>
		</li>
		<li>
			<a class="action-ctn" href="creation-ratings.php">
				<div class="action-title"><?php echo $language ? "Manage <strong>ratings</strong> on tracks":"Gérer les <strong>notes</strong> sur un circuit"; ?></div>
				<div class="action-desc"><?php echo $language ? "To monitor and eradicate 1-star trolls...":"Pour surveiller et éradiquer les 1-star trolls..."; ?></div>
			</a>
		</li>
		<li>
			<a class="action-ctn" href="adminPersos.php">
				<div class="action-title"><?php echo $language ? "Delete a <strong>character</strong>":"Supprimer un <strong>perso</strong>"; ?></div>
				<div class="action-desc"><?php echo $language ? "In case of plagiarism or if eventual cheating (invisible character...)":"En cas de plagiat ou de risque de triche (perso invisible...)"; ?></div>
			</a>
		</li>
	</ul>
	<h2>Autres droits</h2>
	<ul>
		<li>
			<div class="action-ctn">
				<div class="action-title"><?php echo $language ? "Moderate a message on the <strong>forum</strong>":"Modérer un message sur le <strong>forum</strong>"; ?></div>
				<div class="action-desc"><?php echo $language ? "To do this, go to the message in question and click on &quot;Edit&quot; or &quot;Delete&quot;":"Pour cela, se rendre sur le message en question et cliquer sur &quot;Modifier&quot; ou &quot;Supprimer&quot;"; ?></div>
			</div>
		</li>
		<li>
			<div class="action-ctn">
				<div class="action-title"><?php echo $language ? "Moderate a <strong>comment</strong> on a <strong>custom track</strong>":"Modérer un <strong>commentaire</strong> sur un <strong>circuit</strong>"; ?></div>
				<div class="action-desc"><?php echo $language ? "Go to the track in question and click on &quot;Edit&quot; or &quot;Delete&quot;":"Se rendre sur le circuit en question et cliquer sur &quot;Modifier&quot; ou &quot;Supprimer&quot;"; ?></div>
			</div>
		</li>
		<li>
			<div class="action-ctn">
				<div class="action-title"><?php echo $language ? "Moderate a <strong>comment</strong> on a <strong>news</strong>":"Modérer un <strong>commentaire</strong> sur une <strong>news</strong>"; ?></div>
				<div class="action-desc"><?php echo $language ? "Go to the news in question and click on &quot;Edit&quot; or &quot;Delete&quot;":"Se rendre sur la news en question et cliquer sur &quot;Modifier&quot; ou &quot;Supprimer&quot;"; ?></div>
			</div>
		</li>
	</ul>
		<?php
	}
	?>
	<p><a href="forum.php"><?php echo $language ? 'Back to the forum':'Retour au forum'; ?></a><br />
	<a href="index.php"><?php echo $language ? 'Back to Mario Kart PC':'Retour &agrave; Mario Kart PC'; ?></a></p>
</main>
<?php
include('footer.php');
?>
<?php
mysql_close();
?>
</body>
</html>