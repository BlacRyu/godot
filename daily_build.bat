echo ============================================================================================================================= >> build.log
echo Starting build (%date% %time%) >> build.log
echo ============================================================================================================================= >> build.log
cd "C:\Users\blacr\Desktop\godot source"
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ >> build.log
echo Fetch upstream (%date% %time%) >> build.log
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ >> build.log
git fetch upstream >> build.log
timeout /t 5 /nobreak
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ >> build.log
echo Pull upstream master (%date% %time%) >> build.log
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ >> build.log
git pull upstream master >> build.log
timeout /t 20 /nobreak
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ >> build.log
echo Scons build (%date% %time%) >> build.log
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ >> build.log
scons profile=build_editor_default.py >> build.log