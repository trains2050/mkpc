<?php
include('language.php');
include('uploadByUrl.php');
$isBattle = isset($_GET['battle']);
$table = $isBattle ? 'arenes':'circuits';
if (isset($_FILES['image'])) {
	if (!$_FILES['image']['error']) {
		$poids = $_FILES['image']['size'];
		if ($poids < 1000000) {
			$doImport = ($isUploaded || isset($_POST['import']));
			include('file-quotas.php');
			include('getId.php');
			include('initdb.php');
			if ($doImport)
				$poids += file_total_size();
			$id = 0;
			if ($poids < MAX_FILE_SIZE) {
				require_once('circuitImgUtils.php');
				$ext = getCircuitExt($_FILES['image']['tmp_name'],null);
				if ($ext) {
					mysql_query('INSERT INTO `'.$table.'` SET identifiant='.$identifiants[0].',identifiant2='.$identifiants[1].',identifiant3='.$identifiants[2].',identifiant4='.$identifiants[3]);
					$id = mysql_insert_id();
					if ($doImport) {
						$src = $isBattle ? 'course':'map';
						$circuitUrl = "$src$id.$ext";
						$circuitPath = CIRCUIT_BASE_PATH.$circuitUrl;
						move_given_file($_FILES['image']['tmp_name'], $circuitPath);
					}
					else {
						$circuitUrl = $_POST['url'];
						$circuitPath = $_FILES['image']['tmp_name'];
					}
					mysql_query('UPDATE `'.$table.'` SET img_data="'.getCircuitImgDataRaw($circuitPath,$circuitUrl,$doImport).'" WHERE id='.$id);
					mysql_close();
					header('Location: '.($isBattle ? 'course':'draw').'.php?i='.$id.'&uploaded=1');
					exit;
				}
				else $error = $language ? 'Your image must have a png, gif, or jpg extension.':'Votre image doit être au format png, gif ou jpg.';
			}
			else $error = $language ? 'You have exceeded your quota of '.filesize_str(MAX_FILE_SIZE).'. Delete tracks or use the &quot;Paste image URL&quot; option to save space.':'Vous avez dépassé votre quota de '.filesize_str(MAX_FILE_SIZE).'. Supprimez des circuits ou utilisez l\'option &quot;Coller l\'URL de l\'image&quot; pour gagner de l\'espace.';
			mysql_close();
		}
		else $error = $language ? 'Your image mustn\'t exceed 1 Mo. Compress or reduce it if necessary.':'Votre image ne doit pas dépasser 1 Mo. Compressez-la ou réduisez la taille si nécessaire.';
	}
	else $error = $language ? 'An error occured during the image transfer. Please try again later.':'Une erreur est survenue lors de l\'envoi de l\'image. Réessayez ultèrieurement.';
}
if (isset($error))
	header('Location: draw.php?error='.urlencode($error));
?>