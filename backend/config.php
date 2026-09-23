<?php
function env_load($path){ if(!file_exists($path)) return; foreach(file($path, FILE_IGNORE_NEW_LINES|FILE_SKIP_EMPTY_LINES) as $line){ if(str_starts_with(trim($line),'#')||!str_contains($line,'=')) continue; [$k,$v]=explode('=',$line,2); $_ENV[trim($k)]=trim($v); }}
env_load(__DIR__.'/../.env');
function db(){ static $pdo; if($pdo) return $pdo; $dsn='mysql:host='.($_ENV['DB_HOST']??'127.0.0.1').';port='.($_ENV['DB_PORT']??'3306').';dbname='.($_ENV['DB_NAME']??'loopa').';charset=utf8mb4'; $pdo=new PDO($dsn,$_ENV['DB_USER']??'root',$_ENV['DB_PASS']??'',[PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION,PDO::ATTR_DEFAULT_FETCH_MODE=>PDO::FETCH_ASSOC]); return $pdo; }
function json_out($data,$code=200){ http_response_code($code); header('Content-Type: application/json; charset=utf-8'); echo json_encode($data,JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES); exit; }
function input(){ return json_decode(file_get_contents('php://input'),true) ?: $_POST; }
function user_id(){ session_start(); return $_SESSION['uid']??null; }
function require_user(){ $id=user_id(); if(!$id) json_out(['ok'=>false,'error'=>'Oturum açmanız gerekiyor.'],401); return $id; }
