#!/bin/bash

mkdir -p html/{retail,classic,classic_era}/
curl http://us.patch.battle.net:1119/wow/versions -o html/retail/versions
curl http://us.patch.battle.net:1119/wow/cdns -o html/retail/cdns
curl http://eu.patch.battle.net:1119/wow_classic/versions -o html/classic/versions
curl http://eu.patch.battle.net:1119/wow_classic/cdns -o html/classic/cdns
curl http://eu.patch.battle.net:1119/wow_classic_era/versions -o html/classic_era/versions
curl http://eu.patch.battle.net:1119/wow_classic_era/cdns -o html/classic_era/cdns
