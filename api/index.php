<?php
session_start();

// Langues disponibles
$languages = ['fr', 'en', 'zh'];
$defaultLang = 'fr';

// Déterminer la langue
$lang = $defaultLang;

if (isset($_GET['lang']) && in_array($_GET['lang'], $languages)) {
    $_SESSION['lang'] = $_GET['lang'];
    $lang = $_GET['lang'];
} elseif ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['lang']) && in_array($_POST['lang'], $languages)) {
    $_SESSION['lang'] = $_POST['lang'];
    $lang = $_POST['lang'];
} elseif (isset($_SESSION['lang'])) {
    $lang = $_SESSION['lang'];
} elseif (isset($_SERVER['HTTP_ACCEPT_LANGUAGE'])) {
    $accepted = explode(',', $_SERVER['HTTP_ACCEPT_LANGUAGE']);
    foreach ($accepted as $l) {
        $code = substr(trim($l), 0, 2);
        if (in_array($code, $languages)) {
            $lang = $code;
            break;
        }
    }
}

// Charger XML et XSL
$xml = new DOMDocument;
$xml->load(__DIR__ . '/../portfolio.xml');

$xsl = new DOMDocument;
$xsl->load(__DIR__ . '/../portfolio.xsl');

// Configurer transformation
$proc = new XSLTProcessor;
$proc->importStylesheet($xsl);
$proc->setParameter('', 'lang', $lang);

// Afficher le HTML transformé
echo $proc->transformToXML($xml);
