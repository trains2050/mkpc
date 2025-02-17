<?php
include('initdb.php');
include('getId.php');
include('language.php');
session_start();
require_once('circuitEnums.php');
$musicOptions = $language
	? Array(null, 'Mario Circuit', 'Donut Plains', 'Koopa Beach', 'Choco Island', 'Vanilla Lake', 'Ghost Valley', 'Bowser Castle', 'Rainbow Road', null, 'Mario Circuit', 'Shy Guy Beach', 'Riverside Park', 'Bowser Castle', 'Boo Lake', 'Cheese Land', 'Sky Garden', 'Sunset Wilds', 'Snow Land', 'Ribbon Road', 'Yoshi Desert', 'Lakeside Park', 'Rainbow Road', null,'Figure 8 Circuit','Yoshi Falls','Cheep Cheep Beach','Luigi\'s Mansion','Desert Hills','Delfino Square','Waluigi Pinball','Shroom Ridge','DK Pass','Tick-Tock Clock','Airship Fortress','Peach Gardens','Bowser\'s Castle', 'Rainbow Road')
	: Array(null, 'Circuit Mario', 'Plaine Donut', 'Plage Koopa', 'Île Choco', 'Lac Vanille', 'Vallée Fantôme', 'Château de Bowser', 'Route Arc-en-Ciel', null, 'Circuit Mario', 'Plage Maskass', 'Bord du Fleuve', 'Château de Bowser', 'Lac Boo', 'Pays Fromage', 'Jardin Volant', 'Pays Crépuscule', 'Royaume Sorbet', 'Route Ruban', 'Désert Yoshi', 'Bord du Lac', 'Route Arc-en-Ciel', null, 'Circuit en 8', 'Cascade Yoshi', 'Plage Cheep-Cheep', 'Manoir de Luigi', 'Désert du Soleil', 'Quartier Delfino', 'Flipper Waluigi', 'Corniche Champignon', 'Alpes DK', 'Horloge Tic-Tac', 'Bateau Volant', 'Jardin Peach', 'Château de Bowser', 'Route Arc-en-Ciel');
