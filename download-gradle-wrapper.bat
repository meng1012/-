@echo off
echo 正在下载Gradle Wrapper...
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/gradle/gradle/v6.1.1/gradle/wrapper/gradle-wrapper.jar' -OutFile 'gradle\wrapper\gradle-wrapper.jar'"

if exist "gradle\wrapper\gradle-wrapper.jar" (
    echo 下载成功！
) else (
    echo 下载失败！
)

pause 