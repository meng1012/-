@echo off
setlocal

echo 正在设置环境变量...
set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_202
set GRADLE_HOME=%~dp0gradle-6.1.1
set PATH=%JAVA_HOME%\bin;%GRADLE_HOME%\bin;%PATH%

echo 正在检查Java环境...
java -version
if errorlevel 1 (
    echo Java环境检查失败！
    pause
    exit /b 1
)

echo 正在检查Gradle环境...
gradle -version
if errorlevel 1 (
    echo Gradle环境检查失败！
    pause
    exit /b 1
)

echo 正在清理之前的构建...
gradle clean
if errorlevel 1 (
    echo 清理失败！
    pause
    exit /b 1
)

echo 正在构建Release版本...
gradle assembleRelease --info --stacktrace --parallel --daemon
if errorlevel 1 (
    echo 构建失败！
    pause
    exit /b 1
)

echo 检查APK是否生成...
if exist "app\build\outputs\apk\release\app-release.apk" (
    echo APK生成成功！
    echo APK位置: %CD%\app\build\outputs\apk\release\app-release.apk
    echo APK大小: %~z0 / 1024 / 1024 MB
) else (
    echo APK生成失败！
)

pause 