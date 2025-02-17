<?php
date_default_timezone_set('Europe/Paris');
include('session.php');
include('language.php');
include('initdb.php');
?>
<!DOCTYPE html>
<html lang="<?php echo $language ? 'en':'fr'; ?>">
<head>
<title>Calendrier de l'Avent - Mario Kart PC</title>
<?php
$hdescription = "C'est Noël sur Mario Kart PC ! Pour fêter ça, cet événement inédit vous donne accès à 1 défi par jour ! Remportez un maximum de défis et gagnez jusqu'à 2000 points dans le mode en ligne !";
include('heads.php');
$day = 25;//date('j');
$dayStr = $day;
if ($language) {
	if ($day == 1 || $day == 21)
		$dayStr .= "st";
	else if ($day == 2 || $day == 22)
		$dayStr .= "nd";
	else if ($day == 3 || $day == 23)
		$dayStr .= "rd";
	else
		$dayStr .= "th";
	$dayStr = "December " . $dayStr;
}
else {
	if ($day == 1)
		$dayStr .= "er";
	$dayStr .= " Décembre";
}
include('advent-challenges.php');
$adventChallengesUntil = get_challenges_until($day);
?>
<script src="scripts/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="styles/forum.css" />
<style type="text/css">
.advent-description {
	margin-left: 20px;
	font-size: 1.2em;
	margin-bottom: 10px;
}
.advent-description strong {
	color: #C80;
}
.advent-countdown img {
	position: relative;
	top: 2px;
	margin-right: 5px;
}
.advent-countdown {
	margin-left: 20px;
	color: #800;
	font-weight: bold;
}
.advent-completed {
	margin-left: 20px;
	color: #080;
	font-weight: bold;
}
.advent-calendar {
	position: relative;
}
.advent-calendar-bg {
	width: 100%;
}
.advent-square {
	position: absolute;
	background-repeat: no-repeat;
	background-position: center;
	width: 14.5%;
	height: 10.6%;
	cursor: pointer;
}
.advent-square span {
	display: none;
}
.advent-square-open span, .advent-square-success span {
	position: absolute;
	left: 10%;
	top: 8%;
	color: #3D0B02;
	display: inline-block;
	font-weight: bold;
	font-size: 1.5vw;
	font-family: Arial;
	opacity: 0.8;
}
.advent-square-open {
	background-image: url("images/advent-calendar/window.jpg");
	background-size: cover;
}
.advent-square-success {
	background-image: url("images/advent-calendar/star.png"), url("images/advent-calendar/window.jpg");
	background-size: 90%, cover;
}
.advent-begin {
	text-align: center;
	font-size: 1.4em;
	margin: 5px;
}
.pub {
	text-align: center;
	overflow: hidden;
}
#advent-challenge-mask {
	display: none;
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0, 0.5);
}
#advent-challenge-cross {
	position: absolute;
	right: 5px;
	top: 0px;
	color: red;
	font-size: 1.4em;
	text-decoration: none;
}
#advent-challenge-ctn {
	position: absolute;
	background-color: white;
	width: 400px;
	padding: 5px 12px;
	max-width: 100%;
	left: 50%;
	top: 50%;
	-webkit-transform: translate(-50%,-50%);
	-moz-transform: translate(-50%,-50%);
	-o-transform: translate(-50%,-50%);
	-ms-transform: translate(-50%,-50%);
	transform: translate(-50%,-50%);
	border-radius: 5px;
	text-align: center;
}
#advent-challenge-title-ctn {
	text-align: center;
}
#advent-challenge-title-ctn img {
	height: 1.6em;
	position: relative;
	top: 4px;
}
#advent-challenge-title {
	display: inline-block;
	font-size: 1.6em;
	margin-left: 4px;
	margin-top: 5px;
	margin-bottom: 10px;
}
#advent-challenge-body {
	font-size: 1.2em;
}
#advent-challenge-body a {
	font-weight: bold;
}
#advent-challenge-body strong {
	color: #C80;
}
#advent-challenge-state {
	font-weight: bold;
	margin-bottom: 5px;
	text-align: center;
}
#advent-challenge-img img {
	width: 200px;
	height: 80px;
}
#advent-challenge-extra {
	margin-top: 5px;
	margin-bottom: 2px;
	font-size: 0.8em;
}
#advent-challenge-button {
	padding: 5px 10px;
	color: white;
	background-color: #001060;
	border-radius: 5px;
	text-decoration: none;
	font-size: 1.5em;
	font-family: Arial;
	font-weight: bold;
}
#advent-challenge-button:hover {
	background-color: #003679;
}
</style>
<script type="text/javascript">
var language = <?php echo $language ? 1:0; ?>;
var openedSquare;
var allChallenges = <?php
	echo json_encode($adventChallengesUntil);
