#!/bin/bash

ssh -fNR 5411:127.0.0.1:5411 gabriele@quaversoft.com
ssh -fNR 5410:127.0.0.1:5410 gabriele@quaversoft.com
java /Users/marulli/Desktop/COSE/SteamLibrary/steamapps/common/Kerbal/Space/Program/Ships/Script/GitAutoUpdater /Users/marulli/Desktop/COSE/SteamLibrary/steamapps/common/Kerbal/Space/Program/Ships/Script  
