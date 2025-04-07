@echo off
echo 正在下载Gradle...
powershell -Command "Invoke-WebRequest -Uri 'https://services.gradle.org/distributions/gradle-6.1.1-bin.zip' -OutFile 'gradle-6.1.1-bin.zip'"

if exist "gradle-6.1.1-bin.zip" (
    echo 下载成功！
    echo 正在解压...
    powershell -Command "Expand-Archive -Path 'gradle-6.1.1-bin.zip' -DestinationPath '.' -Force"
    echo 解压完成！
) else (
    echo 下载失败！
)

pause 