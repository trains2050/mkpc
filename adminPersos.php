<?php
include('session.php');
include('initdb.php');
require_once('getRights.php');
if (!hasRight('moderator')) {
	echo 'Access denied';
	mysql_close();
	exit;
}
include('language.php');
include('persos.php');
?>
<!DOCTYPE html>
<html lang="<?php echo $language ? 'en':'fr'; ?>">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
<link rel="stylesheet" href="styles/perso-editor.css" />
<?php
include('o_online.php');
?>
<style type="text/css">
.perso-selector {
	display: inline-block;
	border-style: solid;
	border-width: 5px;
	border-color: transparent;
}
.perso-selector:hover {
	background-color: #90AADD;
	border-color: #90AADD;
}
.perso-selector.perso-selected {
	background-color: #BDE;
	border-color: #BDE;
}
</style>
<script type="text/javascript">
var persoIds = [];
var author = "<?php echo htmlspecialchars($_COOKIE['mkauteur']); ?>";
var language = <?php echo ($language ? 'true':'false'); ?>;
function previewPerso(id) {
	var $myPerso = document.getElementById("myperso-"+id);
	$myPerso.classList.add("perso-animate");
	var $myPersoImg = $myPerso.querySelector("img");
	$myPersoImg.dataset.osrc = $myPersoImg.src;
	$myPersoImg.src = $myPerso.dataset.sprites;
}
function unprevPerso(id) {
	var $myPerso = document.getElementById("myperso-"+id);
	$myPerso.classList.remove("perso-animate");
	var $myPersoImg = $myPerso.querySelector("img");
	$myPersoImg.src = $myPersoImg.dataset.osrc;
	$myPersoImg.dataset.osrc = "";
}
function selectPerso(id) {
	var pid = persoIds.indexOf(id);
	if (pid != -1) {
		document.getElementById("myperso-"+id).classList.remove("perso-selected");
		persoIds.splice(pid,1);
	}
	else {
		document.getElementById("myperso-"+id).classList.add("perso-selected");
		persoIds.push(id);
	}
	var nbPersos = 0;
	for (var pid in persoIds) {
		if (lastPersoId != id)
			lastPersoId = pid;
		nbPersos++;
	}
	if (persoIds.length) {
		var lastPersoId = persoIds[persoIds.length-1];
		document.getElementById("perso-options").style.display = "inline-block";
		var persoData = document.getElementById("myperso-"+lastPersoId).dataset;
		var persoName = persoData.name;
		document.getElementById("perso-options-name").innerHTML = persoName;
		if (persoData.author)
			document.getElementById("perso-options-author").innerHTML = (language ? "By":"Par") + " " + persoData.author;
		else
			document.getElementById("perso-options-author").innerHTML = "";
	}
	else
		document.getElementById("perso-options").style.display = "none";
	document.getElementById("perso-del-nb").innerHTML = persoIds.length;
}
function delPerso() {
	if (confirm(language ? "Confirm deletion of "+ persoIds.length +" characters?":"Confirmer la suppression de "+ persoIds.length +" persos ?")) {
		o_xhr("deleteShare.php", "ids="+persoIds.join(","), function(res) {
			if (res == 1) {
				for (var i=0;i<persoIds.length;i++)
					document.getElementById("myperso-"+persoIds[i]).style.display = "none";
				document.getElementById("perso-options").style.display = "none";
				persoIds.length = 0;
				return true;
			}
			return false;
		});
	}
}
</script>
<title><?php echo $language ? 'Rate characters':'Noter les persos'; ?></title>
</head>
<body>
<?php
$getPsersos = mysql_query('SELECT * FROM `mkchars` WHERE author IS NOT NULL ORDER BY publication_date DESC, id DESC');
$arePersos = mysql_numrows($getPsersos);
if ($arePersos) {
	?>
	<h1><?php echo $language ? 'Delete character shares':'Supprimer des partages de persos'; ?></h1>
	<div id="perso-options" style="min-width: 150px">
		<div id="perso-options-name" style="margin-bottom: 2px"></div>
		<div id="perso-options-author"></div>
		<div class="perso-options-delete">
			<button class="suppr-perso" onclick="javascript:delPerso()"><?php echo $language ? 'Delete [<span id="perso-del-nb">0</span>]':'Supprimer [<span id="perso-del-nb">0</span>]'; ?></button>
		</div>
	</div>
	<div class="mypersos-list">
	<?php
	while ($perso = mysql_fetch_array($getPsersos)) {
		$spriteSrcs = get_sprite_srcs($perso['sprites']);
		?>
		<div id="myperso-<?php echo $perso['id']; ?>" class="perso-selector" onmouseover="previewPerso(<?php echo $perso['id']; ?>)" onmouseout="unprevPerso(<?php echo $perso['id']; ?>)" onclick="selectPerso(<?php echo $perso['id']; ?>)" data-name="<?php echo htmlspecialchars($perso['name']); ?>" data-author="<?php echo htmlspecialchars($perso['author']); ?>" data-sprites="<?php echo $spriteSrcs['hd']; ?>">
			<img src="<?php echo $spriteSrcs['ld']; ?>" alt="<?php echo htmlspecialchars($perso['name']); ?>" loading="lazy" />
		</div>
		<?php
	}
	?>
	</div>
	</div>
	<?php
}
mysql_close();
?>
<p><a href="index.php"><?php echo $language ? "Back to Mario Kart PC":"Retour à Mario Kart PC"; ?></a></p>
</body>
</html>