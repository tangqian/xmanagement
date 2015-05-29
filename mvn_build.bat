cd /d %~dp0
call mvn eclipse:eclipse -Dwtpversion=2.0 -DdownloadSources
pause