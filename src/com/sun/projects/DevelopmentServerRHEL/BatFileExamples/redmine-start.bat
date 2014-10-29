@ECHO OFF
TITLE Redmine - Sistemas New Bank
C:
SET USER_PROXY=bancoazteca%5Cb859390
SET PASSWORD_PROXY=bwv...870812
SET HTTP_PROXY=http://%USER_PROXY%:%PASSWORD_PROXY%@10.50.8.21:8080
CD "C:\distributions\redmine\redmine-2.5.2"
bundle exec puma -p 18060 -e production
PAUSE
