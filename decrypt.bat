@echo off
mode con: cols=80 lines=15
title Decrypt
setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
chcp 1250 & cls
set strterm=___ENDOFSTRING___
set /p input=<crypted.txt
echo.
set /p "input1=  Dešifrovací text » "
mode con: cols=150 lines=35
powershell -command "&{$H=get-host;$W=$H.ui.rawui;$B=$W.buffersize;$B.width=150;$B.height=9999;$W.buffersize=$B;}"
cls
@echo on
set "basic=%input%"
set "check_len=%basic%"
set "len_len=%check_len:~0,1%"
set "kontrolni_len=%check_len:~1,3%"
call set /a "kontrolni_len=%%kontrolni_len:~-%len_len%%%/2"
call set "input1=%%input1:~0,%kontrolni_len%%%"    
:dodatek_k_pismenum
set "CHAR[01]=a" & set "CHAR[02]=b" & set "CHAR[03]=c" & set "CHAR[04]=d" & set "CHAR[05]=e"
set "CHAR[06]=f" & set "CHAR[07]=g" & set "CHAR[08]=h" & set "CHAR[09]=i"
:nastav_pismena
set "CHAR[1]=a" & set "CHAR[2]=b" & set "CHAR[3]=c" & set "CHAR[4]=d" & set "CHAR[5]=e"
set "CHAR[6]=f" & set "CHAR[7]=g" & set "CHAR[8]=h" & set "CHAR[9]=i" & set "CHAR[10]=j"
set "CHAR[11]=k" & set "CHAR[12]=l" & set "CHAR[13]=m" & set "CHAR[14]=n" & set "CHAR[15]=o"
set "CHAR[16]=p" & set "CHAR[17]=q" & set "CHAR[18]=r" & set "CHAR[19]=s" & set "CHAR[20]=t"
set "CHAR[21]=u" & set "CHAR[22]=v" & set "CHAR[23]=w" & set "CHAR[24]=x" & set "CHAR[25]=y"
set "CHAR[26]=z"
:nastav_cisla
set "CHAR[27]=1" & set "CHAR[28]=2" & set "CHAR[29]=3" & set "CHAR[30]=4" & set "CHAR[31]=5"
set "CHAR[32]=6" & set "CHAR[33]=7" & set "CHAR[34]=8" & set "CHAR[35]=9" & set "CHAR[36]=0"
:nastav_diakritiku
set "CHAR[37]=ì" & set "CHAR[38]=š" & set "CHAR[39]=è" & set "CHAR[40]=ø" & set "CHAR[41]=ž"
set "CHAR[42]=ý" & set "CHAR[43]=á" & set "CHAR[44]=í" & set "CHAR[45]=é" & set "CHAR[46]=ú"
set "CHAR[47]=ù" & set "CHAR[48]=ï" & set "CHAR[49]=" & set "CHAR[50]=ò" & set "CHAR[51]=ó"
:nastav_spec_symboly
set "CHAR[52]=." & set "CHAR[53]=," & set "CHAR[54]=-" & set "CHAR[55]=_" & set "CHAR[56]=/"
set "CHAR[57]=+" & set "CHAR[58]=?" & set "CHAR[59]=@" & set "CHAR[60]=;" & set "CHAR[61]= "        
:nastav_pismena1
set "char1[a]=01" & set "char1[b]=02" & set "char1[c]=03" & set "char1[d]=04" & set "char1[e]=05"
set "char1[f]=06" & set "char1[g]=07" & set "char1[h]=08" & set "char1[i]=09" & set "char1[j]=10"
set "char1[k]=11" & set "char1[l]=12" & set "char1[m]=13" & set "char1[n]=14" & set "char1[o]=15"
set "char1[p]=16" & set "char1[q]=17" & set "char1[r]=18" & set "char1[s]=19" & set "char1[t]=20"
set "char1[u]=21" & set "char1[v]=22" & set "char1[w]=23" & set "char1[x]=24" & set "char1[y]=25"
set "char1[z]=26"
:nastav_cisla1
set "char1[1]=27" & set "char1[2]=28" & set "char1[3]=29" & set "char1[4]=30" & set "char1[5]=31"
set "char1[6]=32" & set "char1[7]=33" & set "char1[8]=34" & set "char1[9]=35" & set "char1[0]=36"
:nastav_diakritiku1
set "char1[ì]=37" & set "char1[š]=38" & set "char1[è]=39" & set "char1[ø]=40" & set "char1[ž]=41"
set "char1[ý]=42" & set "char1[á]=43" & set "char1[í]=44" & set "char1[é]=45" & set "char1[ú]=46"
set "char1[ù]=47" & set "char1[ï]=48" & set "char1[]=49" & set "char1[ò]=50" & set "char1[ó]=51"
:nastav_spec_symboly1
set "char1[.]=52" & set "char1[,]=53" & set "char1[-]=54" & set "char1[_]=55" & set "char1[/]=56"
set "char1[+]=57" & set "char1[?]=58" & set "char1[@]=59" & set "char1[;]=60" & set "char1[ ]=61"  
:crypt2
set Encrypt_22=%input1%
set "Encrypt_2Out="
:Encrypt_22
set char1=%Encrypt_22:~0,1%
set Encrypt_22=%Encrypt_22:~1%
set Encrypt_2Out=%Encrypt_2Out%!char1[%char1%]!
set "Encrypt_2Out=%Encrypt_2Out%"
if not "%Encrypt_22%"=="" goto Encrypt_22
set "input=%input:~4%"
set "md5_1=%input:~-20,10%"
set "md5_2=%input:~-10,10%"
set "string=%input:~0,-20%"
set tmp=%string%%strterm%
set "number_of_read=0"
:loop
set cha=%tmp:~0,2%
set tmp=%tmp:~2%
set /a "number_of_read=%number_of_read%+1"
set "%number_of_read%=%cha%"
set "char2=%encrypt_2out:~0,2%"
set "encrypt_2out=%encrypt_2out:~2%"
if "!cha:~0,1!"=="0" (
   set "cha=%cha:~1%
)
if "!char2:~0,1!"=="0" (
   set "char2=%char2:~1%
)
if "!char2!" GTR "!cha!" (
   set "help001=1"
)
if "!char2!"=="!cha!" (
   set "help001=2"
)
set /a "character=!cha! - !char2!"
if "!help001!"=="1" (
   set /a "character=!character!+61"
)
if "!help001!"=="2" (
   set "character=61"
)
if "!character!" GTR "61" (
   set /a "character=!character!-61"
)
call :strLen character character_len
if !character_len!==1 (
   set "character=0!character!"
)
if !character_len!==3 (
   set /a "character=!character!+61"
)
call :strLen character character_len
if !character_len!==1 (
   set "character=0!character!"
)
set "help001=0"
set "kompletni=!kompletni!!character!"
goto decrypt
:pokracovani
goto decrypt3
:pokracovani1
IF NOT "%tmp%" == "%strterm%" GOTO loop
@echo off  
set "bar=1"
:bar
if "%bar%"=="101" (
   title Decrypt
   goto preskocit1
)
call :progress
set /a "bar=%bar%+1"
goto bar
:progress
ping 127.0.0.1 -n 1 > Nul
ping 127.0.0.1 -n 1 > Nul
ping 127.0.0.1 -n 1 > Nul     
ping 127.0.0.1 -n 1 > Nul   
SET ProgressPercent=%bar%
SET /A NumBars=%ProgressPercent%/2
SET /A NumSpaces=50-%NumBars%
SET Meter=
FOR /L %%A IN (%NumBars%,-1,1) DO SET Meter=!Meter!I
FOR /L %%A IN (%NumSpaces%,-1,1) DO SET Meter=!Meter! 
TITLE Decrypt - kontrola:  [%Meter%]  %ProgressPercent%%%
exit /b
:preskocit1
:md5_2_1                              
(break|set/p=%string%)>~
set "md5_2_1="
for /f "skip=1 tokens=* delims=" %%# in ('certutil -hashfile "~" md5') do (
   if not defined md5_2_1 (
      for %%Z in (%%#) do set "md5_2_1=%%Z"
   )
)
del ~
set "md5_2_1=%md5_2_1:a=%"
set "md5_2_1=%md5_2_1:b=%"
set "md5_2_1=%md5_2_1:c=%"
set "md5_2_1=%md5_2_1:d=%"
set "md5_2_1=%md5_2_1:e=%"
set "md5_2_1=%md5_2_1:f=%"
set "md5_2_1=%md5_2_1:~0,10%"
call :strLen md5_2_1 md5_2_1_len
:md5_2_2                              
(break|set/p=%decryptout%)>~
set "md5_2_2="
for /f "skip=1 tokens=* delims=" %%# in ('certutil -hashfile "~" md5') do (
   if not defined md5_2_2 (
      for %%Z in (%%#) do set "md5_2_2=%%Z"
   )
)
del ~
set "md5_2_2=%md5_2_2:a=%"
set "md5_2_2=%md5_2_2:b=%"
set "md5_2_2=%md5_2_2:c=%"
set "md5_2_2=%md5_2_2:d=%"
set "md5_2_2=%md5_2_2:e=%"
set "md5_2_2=%md5_2_2:f=%"
set "md5_2_2=%md5_2_2:~0,10%"
call :strLen md5_2_2 md5_2_2_len
set "chyba=0"
if not "%md5_1%"=="%md5_2_1%" (
   set "chyba=1"
   goto chyba
)
if not "%md5_2%"=="%md5_2_2%" (
   set "chyba=2"
   goto chyba
)
:vysledek
@echo off
ping 127.0.0.1 -n 1 > Nul
mode con: cols=115 lines=15
cls
echo.
echo.  Vysledek: "%decryptout%"
echo.
echo.%decryptout%>"%~d0%~p0decrypted.txt"
echo.  Pokraèujte stiskem libovolné klávesy . . .
pause > Nul  
exit
:chyba
@echo off
ping 127.0.0.1 -n 1 > Nul
mode con: cols=115 lines=6
echo.
echo.  Chyba: "%chyba%"
echo.  "1" = Vadný soubor, "2" = Chybné heslo   
echo.  Chyba: "%chyba%" >"%~d0%~p0decrypted.txt"
echo.  "1" = Vadný soubor, "2" = Chybné heslo >>"%~d0%~p0decrypted.txt"
echo.
echo.  Pokraèujte stiskem libovolné klávesy . . .
pause > Nul  
exit
:decrypt3
set "DecryptOut="
set "Decrypt2="
set "char="
set "cha="
set Decrypt2=!kompletni!
set "DecryptOut="
:decrypt4
set char=%Decrypt2:~0,2%
set Decrypt2=%Decrypt2:~2%
set DecryptOut=%DecryptOut%!CHAR[%char%]!
if not "%Decrypt2%"=="" goto decrypt4
goto pokracovani1
:decrypt
set "Decrypt2=%string%"
set "DecryptOut="
:decrypt2
set "char=%Decrypt2:~0,6%"
set "Decrypt2=%Decrypt2:~6%"
set "DecryptOut=%DecryptOut%!CHAR[%char%]!"
if not "%Decrypt2%"=="" goto decrypt2
set "string0=%DecryptOut%"
set "temp_str=%string0%"
set str_len=0
:lengthloop
if defined temp_str (
set "temp_str=%temp_str:~1%"
set /A str_len += 1
goto lengthloop )
set "vysledek=%vysledek%%decryptout%"
goto pokracovani
:strLen  strVar  [rtnVar]
setlocal disableDelayedExpansion
set len=0
if defined %~1 for /f "delims=:" %%N in (
  '"(cmd /v:on /c echo(!%~1!&echo()|findstr /o ^^"'
) do set /a "len=%%N-3"
endlocal & if "%~2" neq "" (set %~2=%len%) else echo %len%
exit /b