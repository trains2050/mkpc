<?php
session_start();
$res = array();
if (isset($_SESSION['clselected'])) {
    $challengeId = $_SESSION['clselected'];
    unset($_SESSION['clselected']);
    $res['id'] = $challengeId;
    include('initdb.php');
    if ($challenge = mysql_fetch_array(mysql_query('SELECT clist,data FROM mkchallenges WHERE id="'. $challengeId .'"'))) {
        include('utils-challenges.php');
        $res['autoset'] = array();
        challengeAutoSet($res['autoset'],$challenge);
    }
    mysql_close();
}
echo json_encode($res);