if (isset($_GET['i'])) {
	$circuitId = intval($_GET['i']);
	if ($circuit = mysql_fetch_array(mysql_query('SELECT * FROM circuits WHERE id="'. $circuitId .'"'))) {
		if ((($circuit['identifiant'] == $identifiants[0]) && ($circuit['identifiant2'] == $identifiants[1]) && ($circuit['identifiant3'] == $identifiants[2]) && ($circuit['identifiant4'] == $identifiants[3])) || (($identifiants[0] == 1390635815) && !$identifiants[1] && !$identifiants[2] && !$identifiants[3])) {
			if ($getCircuitData = mysql_fetch_array(mysql_query('SELECT data FROM circuits_data WHERE id="'. $circuitId .'"')))
				$circuitData = gzuncompress($getCircuitData['data']);
			$circuitImg = json_decode($circuit['img_data']);
			require_once('circuitImgUtils.php');
			?>
<!DOCTYPE html> 
<html lang="<?php echo $language ? 'en':'fr'; ?>"> 
	<head>
		<title><?php echo $language ? 'Create circuit':'Créer circuit'; ?> - Mario Kart PC</title> 
		<meta charset="utf-8" />
		<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
		<link rel="stylesheet" type="text/css" href="styles/editor.css" />
		<link rel="stylesheet" type="text/css" href="styles/draw.css" />
		<script type="text/javascript">
		var language = <?php echo $language ? 1:0; ?>;
		var bgImgs = <?php echo json_encode($bgImages); ?>;
		var musicOptions = <?php echo json_encode($musicOptions); ?>;
		var circuitId = <?php echo $circuitId; ?>;
		var circuitData = <?php echo isset($circuitData) ? $circuitData:'null'; ?>;
		var isBattle = false;
		</script>
		<script src="scripts/vanilla-picker.min.js"></script>
		<script type="text/javascript" src="scripts/editor.js"></script>
		<script type="text/javascript" src="scripts/draw.js"></script>
	</head>
	<body onkeydown="handleKeySortcuts(event)" onbeforeunload="return handlePageExit()" class="editor-body">
		<div id="editor-wrapper" onmousemove="handleMove(event)" onclick="handleClick(event)">
			<div id="editor-ctn">
				<img id="editor-img" src="<?php echo getCircuitImgUrl($circuitImg); ?>" alt="Circuit" onload="imgSize.w=this.naturalWidth;imgSize.h=this.naturalHeight;this.onload=undefined" />
				<svg id="editor" class="editor" />
			</div>
		</div>
		<?php
		$modes = array(
			($language ? 'Basic options':'Infos de base') => array(
				'start' => $language ? 'Start':'Départ',
				'aipoints' => $language ? 'CPUs route':'Trajet ordis',
				'walls' => $language ? 'Walls':'Murs',
				'offroad' => $language ? 'Off-road':'Hors-piste',
				'holes' => $language ? 'Holes':'Trous',
				'checkpoints' => 'Checkpoints',
				'items' => $language ? 'Items':'Objets',
			),
			($language ? 'Advanced':'Avancé') => array(
				'jumps' => $language ? 'Jumps':'Sauts',
				'boosts' => $language ? 'Boosts':'Accélérateurs',
				'decor' => $language ? 'Decor':'Décor',
				'cannons' => $language ? 'Cannons':'Canons',
				'mobiles' => $language ? 'Mobile floor':'Sol mobile',
				'options' => $language ? 'Options':'Divers'
			)
		);
		include('circuitModes.php');
		?>
		<div id="toolbox">
			<div id="mode-selection">
				<button id="mode-decr" class="toolbox-button" onclick="navigateMode(-1)">←</button>
				<select id="mode" name="mode" onchange="selectMode(this.value)">
					<?php
					foreach ($modes as $group=>$modesList) {
						echo '<optgroup label="'.$group.'">';
						foreach ($modesList as $key=>$name) {
							?>
						<option value="<?php echo $key; ?>"><?php echo $name; ?></option>
							<?php
						}
						echo '</optgroup>';
					}
					?>
				</select>
				<button id="mode-incr" class="toolbox-button" onclick="navigateMode(+1)">→</button>
			</div>
			<div id="mode-options">
				<div id="mode-option-start">
					Direction:
					<div class="radio-selector" id="start-dir-selector" data-change="startDirChange">
						<button value="180" class="radio-button radio-button-25 radio-selected button-img" style="background-image:url('images/editor/start180.png')"></button>
						<button value="270" class="radio-button radio-button-25 button-img" style="background-image:url('images/editor/start270.png')"></button>
						<button value="0" class="radio-button radio-button-25 button-img" style="background-image:url('images/editor/start0.png')"></button>
						<button value="90" class="radio-button radio-button-25 button-img" style="background-image:url('images/editor/start90.png')"></button><br />
						<button value="180r" class="radio-button radio-button-25 radio-selected button-img" style="background-image:url('images/editor/start180r.png')"></button>
						<button value="270r" class="radio-button radio-button-25 button-img" style="background-image:url('images/editor/start270r.png')"></button>
						<button value="0r" class="radio-button radio-button-25 button-img" style="background-image:url('images/editor/start0r.png')"></button>
						<button value="90r" class="radio-button radio-button-25 button-img" style="background-image:url('images/editor/start90r.png')"></button>
					</div>
				</div>
				<div id="mode-option-aipoints">
					<select name="traject" id="traject" onchange="trajectChange(this.value,'aipoints')">
					</select>
				</div>
				<div id="mode-option-walls">
					<?php echo $language ? 'Shape:':'Forme :'; ?>
					<div class="radio-selector" id="walls-shape" data-change="shapeChange">
						<button value="rectangle" class="radio-button radio-button-25 button-img" style="background-image:url('images/editor/rectangle.png')"></button>
						<button value="polygon" class="radio-button radio-button-25 radio-selected button-img" style="background-image:url('images/editor/polygon.png')"></button>
					</div>
				</div>
				<div id="mode-option-offroad">
					Type:
					<select name="offroad-type" id="offroad-type" onchange="offroadChange(this.value)">
						<?php
						$typesOffroad = $language ?	array('Grass',	'Water','Ice',	'Choco')
											 :	array('Herbe',	'Eau',	'Glace','Choco');
						foreach ($typesOffroad as $i=>$typeOffroad)
							echo '<option value="'. $i .'">'. $typeOffroad .'</option>';
						echo '<option value="-1" class="special-option">'. ($language ? 'Transfer...':'Transférer...') .'</option>';
						?>
					</select>
					<?php echo $language ? 'Shape:':'Forme :'; ?>
					<div class="radio-selector" id="offroad-shape" data-change="shapeChange">
						<button value="rectangle" class="radio-button radio-button-25 radio-selected button-img" style="background-image:url('images/editor/rectangle.png')"></button>
						<button value="polygon" class="radio-button radio-button-25 button-img" style="background-image:url('images/editor/polygon.png')"></button>
					</div>
				</div>
				<div id="mode-option-holes">
					<?php echo $language ? 'Shape:':'Forme :'; ?>
					<div class="radio-selector" id="holes-shape" data-change="shapeChange">
						<button value="rectangle" class="radio-button radio-button-25 radio-selected button-img" style="background-image:url('images/editor/rectangle.png')"></button>
						<button value="polygon" class="radio-button radio-button-25 button-img" style="background-image:url('images/editor/polygon.png')"></button>
					</div>
				</div>
				<div id="mode-option-checkpoints">
					<span id="checkpoints-nblaps"></span>
					[<a href="javascript:showLapsOptions()"><?php echo $language ? 'Edit':'Modifier'; ?></a>]
					<div id="checkpoints-disclaimer">
					<?php
					if ($language) {
						?>
						Checkpoint positioning is a bit tricky, don't hesitate to read the <a href="javascript:showHelp()">help</a> section.
						<?php
					}
					else {
						?>
						Le positionnement des checkpoints est complexe, n'hésitez pas à lire l'<a href="javascript:showHelp()">aide</a>.
						<?php
					}
					?>
					</div>
				</div>
				<div id="mode-option-boosts">
					<?php echo $language ? 'Size':'Taille'; ?>:
					<input type="text" id="boost-w" size="1" value="8" maxlength="3" onchange="boostSizeChanged()" />&times;<input type="text" id="boost-h" size="1" value="8" maxlength="3" onchange="boostSizeChanged()" />
				</div>
				<div id="mode-option-decor">
					<?php printModeDecor(); ?>
				</div>
				<div id="mode-option-cannons">
					<?php echo $language ? 'Shape:':'Forme :'; ?>
					<div class="radio-selector" id="cannons-shape" data-change="shapeChange">
						<button value="rectangle" class="radio-button radio-button-25 radio-selected button-img" style="background-image:url('images/editor/rectangle.png')"></button>
						<button value="polygon" class="radio-button radio-button-25 button-img" style="background-image:url('images/editor/polygon.png')"></button>
					</div>
				</div>
				<div id="mode-option-mobiles">
					<?php echo $language ? 'Shape:':'Forme :'; ?>
					<div class="radio-selector" id="mobiles-shape" data-change="shapeChange">
						<button value="rectangle" class="radio-button radio-button-25 radio-selected button-img" style="background-image:url('images/editor/rectangle.png')"></button>
						<button value="polygon" class="radio-button radio-button-25 button-img" style="background-image:url('images/editor/polygon.png')"></button>
						&nbsp;<button value="circle" class="radio-button radio-button-25 button-img" style="background-image:url('images/editor/circle.png')"></button>
					</div>
				</div>
				<div id="mode-option-options">
					<div>
						<?php echo $language ? 'Background image:':'Arrière-plan :'; ?>
						<br />
						<button id="button-bgimg" class="toolbox-button" onclick="showBgSelector()"></button>
					</div>
					<div>
						<?php echo $language ? 'Music:':'Musique :'; ?>
						<button id="button-music" class="toolbox-button" onclick="showMusicSelector()"></button><br />
					</div>
					<div>
						<?php echo $language ? 'Out color:':'Couleur de fond :'; ?>
						<button id="button-bgcolor" class="toolbox-button" onclick="showColorSelector()"></button><br />
					</div>
					<div>
						<?php echo $language ? 'Image:':'Image :'; ?>
						<button id="button-imgoptions" class="toolbox-button" onclick="showImageOptions()"><?php echo $language ? 'Edit...':'Modifier...'; ?></button>
					</div>
				</div>
			</div>
			<div id="zoom-ctrl">
				Zoom:<div><img src="images/editor/zoom-less.png" class="fancy-title" onclick="zoomLess()" title="<?php echo $language ? 'Unzoom':'Dézoomer'; ?> (Ctrl+↓)" /><span id="zoom-value">100</span>%<img src="images/editor/zoom-more.png" class="fancy-title" onclick="zoomMore()" title="<?php echo $language ? 'Zoom':'Zoomer'; ?> (Ctrl+↑)" /></div>
			</div>
			<div id="history-ctrl">
				<img src="images/editor/undo.png" class="fancy-title" onclick="undo()" title="<?php echo $language ? 'Undo':'Annuler'; ?> (Ctrl+Z)" />
				<div><?php echo $language ? 'History':'Historique'; ?></div>
				<img src="images/editor/redo.png" class="fancy-title" onclick="redo()" title="<?php echo $language ? 'Redo':'Refaire'; ?> (Ctrl+Y)" />
			</div>
			<div id="editor-theme">
				<?php echo $language ? 'Theme:':'Thème :'; ?>
				<div class="radio-selector" id="theme-selector" data-change="themeChange">
					<button value="light" class="radio-button radio-selected editor-theme editor-theme-light">■</button>
					<button value="dark" class="radio-button editor-theme editor-theme-dark">■</button>
				</div>
			</div>
			<div id="save-buttons">
				<button class="toolbox-button fancy-title fancy-title-center" onclick="saveData()" title="Ctrl+S"><?php echo $language ? 'Save':'Sauvegarder'; ?></button>
			</div>
			<div id="editor-back">
				<a href="javascript:showHelp()"><?php echo $language ? 'Help':'Aide'; ?></a>
				<a href="draw.php"><?php echo $language ? 'Back':'Retour'; ?></a>
			</div>
		</div>
		<div id="traject-options" class="fs-popup" onclick="event.stopPropagation()">
			<div class="close-ctn">
				<a href="javascript:closeTrajectOptions()" class="close">&nbsp; &times; &nbsp;</a>
			</div>
			<div class="traject-info">
				<div id="traject-menu">
					<div class="traject-specific traject-specific-aipoints">
					<?php
					echo $language ? 'This menu allows you to create several routes,
									  thus add diversity in CPUs behaviour.<br />
									  For example, if you specifies 2 routes,
									  half of the CPUs will take the 1<sup>st</sup> one,
									  and the other half will take the 2<sup>nd</sup> one.<br />
									  You can indicate up to 7 routes.'
								   : 'Ce menu vous permet de créer plusieurs trajets différents,
								   	  et ainsi ajouter de la diversité dans le comportement des ordis.<br />
									  Si vous avez spécifié 2 trajets par exemple,
									  la moitié des ordis prendront le 1<sup>er</sup> trajet, et l\'autre motié le 2<sup>e</sup>.<br />
									  Vous pouvez indiquer jusqu\'à 7 trajets.';
					?>
					</div>
					<div class="traject-specific traject-specific-bus">
					<?php
					echo $language ? 'This menu allows you to create several routes
									  for the bus trajects.<br />
									  For example, if you want some bus to go in one way
									  and the other ones to go the other way, you\'ll define
									  2 routes, one for each way.'
								   : 'Ce menu vous permet de créer plusieurs trajets différents
									  pour définir les trajets des bus.<br />
									  Par exemple, si vous voulez que certains bus aillent dans	 
									  un sens et que d\'autres aillent dans l\'autre sens,
									  vous allez définir 2 trajets, un pour chaque sens.<br />';
					?>
					</div>
					<?php
					echo '<div class="traject-manage">';
					echo '<a href="javascript:showTrajectAdd()">'. ($language ? 'Add a route':'Ajouter un trajet') .'</a>';
					echo '<a href="javascript:showTrajectCopy()">'. ($language ? 'Copy a route':'Copier un trajet') .'</a>';
					echo '<a href="javascript:showTrajectRemove()">'. ($language ? 'Delete a route':'Supprimer un trajet') .'</a>';
					echo '</div>';
					?>
				</div>
				<div id="traject-more">
					<h1><?php echo $language ? 'Add a route':'Ajouter un trajet'; ?></h1>
					<div>
						<?php echo $language ? 'Create route from:':'Créer le trajet à partir de :'; ?>
						<select id="traject-more-list"></select>
						<div class="popup-buttons">
							<button class="options" onclick="initTrajectOptions()"><?php echo $language ? 'Back':'Retour'; ?></button>
							<button class="options" onclick="addTraject()"><?php echo $language ? 'Submit':'Valider'; ?></button>
						</div>
					</div>
				</div>
				<div id="traject-copy">
					<h1><?php echo $language ? 'Copy a route':'Copier un trajet'; ?></h1>
					<div>
						<?php
						echo $language ? 'This option allows you to replace one of the routes you created by another one.
										  For example, it could be useful if you created route&nbsp;2 from route&nbsp;1, but then you re-edited route 1.<br />
										  In that case, you might want to apply changes on route 1 to route 2.'
									   : 'Cette option vous permet de remplacer un des trajets que vous avez créés par un autre trajet.<br />
									   	  Cela peut être utile par exemple, si vous avez créé le trajet&nbsp;2 à partir du trajet&nbsp;1, mais que vous avez ensuite remodifié le trajet&nbsp;1.<br />
									   	  Vous pouvez alors appliquer les modifications du trajet&nbsp;1 sur le trajet&nbsp;2.';
						echo '<br />';
						echo '<br />';
						echo $language ? 'Copy from: ':'Copier de : ';
						echo '<select id="copyFrom"></select>';
						echo $language ? ' to: ':' vers : ';
						echo '<select id="copyTo"></select>';
						?>
						<div class="popup-buttons">
							<button class="options" onclick="initTrajectOptions()"><?php echo $language ? 'Back':'Retour'; ?></button>
							<button class="options" onclick="copyTraject()"><?php echo $language ? 'Submit':'Valider'; ?></button>
						</div>
					</div>
				</div>
				<div id="traject-less">
					<h1><?php echo $language ? 'Delete a route':'Supprimer un trajet'; ?></h1>
					<div>
						<?php echo $language ? 'Delete given route:' : 'Supprimer le trajet suivant :'; ?>
						<select id="traject-less-list"></select>
						<div class="popup-buttons">
							<button class="options" onclick="initTrajectOptions()"><?php echo $language ? 'Back':'Retour'; ?></button>
							<button class="options" onclick="removeTraject()"><?php echo $language ? 'Submit':'Valider'; ?></button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="offroad-transfer" class="fs-popup" onclick="event.stopPropagation()">
			<?php
			echo $language ? 'This menu allows you to change the type of an off-road a posteriori.
							  For example, if you have indicated a &quot;grass&quot; off-road
							  and you want to change it to &quot;water&quot;, just do it here.'
						   : 'Ce menu vous permet de modifier le type d\'un hors-piste a posteriori.
							  Par exemple, si vous avez indiqué un hors-piste de type &quot;herbe&quot;
							  et que vous souhaitez finalement le modifier en type &quot;eau&quot;, il vous suffit de le demander ici.';
			echo '<br />';
			echo '<br />';
			echo $language ? 'Transfer from: ':'Transférer de : ';
			echo '<select id="transferFrom">';
			foreach ($typesOffroad as $i=>$typeOffroad)
				echo '<option value="'. $i .'">'. $typeOffroad .'</option>';
			echo '</select>';
			echo $language ? ' to: ':' vers : ';
			echo '<select id="transferTo">';
			foreach ($typesOffroad as $i=>$typeOffroad)
				echo '<option value="'. $i .'">'. $typeOffroad .'</option>';
			echo '</select>';
			echo '<div class="popup-buttons">';
			echo '<button class="options" onclick="closeTransferOffroad()">'. ($language ? 'Cancel':'Annuler') .'</button>';
			echo ' ';
			echo '<button class="options" onclick="transferOffroad()">'. ($language ? 'Submit':'Valider') .'</button>';
			echo '</div>';
			?>
		</div>
		<div id="choptions" class="fs-popup" onclick="event.stopPropagation()">
			<h1><?php echo $language ? 'Edit laps system':'Modifier le système de tours'; ?></h1>
			<div class="choptions-type">
				<span class="chlabel"><?php echo $language ? 'Type:':'Type :'; ?></span>
				<span>
					<a 
						class="tab-ch" 
						href="javascript:selectChTab(0)"><?php echo $language ? 'Laps':'Tours'; ?></a><a 
						class="tab-ch" 
						href="javascript:selectChTab(1)"><?php echo $language ? 'Sections':'Sections'; ?></a>
				</span>
			</div>
			<div class="choptions-settings">
				<label><span class="chlabel"><?php echo $language ? 'Number of laps:':'Nombre de tours :'; ?></span>
				<select id="choptions-nblaps"><?php
				for ($i=1;$i<=9;$i++)
					echo '<option value="'.$i.'"'. ($i==3 ? ' selected="selected"':'') .'>'.$i.'</option>';
				?></select></label>
			</div>
			<div class="choptions-settings">
				<label><span class="chlabel"><?php echo $language ? 'Number of sections:':'Nombre de sections :'; ?></span>
				<select id="choptions-nbsections" onchange="updateSectionSelects(false)"><?php
				for ($i=1;$i<=9;$i++)
					echo '<option value="'.$i.'"'.($i==3 ? ' selected="selected"':'').'>'.$i.'</option>';
				?></select></label>
				<div id="section-checkpoints"><?php
				for ($i=2;$i<=9;$i++) {
					echo '<div id="section-checkpoint-'. $i .'"><label><span class="chlabel">'. ($language ? 'Start of section':'Début section') .' '.$i.' : </span>';
					echo '<select></select>';
					echo '</label></div>';
				}
				?></div>
				<div id="section-error"><?php echo $language ? 'You must create checkpoints to define sections':'Vous devez créer des checkpoints pour définir les sections'; ?></div>
			</div>
			<div class="chsubmit popup-buttons">
				<button class="options" onclick="closeLapsOptions()"><?php echo $language ? 'Undo':'Annuler'; ?></button>
				<button class="options" onclick="submitLapsOptions()"><?php echo $language ? 'Submit':'Valider'; ?></button>
			</div>
		</div>
		<div id="bg-selector" class="fs-popup" onclick="event.stopPropagation()">
			<div id="bg-selector-tabs">
			<?php
			$decors = Array (
				'SNES' => array_slice($bgImages, 0,8),
				'GBA' => array_slice($bgImages, 8,20),
				'DS' => array_slice($bgImages, 28,20)
			);
			$i = 0;
			foreach ($decors as $name=>$decorGroup) {
				echo '<a id="bg-selector-tab-'.$i.'" href="javascript:showBgTab('.$i.')">'.$name.'</a>';
				$i++;
			}
			?>
			</div>
			<div id="bg-selector-options">
			<?php
			$i = 0;
			$j = 0;
			foreach ($decors as $name=>$decorGroup) {
				echo '<div class="bg-selector-optgroup" data-value="'.$i.'" id="bg-selector-optgroup-'.$i.'">';
				foreach ($decorGroup as $decor) {
					?>
					<div id="bgchoice-<?php echo $j; ?>" data-value="<?php echo $j; ?>" onclick="changeBg(this)">
						<?php
						foreach ($decor as $img)
							echo '<span style="background-image:url(\'images/map_bg/'.$img.'.png\')"></span>';
						?>
					</div>
					<?php
					$j++;
				}
				echo '</div>';
				$i++;
			}
			?>
			</div>
		</div>
		<div id="music-selector" class="fs-popup" onclick="event.stopPropagation()" oncontextmenu="event.stopPropagation()">
			<table>
				<tr>
					<th>SNES</th>
					<th>GBA</th>
					<th>DS</th>
				</tr>
				<tr>
					<td>
					<?php
					for ($i=1;$i<=8;$i++)
						echo '<a id="musicchoice-'.$i.'" href="javascript:selectMusic('.$i.')">'.$musicOptions[$i].'</a>';
					?>
					</td>
					<td>
					<?php
					for ($i=10;$i<=22;$i++)
						echo '<a id="musicchoice-'.$i.'" href="javascript:selectMusic('.$i.')">'.$musicOptions[$i].'</a>';
					?>
					</td>
					<td>
					<?php
					for ($i=24;$i<=37;$i++)
						echo '<a id="musicchoice-'.$i.'" href="javascript:selectMusic('.$i.')">'.$musicOptions[$i].'</a>';
					?>
					</td>
				</tr>
				<tr>
					<td colspan="3" class="youtube">
						<a id="musicchoice-0" href="javascript:selectMusic(0)">Youtube</a>
						<div>
							<?php echo $language ? 'Video URL':'Adresse vidéo'; ?> :
							<input type="text" name="youtube" id="youtube-url" placeholder="https://www.youtube.com/watch?v=NNMy4DKKDFA" onchange="playYt()" />
						</div>
					</td>
				</tr>
			</table>
			<div class="popup-buttons">
				<button class="options" onclick="undoMusic()"><?php echo $language ? 'Undo':'Annuler'; ?></button> <button id="cMusic" class="options" onclick="submitMusic()"><?php echo $language ? 'Submit':'Valider'; ?></button>
			</div>
		</div>
		<div id="help" class="fs-popup" onclick="event.stopPropagation()">
			<div class="close-ctn">
				<span class="title"><?php echo $language ? 'Help':'Aide'; ?></span>
				<a href="javascript:closeHelp()" class="close">&nbsp; &times; &nbsp;</a>
			</div>
			<div id="help-buttons" class="radio-selector" data-change="helpChange">
				<?php
				$helpItems = array(
					'start' => array(
						'title' => $language ? 'Start':'Départ',
						'text' => ($language ?
							"Define here positions where karts will start race.
							Click on the buttons at the right menu to choose start orientation.
							Then click on the map to place start positions.
							You can change those positions later by right-clicking on then en clicking on &quot;Move&quot;."
							:
							"Définissez ici les positions de départ des karts.
							Cliquez sur un des 8 boutons dans le menu de droite pour choisir l'orientation de départ.
							Cliquez ensuite sur la carte pour placer les positions de départ.
							Vous pouvez modifier ces positions a posteriori en faisant un clic droit dessus et en cliquant sur &quot;Déplacer&quot;."
						)
					),
					'aipoints' => array(
						'title' => $language ? 'CPUs route':'Trajet ordis',
						'text' => ($language ?
							"Define here the trajectory that the karts will follow.
							First place the point that the computers will follow in 1<sup>st</sup>, then the point they will follow in 2<sup>nd</sup>, and so on.
							When finished, click on the first point to close the loop. You can then:
							<ul>
								<li>Move points by clicking on them</li>
								<li>Add a point by clicking on a line linking 2 points</li>
								<li>Delete a point by right-clicking on it</li>
							</ul>
							Finally, you can define other trajectories by clicking on the drop-down menu in the right menu."
							:
							"Définissez ici la trajectoire que vont suivre les karts ordis.
							Placez d'abord le point que les ordis vont suivre en 1<sup>er</sup>, puis le point qu'ils vont suivre en 2<sup>e</sup>, et ainsi de suite.
							Lorsque vous avez fini, recliquez sur le 1<sup>er</sup> point pour fermer la boucle. Vous pouvez ensuite :
							<ul>
								<li>Déplacer des points en cliquant dessus</li>
								<li>Ajouter un point en cliquant sur une ligne reliant 2 points</li>
								<li>Supprimer un point en faisant un clic droit dessus</li>
							</ul>
							Enfin, vous pouvez définir d'autres trajectoires en cliquant sur le menu déroulant dans le menu de droite."
						)
					),
					'walls' => array(
						'title' => $language ? 'Walls':'Murs',
						'text' => ($language ?
							"Walls are areas of the circuit where karts cannot pass.
							You have 2 options to define a wall: rectangle
							<button value=\"rectangle\" class=\"radio-button radio-button-25 button-img\" style=\"background-image:url('images/editor/rectangle.png')\"></button>
							or polygon
							<button value=\"polygon\" class=\"radio-button radio-button-25 button-img\" style=\"background-image:url('images/editor/polygon.png')\"></button>
							<ul>
								<li>Rectangle: click once to define one of the corners of the rectangle, then a second time to define the opposite corner.</li>
								<li>Polygon: click to draw the first point, then click again to draw the next point, and so on. When you have finished, click on the first point to close the polygon.</li>
							</ul>
							Once the wall area has been defined, you can modify or delete it by right clicking on it."
							:
							"Les murs sont les zones du circuit où les karts ne peuvent pas passer.<br />
							Vous avez 2 formes possibles pour définir un mur : rectangle
							<button value=\"rectangle\" class=\"radio-button radio-button-25 button-img\" style=\"background-image:url('images/editor/rectangle.png')\"></button>
							ou polygone
							<button value=\"polygon\" class=\"radio-button radio-button-25 button-img\" style=\"background-image:url('images/editor/polygon.png')\"></button>
							<ul>
								<li>Rectangle : cliquez une première fois pour définir un des coins du rectangle, puis une seconde fois pour définir le coin opposé.</li>
								<li>Polygone : cliquez pour tracer le premier point, puis cliquez à nouveau pour tracer le point suivant, et ainsi de suite. Quand vous avez fini, recliquez sur le 1<sup>er</sup> point pour fermer le polygone.</li>
							</ul>
							Une fois la zone du mur définie, vous pouvez la modifer ou la supprimer en faisant un clic droit dessus."
						)
					),
					'offroad' => array(
						'title' => $language ? 'Off-road':'Hors-piste',
						'text' => ($language ?
							"Off-roads are places of the circuits in which the karts are slowed down: grass, water, etc.
							You select the type of off-track from the drop-down list on the right menu.<br />
							As for <a href=\"javascript:selectHelpTab('walls')\">walls</a>, you can then define off-road areas by rectangles or polygons."
							:
							"Les hors-pistes sont les endroits du circuit dans lesquels les karts sont ralentis : herbe, eau, etc.
							Vous sélectionnez le type de hors-piste dans la liste déroulante sur le menu de droite.<br />
							Comme pour les <a href=\"javascript:selectHelpTab('walls')\">murs</a>, vous pouvez ensuite définir les zones de hors-piste par des rectangles ou des polygones."
						)
					),
					'holes' => array(
						'title' => $language ? 'Holes':'Trous',
						'text' => ($language ?
							"Holes are the areas where the karts that move over it fall and are replaced: void, lava, water...
							To define a hole, you thus need to specify 2 information: hole area, and respawn position.
							<ul>
								<li>Hole area: as for <a href=\"javascript:selectHelpTab('walls')\">walls</a>, you can define the area by a rectangle or by a polygon.</li>
								<li>Respawn position: click where you want the kart to land.
								An arrow appears: it indicates the direction of respawn.
								Click on the point at the end of the arrow to change that direction.
								Note that a right click on that same point let you move the arrow.</li>
							</ul>"
							:
							"Les trous sont les zones où les karts qui roulent dessus tombent et sont replacés : vide, lave, eau...
							Pour définir un trou, vous avez donc besoin de renseigner 2 informations : la zone du trou, et la position de replacement.
							<ul>
								<li>Zone du trou : comme pour les <a href=\"javascript:selectHelpTab('walls')\">murs</a>,
								vous pouvez définir la zone par un rectangle ou par un polygone.</li>
								<li>Position de replacement : Cliquez là où vous voulez que le kart réapparaisse.
								Une flèche apparait alors : il indique la direction de replacement.
								Cliquez sur le point à l'extrémité de la flèche pour changer cette direction.
								Notez qu'un clic droit sur ce même point permet de déplacer la flèche.
								</li>
							</ul>"
						)
					),
					'checkpoints' => array(
						'title' => 'Checkpoints',
						'text' => ($language ?
							"Checkpoints are rectangular areas that serve two purposes:
							<ul>
								<li>Check that a player has completed a lap (you must go through all the checkpoints in order for the lap to count)</li>
								<li>Rank players during the race (1<sup>st</sup>, 2<sup>nd</sup>, etc.).
								The 1<sup>st</sup> is the player who has passed the most checkpoints;
								and in case of tie, it is the one closest to the next checkpoint.</li>
							</ul>
							Concretely, how to place the checkpoints?
							<ul>
								<li>The 1<sup>st</sup> checkpoint must be placed at the start line, it defines the start of a lap.</li>
								<li>Then place the following checkpoints before each turn (see image opposite).
								In this way, the distance to the next checkpoint is a good indicator of a player's position relative to another one.</li>
							</ul>
							Finally, you can set the number of laps or sections by clicking &quot;Edit&quot; in the right menu."
							:
							"Les checkpoints sont des zones rectangulaires qui servent à deux choses :
							<ul>
								<li>Vérifier qu'un joueur a bien complété un tour (il faut passer par tous les checkpoints dans l'ordre pour que le tour soit comptabilisé)</li>
								<li>Pouvoir classer les joueurs pendant la course (1<sup>er</sup>, 2<sup>e</sup>, etc). Le 1<sup>er</sup> est le joueur qui a passé le plus de checkpoints; et si égalité, c'est celui qui est le plus proche du checkpoint suivant.</li>
							</ul>
							Concrètement, comment placer les checkpoints ?
							<ul>
								<li>Le 1<sup>er</sup> checkpoint doit être placé au niveau de la ligne de départ, il définit le début d'un tour.</li>
								<li>Placez ensuite les checkpoints suivants avant chaque virage (cf image ci-contre). De cette façon, la distance au checkpoint suivant est une bon indicateur de la position d'un joueur par rapport à un autre.</li>
							</ul>
							Enfin, vous pouvez définir le nombre de tours ou de sections en cliquant sur &quot;Modifier&quot; dans le menu de droite."
						)
					),
					'items' => array(
						'title' => $language ? 'Items':'Objets',
						'text' => ($language ?
							"Here you define the positions of the item boxes of the circuit.
							Just click anywhere on the map of your choice to place an item there."
							:
							"Vous définissez ici les positions des boîtes à objet du circuit.
							Cliquez simplement sur un endroit de la carte de votre choix pour placer un objet à cet endroit."
						)
					),
					'jumps' => array(
						'title' => $language ? 'Jumps':'Sauts',
						'text' => ($language ?
							"Indicate here the jumps, that is to say the areas that give instant height to the karts that roll on it.
							You define a jump box by a rectangle.<br />
							Note that the larger the area drawn, the higher the jump will be when arriving on this zone.
							If you want to reduce the height of the jump, make several smaller rectangles, each one filling part of the area."
							:
							"Indiquez ici les sauts, c'est-à-dire les zones qui donnent de la hauteur aux karts qui roulent dessus.
							Vous définissez une zone de saut par un rectangle.<br />
							Notez que plus la zone dessinée est grande, plus les karts feront des grands sauts en arrivant sur cette zone.
							Si vous souhaitez réduire la hauteur du saut, faites plusieurs rectangles plus petits, chacun remplissant une partie de la zone."
						)
					),
					'boosts' => array(
						'title' => $language ? 'Boosts':'Accélérateurs',
						'text' => ($language ?
							"Indicate here the boosts, that is to say the areas that give instant speed to karts.
							To set the location of a boost, simply click on the desired location in the map.<br />
							By default, a boost is of size 8×8. You can change this size in the right menu."
							:
							"Indiquez ici les accélérateurs, c'est-à-dire les zones qui donnent de la vitesse aux karts qui roulent dessus.
							Pour définir l'emplacement d'un accélérateur, cliquez simplement sur l'endroit de la carte désiré.<br />
							Par défaut, un accélérateur fait 8&times;8 de côté. Vous pouvez modifier cette taille dans le menu de droite."
						)
					),
					'cannons' => array(
						'title' => $language ? 'Cannons':'Canons',
						'text' => ($language ?
							"Cannons are areas that quickly transport you from one point to another on the circuit.
							To define a cannons, you specify 2 information: cannon area, and replacement area.
							<ul>
								<li>Canon area: as for the <a href=\"javascript:selectHelpTab('walls')\">walls</a>,
								you can define the area by a rectangle or by a polygon.</li>
								<li>Replacement area: Click where you want the kart to be transported.</li>
							</ul>"
							:
							"Les canons sont des zones qui vous transportent rapidement d'un point à un autre du circuit.
							Pour définir un canon, vous renseignez 2 informations : la zone du canon, et la zone de replacement.
							<ul>
								<li>Zone du canon : comme pour les <a href=\"javascript:selectHelpTab('walls')\">murs</a>,
								vous pouvez définir la zone par un rectangle ou par un polygone.</li>
								<li>Zone de replacement : Cliquez là où vous voulez que le kart soit transporté.</li>
							</ul>"
						)
					),
					'mobiles' => array(
						'title' => $language ? 'Mobile floor':'Sol mobile',
						'text' => ($language ?
						"The &quot;Mobile floor&quot; tool allows to define the areas of the circuit where the kart is driven in one direction: conveyor belt, turntable, water stream...
						To define a mobile floor, you specify 2 information: the mobile area, and the direction where the kart is being pushed.
						<ul>
							<li>Mobile area: there are 3 possible shapes; rectangle, polygon and circle.
							Rectangle and polygon allow to define a translating area, circle define a rotating area.</li>
							<li>Pusing direction: once area entered, an arrow appears. Place this arrow in the desired direction and force. The larger the arrow, the stronger the pushing force.</li>
						</ul>"
						:
						"L'outil &quot;sol mobile&quot; permet de définir des zones du circuits où le kart est entraîné dans une direction : tapis roulant, plateau tournant, courants d'eau...
						Pour définir un sol mobile, vous renseignez 2 informations : la zone mobile, et la direction vers laquelle le kart est poussé.
						<ul>
							<li>Zone mobile : il y a 3 formes possibles; rectangle, polygone et cercle.
							Le rectangle et le polygone permettent de définir une zone en translation, le cercle définit une zone en rotation.</li>
							<li>Direction de poussée : une fois la zone entrée, une flèche apparait. Placez cette flèche dans la direction et la force souhaitée.
							Plus la flèche est grande, plus la poussée sera forte.</li>
						</ul>")
					),
					'decor' => array(
						'title' => $language ? 'Decor':'Décor',
						'text' => ($language ?
							"The decor are the objects or mobs that you encounter on the map: thwomps, pipes, ...
							You select the type of decor in the menu on the right.
							Click on the map location of your choice to place a decor in that location."
							:
							"Les décors sont les objets ou monstres que vous rencontrez sur la carte : thwomps, tuyaux, ...
							Vous sélectionnez le type de décor dans le menu de droite.
							Cliquez sur un endroit de la carte de votre choix pour placer un décor à cet endroit."
						)
					),
					'options' => array(
						'title' => $language ? 'Options':'Divers',
						'text' => ($language ?
							"Define here various options:
							<ul>
								<li><a href=\"javascript:selectHelpTab('bg')\">Background image</a>: this is the image displayed behind the circuit (on the horizon).</li>
								<li><a href=\"javascript:selectHelpTab('music')\">Music</a>: defines the music played during the race.</li>
								<li><a href=\"javascript:selectHelpTab('color')\">Out color</a>: sets the color displayed around the circuit image.</li>
								<li><a href=\"javascript:selectHelpTab('image')\">Image</a>: change the image of the circuit, or resize / rotate it.</li>
							</ul>"
							:
							"Définissez ici des options diverses :
							<ul>
								<li><a href=\"javascript:selectHelpTab('bg')\">Arrière-plan</a> : il s'agit de l'image affichée derrière le circuit (à l'horizon).</li>
								<li><a href=\"javascript:selectHelpTab('music')\">Musique</a> : définit la musique jouée pendant la course.</li>
								<li><a href=\"javascript:selectHelpTab('color')\">Couleur de fond</a> : définit la couleur affichée tout autour de l'image du circuit.</li>
								<li><a href=\"javascript:selectHelpTab('image')\">Image</a> : permet de modifier l'image du circuit, ou de la redimensionner/pivoter.</li>
							</ul>"
						)
					),
					'bg' => array(
						'title' => $language ? 'Background image':'Arrière-plan',
						'text' => ($language ?
							"Allows you to indicate the scenery image that will be displayed behind the circuit (on the horizon).
							Just click on the background image of your choice."
							:
							"Permet d'indiquer l'image de décor qui sera affichée derrière le circuit (à l'horizon).
							Cliquez simplement sur l'image d'arrière-plan de votre choix."
						)
					),
					'music' => array(
						'title' => $language ? 'Music':'Musique',
						'text' => ($language ?
							"Choose the music of the type of circuit that will be played during the race (if enabled in the options).
							You can set an original music by selecting the associated circuit, or any music from Youtube.
							For the latter option, simply enter the address of the desired Youtube video.
							This address looks like this: https://www.youtube.com/watch?v=f6nylHp39JE"
							:
							"Choisissez la musique du type de circuit qui sera jouée pendant la course (si elle est activée dans les options).
							Vous pouvez définir une musique originale en sélectionnant le circuit associé, ou bien une musique quelconque à partir de Youtube.
							Pour cette dernière option, entrez simplement l'adresse de la vidéo Youtube souhaitée.
							Cette adresse ressemble à ceci : https://www.youtube.com/watch?v=f6nylHp39JE"
						)
					),
					'color' => array(
						'title' => $language ? 'Out color':'Couleur de fond',
						'text' => ($language ?
							"Sets the color displayed outside the circuit (around the circuit image).
							Simply select the color in the proposed color gradient.
							To have a different gradient, move the cursor at the top.<br />
							Once the color is selected, click on &quot;Ok&quot;. To cancel, press Esc."
							:
							"Définit la couleur affichée à l'extérieur du circuit (autour de l'image du circuit).
							Sélectionnez simplement la couleur dans le dégradé de couleurs proposé.
							Pour avoir un dégradé différent, déplacez le curseur en haut.<br />
							Une fois la couleur sélectionnée, cliquez sur &quot;Ok&quot;.
							Pour annuler, appuyez sur Echap."
						)
					),
					'image' => array(
						'title' => $language ? 'Image':'Image',
						'text' => ($language ?
							"If you want to edit, resize, or rotate the circuit image, you can do it in this menu.
							<ul>
								<li>Change the circuit image: select the new image from your hard drive, and click on &quot;Validate&quot;.</li>
								<li>Resize the image: enter the new desired dimensions and click on &quot;Validate&quot;.</li>
								<li>Rotate / flip the image: click on the desired option and click on &quot;Validate&quot;.</li>
							</ul>
							In the second and third case, in addition to the image, the various elements of the circuit (starting position, walls, etc.) are also modified to adapt to the transformation."
							:
							"Si vous souhaitez modifier, redimensionner ou pivoter l'image du circuit, vous pouvez le faire dans ce menu.
							<ul>
								<li>Modifier l'image du circuit : sélectionner la nouvelle image depuis votre disque dur, et cliquez sur &quot;Valider&quot;.</li>
								<li>Redimensionner l'image : entrez les nouvelles dimensions souhaitées et cliquez sur &quot;Valider&quot;.</li>
								<li>Pivoter/retourner l'image : cliquez sur l'option souhaitée et cliquez sur &quot;Valider&quot;.</li>
							</ul>
							Dans le 2<sup>e</sup> et 3<sup>e</sup> cas, en plus de l'image, les différents éléments du circuit (position de départ, murs, etc) sont également modifiés pour s'adapter à la transformation."
						)
					)
				);
				foreach ($helpItems as $key=>$item) {
					echo '<button class="radio-button" value="'.$key.'">'.$item['title'].'</button>';
				}
				?>
			</div>
			<div class="help-content">
				<div class="help-text">
					<?php
					foreach ($helpItems as $key=>$item)
						echo '<div id="help-text-'.$key.'">'.$item['text'].'</div>';
					?>
				</div>
				<div class="help-img"><img src="images/editor/help-draw/help-start.png" id="help-img" alt="Help" /></div>
			</div>
		</div>
		<?php
		if (isset($_GET['uploaded'])) {
			?>
			<div class="editor-mask mask-dark" id="circuit-created">
				<div class="fs-popup" onclick="event.stopPropagation()" style="display:block">
					<div>
						<div><?php
							echo $language ? 'The circuit has been created successfully !<br />
							Now you need to specify the circuit settings : location of walls, objects, ...<br />
							If necessary, click on the &quot;Help&quot; link at the bottom in the right menu.<br />
							When you have finished, don\'t forget to save the data by clicking on &quot;Save&quot;.<br />
							Then you can access, edit or delete your circuit from the creation mode home.' :
							'Le circuit a été créé avec succès !<br />
							Vous devez maintenant entrer les éléments du circuit : emplacements des murs, des objets,...<br />
							En cas de besoin, cliquez sur le lien &quot;Aide&quot; en bas du menu de droite.<br />
							Lorsque vous avez fini, n\'oubliez pas d\'enregistrer les données en cliquant sur &quot;Sauvegarder&quot;.<br />
							Vous pouvez ensuite accéder, modifier ou supprimer ce circuit depuis l\'accueil du mode création.';
						?></div>
						<div class="popup-buttons">
							<button id="ok" onclick="document.getElementById('circuit-created').close()" autofocus>Ok</button>
						</div>
					</div>
				</div>
			</div>
			<?php
		}
		?>
		<iframe id="image-options" class="fs-popup" src="changeMap.php?i=<?php echo $circuitId; ?>" onclick="event.stopPropagation()"></iframe>
	</body>
</html>
			<?php
		}
	}
	?>
	<?php
}
else {
	include('file-quotas.php');
	include('tokens.php');
	assign_token();
	?>
<!DOCTYPE html> 
<html lang="<?php echo $language ? 'en':'fr'; ?>"> 
	<head>
		<title><?php echo $language ? 'Create circuit':'Créer circuit'; ?> - Mario Kart PC</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
		<?php
		include('o_online.php');
		?>
		<link rel="stylesheet" type="text/css" href="styles/editor.css" />
		<link rel="stylesheet" type="text/css" href="styles/draw.css" />
		<script type="text/javascript">
		var csrf = "<?php echo $_SESSION['csrf']; ?>";
		var language = <?php echo $language ? 1:0; ?>;
		var isBattle = false;
		</script>
		<script src="scripts/editor-form.js"></script>
	</head>
	<body class="home-body">
		<?php
		$getTracks = mysql_query('SELECT c.id,c.nom,d.data,c.img_data FROM circuits c LEFT JOIN circuits_data d ON c.id=d.id WHERE c.identifiant='.$identifiants[0].' AND c.identifiant2='.$identifiants[1].' AND c.identifiant3='.$identifiants[2].' AND c.identifiant4='.$identifiants[3] .' ORDER BY c.id DESC');
		if (!isset($_GET['help']) && ($nbTracks=mysql_numrows($getTracks))) {
			if ($language) {
				?>
				<form class="editor-section editor-description" method="post" action="uploadCircuit.php" enctype="multipart/form-data">
					<?php
					if (isset($_GET['error']))
						echo '<div class="editor-error">'. stripslashes($_GET['error']) .'</div>';
					?>
					Welcome to the track builder in complete mode.<br />
					To create a new circuit, send your image here:
					<?php include('circuitForm.php'); ?>
				</form>
				<?php
			}
			else {
				?>
				<form class="editor-section editor-description" method="post" action="uploadCircuit.php" enctype="multipart/form-data">
					<?php
					if (isset($_GET['error']))
						echo '<div class="editor-error">'. stripslashes($_GET['error']) .'</div>';
					?>
					Bienvenue dans l'éditeur de circuits en mode complet.<br />
					Pour créer un nouveau circuit, envoyez votre image ici :
					<?php include('circuitForm.php'); ?>
				</form>
				<?php
			}
			?>
			<?php
		}
		else {
			if ($language) {
				?>
				<div class="editor-section editor-description">
					<?php
					if (isset($_GET['error']))
						echo '<div class="editor-error">'. stripslashes($_GET['error']) .'</div>';
					?>
					Welcome to the circuit editor in complete mode.
					With this mode, you will be able to create a circuit from A to Z.
					<br />
					<br />
					The first step is to provide an image of the circuit seen from above.
					That image is what will be used to render the circuit in the game.<br />
					For exemple, here is the image of Mario Circuit 1 : <a href="images/maps/map1.png" onclick="document.getElementById('map-example').style.display=document.getElementById('map-example').style.display=='block'?'':'block';return false">Show</a>
					<br />
					<div id="map-example">
						<img src="images/maps/map1.png" alt="Mario Circuit 1" />
					</div>
					<br />
					To draw the circuit image, you can use a drawing software like Paint or Photoshop.
					You can also retrieve an image on the internet (for example on <a href="http://www.mariouniverse.com/maps/" target="_blank">mariouniverse.com/maps</a>).
				</div>
				<form class="editor-section editor-description" method="post" action="uploadCircuit.php" enctype="multipart/form-data">
					Your image is ready? Send it here:
					<?php include('circuitForm.php'); ?>
				</form>
				<?php
			}
			else {
				?>
				<div class="editor-section editor-description">
					<?php
					if (isset($_GET['error']))
						echo '<div class="editor-error">'. stripslashes($_GET['error']) .'</div>';
					?>
					Bienvenue dans l'éditeur de circuits en mode complet.
					Avec ce mode, vous allez pouvoir créer un circuit de A à Z.
					<br />
					<br />
					La première étape consiste à fournir une image du circuit vu de dessus.
					C'est cette image qui sera utilisée pour afficher le circuit dans le jeu.<br />
					Par exemple, voici l'image du Circuit Mario 1 : <a href="images/maps/map1.png" onclick="document.getElementById('map-example').style.display=document.getElementById('map-example').style.display=='block'?'':'block';return false">Afficher</a>
					<br />
					<div id="map-example">
						<img src="images/maps/map1.png" alt="Circuit Mario 1" />
					</div>
					<br />
					Pour dessiner l'image du circuit, vous pouvez utiliser un logiciel de dessin comme Paint ou Photoshop.
					Vous pouvez aussi récupérer une image sur internet (par exemple sur <a href="http://www.mariouniverse.com/maps/" target="_blank">mariouniverse.com/maps</a>).
					<br />
					<br />
					Lien utile pour démarer : <a href="topic.php?topic=739" target="_blank">Conseils pour créer un circuit/arène</a>
				</div>
				<form class="editor-section editor-description" method="post" action="uploadCircuit.php" enctype="multipart/form-data">
					Votre image est prête ? Envoyez-la ici :
					<?php include('circuitForm.php'); ?>
				</form>
				<?php
			}
		}
		if ($nbTracks) {
			?>
			<div class="editor-section">
				<?php
				$poids = file_total_size();
				?>
				<h2><?php echo $language ? 'Your circuits':'Vos circuits'; ?> (<?php echo $nbTracks; ?>)</h2>
				<?php
				echo '<div class="file-quotas">'. ($language ? 'You use '.filesize_str($poids).' out of '.filesize_str(MAX_FILE_SIZE).' ('. filesize_percent($poids) .')' : 'Vous utilisez '.filesize_str($poids).' sur '.filesize_str(MAX_FILE_SIZE).' ('.filesize_percent($poids).')') .'</div>';
				?>
				<div id="editor-tracks-list">
					<?php
					require_once('circuitImgUtils.php');
					while ($track = mysql_fetch_array($getTracks)) {
						$circuitImg = json_decode($track['img_data']);
						$id = $track['id'];
						echo '<a href="map.php?i='.$id.'"
							data-id="'.$id.'"
							data-name="'.htmlspecialchars($track['nom']).'"
							'. ($track['data'] ? '':'data-pending="1"') .'
							data-src="'.getCircuitImgUrl($circuitImg).'"
							onclick="previewCircuit(this);return false"><img
								src="images/creation_icons/racepreview'. $id .'.png"
								onerror="var that=this;setTimeout(function(){that.src=\'trackicon.php?type=1&id='. $id .'\';},loadDt);this.onerror=null;loadDt+=50"
								alt="Circuit '.$id.'"
							/></a>';
					}
					?>
				</div>
			</div>
			<div id="editor-track-preview-mask" class="editor-mask" onclick="closePreview()">
				<div id="editor-track-preview" onclick="event.stopPropagation()">
					<a id="editor-track-close" href="javascript:closePreview()">&times;</a>
					<div id="editor-track-name"></div>
					<div id="editor-track-actions">
						<a id="editor-track-action-access"><?php echo $language ? 'Access':'Accéder'; ?></a>
						<a id="editor-track-action-edit"><?php echo $language ? 'Edit':'Modifier'; ?></a>
						<a id="editor-track-action-delete" onclick="return confirm('<?php echo ($language ? 'Are you sure you want to delete this circuit?':'Voulez-vous vraiment supprimer ce circuit ?'); ?>')"><?php echo $language ? 'Delete':'Supprimer'; ?></a>
					</div>
					<img id="editor-track-img" src="images/maps/map1.png" alt="Circuit" />
				</div>
			</div>
			<?php
		}
		?>
		<div class="editor-navigation">
			<a href="index.php">&lt; <u><?php echo $language ? 'Back to Mario Kart PC':'Retour à Mario Kart PC'; ?></u></a>
		</div>
	</body>
</html>
	<?php
}
mysql_close();
?>