?>;
function openSquare(square) {
	var state = +$(square).data("state");
	var day = +$(square).data("day");
	openedSquare = square
	if (!state && allChallenges[day])
		square.className = "advent-square advent-square-open";
	populateChallenge(square);
	$("#advent-challenge-mask").fadeIn();
}
function populateChallenge(square) {
	var state = +$(square).data("state");
	var day = +$(square).data("day");
	var dayStr = day;
	if (language) {
		if (day == 1 || day == 21)
			dayStr += "st";
		else if (day == 2 || day == 22)
			dayStr += "nd";
		else if (day == 3 || day == 23)
			dayStr += "rd";
		else
			dayStr += "th";
		dayStr = "December " + dayStr;
	}
	else {
		if (day == 1)
			dayStr += "er";
		dayStr += " Décembre";
	}
	$("#advent-challenge-title").html((language ? 'Challenge of  ':'Défi du ')+dayStr);
	var challenge = allChallenges[day];
	if (challenge) {
		switch (state) {
		case 2:
			$("#advent-challenge-state").css("color","green");
			$("#advent-challenge-state").text(language ? "This challenge hase been completed!":"Ce défi a été réussi !");
			$("#advent-challenge-state").show();
			break;
		default:
			$("#advent-challenge-state").hide();
			break;
		}
		var description = challenge.description;
		$("#advent-challenge-body").html(description);
		if (challenge.img) {
			var $adventChallengeImg = $("#advent-challenge-img img");
			$adventChallengeImg.attr("src",challenge.img);
			if (challenge.imgW)
				$adventChallengeImg.css("width",challenge.imgW);
			else
				$adventChallengeImg.css("width","");
			if (challenge.imgH)
				$adventChallengeImg.css("height",challenge.imgH);
			else
				$adventChallengeImg.css("height","");
			$("#advent-challenge-img").show();
		}
		else
			$("#advent-challenge-img").hide();
		if (challenge.extra) {
			$("#advent-challenge-extra").text(challenge.extra);
			$("#advent-challenge-extra").show();
		}
		else
			$("#advent-challenge-extra").hide();
		if (state < 2) {
			var link = "mariokart.php";
			if (challenge.link)
				link = challenge.link;
			$("#advent-challenge-button").attr("href", link);
		}
	}
	else {
		$("#advent-challenge-extra").hide();
		$("#advent-challenge-img").hide();
		$("#advent-challenge-body").html("");
		$("#advent-challenge-state").css("color","#800");
		$("#advent-challenge-state").text(language ? "It's too early for this challenge":"Il est trop tôt pour ce défi");
		$("#advent-challenge-state").show();
	}
}
function closeSquare() {
	if (openedSquare) {
		var square = openedSquare;
		openedSquare = null;
		$("#advent-challenge-mask").fadeOut(function() {
			var state = +$(square).data("state");
			if (!state)
				square.className = "advent-square";
			square = null;
		});
	}
}
document.onkeydown = function(e) {
	if (e.keyCode == 27)
		closeSquare();
}
</script>
<?php
include('o_online.php');
?>
</head>
<body>
<?php
include('header.php');
$page = 'home';
include('menu.php');
?>
<main>
	<h1><?php echo $language ? 'Advent Calendar':'Calendrier de l\'avent'; ?></h1>
	<div class="advent-description">
		<?php
		$nbCompleted = 0;
		if ($id) {
			if ($getNbCompleted = mysql_fetch_array(mysql_query('SELECT COUNT(*) AS nb FROM mkadvent WHERE user='.$id.' AND day<='.$day)))
				$nbCompleted = $getNbCompleted['nb'];
		}
		if ($language) {
			?>
			The event <strong>Advent Calendar</strong> is now closed. You can find the results <a href="ranking-advent.php">here</a>, congrats to all particiants!<br />
			If you missed the event and want to learn more about it, go to <a href="topic.php?topic=3954">this topic</a>.<br />
			<?php
		}
		else {
			?>
			L'événement <strong>Calendrier de l'avent</strong> est terminé. Les résultats sont disponibles <a href="ranking-advent.php">ici</a>, bravo à tous les participants !<br />
			Si vous avez manqué l'événement et que vous voulez en savoir plus, rendez-vous sur <a href="topic.php?topic=3954">ce topic</a>.<br />
			<?php
		}
		?>
	</div>
	<?php
	if ($nbCompleted) {
		?>
		<div class="advent-completed"><?php
		if ($nbCompleted == 24) {
			if ($day < 24)
				echo $language ? 'Well done, you have completed all the chalenges so far! See you tomorrow for the next challenge.':'Bravo, vous avez réussi tous les défis pour l\'instant ! Rendez-vous demain pour le prochain défi.';
			else
				echo $language ? 'You have completed all the chalenges, congratulations!!':'Vous avez réussi tous les défis, félicitations !!';
		}
		else {
			$plural = ($nbCompleted>=2) ? 's':'';
			echo $language ? 'You have completed '. $nbCompleted .' chalenge'. $plural .' out of '. 24 .'!':'Vous avez réussi '. $nbCompleted .' défi'. $plural .' sur '. 24;
		}
		?></div>
		<?php
	}
	/*else {
		?>
		<div class="advent-countdown"><?php
		$now = time();
		$tomorrow = strtotime("tomorrow midnight");
		$remainingTime = $tomorrow-$now;
		$remainingTimeMins = round($remainingTime/60);
		$remainingHours = floor($remainingTimeMins/60);
		$remainingMins = $remainingTimeMins%60;
		if ($remainingMins < 10) $remainingMins = '0'.$remainingMins;
		echo '<img src="images/advent-calendar/clock.png" alt="Clock" />';
		echo $language ? $remainingHours.'h'.$remainingMins.' remaining to complete today\'s chalenge ('. $dayStr .')':'Il reste '.$remainingHours.'h'.$remainingMins.' pour réussir le défi du jour ('. $dayStr .')';
		?></div>
		<?php
	}*/
	?>
	<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
	<!-- Forum MKPC -->
	<p class="pub"><ins class="adsbygoogle"
	     style="display:inline-block;width:728px;height:90px"
	     data-ad-client="ca-pub-1340724283777764"
	     data-ad-slot="4919860724"></ins></p>
	<script>
	(adsbygoogle = window.adsbygoogle || []).push({});
	</script>
	<div class="advent-begin">
		&#9660;&nbsp;<?php echo $language ? 'Click on current day number to begin': 'Cliquez sur le numéro du jour pour jouer'; ?>&nbsp;&#9660;
	</div>
	<div class="advent-calendar">
		<img src="images/advent-calendar/calendar.jpg" class="advent-calendar-bg" />
		<?php
		$x0 = 8;
		$y0 = 8;
		$u = 23.2;
		$v = 12.8;
		$squareDays = array(14,2,19,11,17,22,24,18,23,12,8,20,7,21,13,6,10,5,16,4,9,3,15,1);
		$completedDays = array();
		if ($id) {
			$getCompletedDays = mysql_query('SELECT day FROM mkadvent WHERE user='. $id);
			while ($completedDay = mysql_fetch_array($getCompletedDays))
				$completedDays[$completedDay['day']] = true;
		}
		foreach ($squareDays as $i=>$d) {
			$x = $x0 + $u*($i%4);
			$y = $y0 + $v*floor($i/4);
			$d = $squareDays[$i];
			$className = 'advent-square';
			$state = 0;
			if ($completedDays[$d]) {
				$className .= ' advent-square-success';
				$state = 2;
			}
			elseif ($day > $d) {
				$className .= ' advent-square-open';
				$state = 1;
			}
			?>
			<div data-day="<?php echo $d; ?>" data-state="<?php echo $state; ?>" class="<?php echo $className; ?>" style="left:<?php echo $x; ?>%;top:<?php echo $y; ?>%" onclick="openSquare(this)">
				<span><?php echo $d; ?></span>
			</div>
			<?php
		}
		?>
	</div>
	<div id="advent-challenge-mask" onclick="closeSquare()">
		<div id="advent-challenge-ctn" onclick="event.stopPropagation()">
			<a id="advent-challenge-cross" href="#null" onclick="closeSquare();return false">&times;</a>
			<div id="advent-challenge-title-ctn">
				<img src="images/advent-calendar/star.png" alt="star" />
				<h1 id="advent-challenge-title">Défi du 1 décembre</h1>
			</div>
			<div id="advent-challenge-state">Ce défi a été réussi</div>
			<div id="advent-challenge-img"><img alt="star" /></div>
			<div id="advent-challenge-body">Finissez le <strong>Circuit Mario 1</strong> en mode <strong>Contre-la-Montre</strong> en moins de <strong>40 secondes</strong>.</div>
			<div id="advent-challenge-extra">En mode difficile, avec 8 joueurs</div>
		</div>
	</div>
</main>
<?php
include('footer.php');
?>
<?php
mysql_close();
?>
</body>
</html>