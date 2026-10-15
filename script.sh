#!/bin/bash
cd ~
mkdir -p ~/lab0/claude_monet/kitchen/hot_station
mkdir -p ~/lab0/claude_monet/kitchen/cold_room
mkdir -p ~/lab0/claude_monet/sanitation
mkdir -p ~/lab0/claude_monet/cleaning
mkdir -p ~/lab0/claude_monet/hall
mkdir -p ~/lab0/claude_monet/office
cat > ~/lab0/claude_monet/kitchen/hot_station/hot_report <<'EOF'
Горячий цех подготовлен к проверке
Рабочие поверхности очищены
Баринов проверил порядок лично
EOF
cat > ~/lab0/claude_monet/kitchen/hot_station/senya_check <<'EOF'
Сеня убрал лишние продукты
Ножи лежат на своих местах
Срок хранения мяса не нарушен
EOF
cat > ~/lab0/claude_monet/kitchen/cold_room/fridge_temperature <<'EOF'
Утром температура четыре градуса
Днём температура пять градусов
Вечером температура четыре градуса
EOF
cat > ~/lab0/claude_monet/kitchen/cold_room/fish_check <<'EOF'
Федя проверил сибаса и дорадо
Свежая рыба перенесена в холодильник
Нарушений хранения рыбы нет
EOF
cat > ~/lab0/claude_monet/sanitation/inspection_act <<'EOF'
Проверка началась до открытия ресторана
Инспектор осмотрел кухню и зал
Повторная проверка назначена на пятницу
EOF
cat > ~/lab0/claude_monet/sanitation/violations <<'EOF'
Нарушен порядок хранения одной коробки
Нарушена маркировка контейнера с соусом
График уборки висит не на своём месте
EOF
cat > ~/lab0/claude_monet/cleaning/cleaning_schedule <<'EOF'
Уборка кухни проводится утром
Уборка зала проводится перед открытием
Вечером Лёва проверяет результат уборки
EOF
cat > ~/lab0/claude_monet/hall/waiter_note <<'EOF'
Официанты убрали столы перед проверкой
Настя проверила гостевую зону
Запасные скатерти сложены в шкаф
EOF
cat > ~/lab0/claude_monet/office/vika_response <<'EOF'
Вика получила акт инспектора
Замечания будут исправлены до вечера
Ответственным назначен Лёва
EOF
cat > ~/lab0/inspector_arrival <<'EOF'
Инспектор приехал раньше назначенного времени
Баринов встретил проверку на кухне
Нагиев потребовал избежать штрафа
EOF
chmod 755 ~/lab0/claude_monet
chmod u=rwx,g=rx,o= ~/lab0/claude_monet/kitchen
chmod 750 ~/lab0/claude_monet/kitchen/hot_station
chmod u=rw,g=r,o= ~/lab0/claude_monet/kitchen/hot_station/hot_report
chmod 640 ~/lab0/claude_monet/kitchen/hot_station/senya_check
chmod u=rwx,g=rx,o= ~/lab0/claude_monet/kitchen/cold_room
chmod 644 ~/lab0/claude_monet/kitchen/cold_room/fridge_temperature
chmod u=rw,g=r,o= ~/lab0/claude_monet/kitchen/cold_room/fish_check
chmod 750 ~/lab0/claude_monet/sanitation
chmod u=rw,g=r,o= ~/lab0/claude_monet/sanitation/inspection_act
chmod 640 ~/lab0/claude_monet/sanitation/violations
chmod u=rwx,g=rx,o= ~/lab0/claude_monet/cleaning
chmod 644 ~/lab0/claude_monet/cleaning/cleaning_schedule
chmod 755 ~/lab0/claude_monet/hall
chmod u=rw,g=r,o=r ~/lab0/claude_monet/hall/waiter_note
chmod u=rwx,g=rx,o= ~/lab0/claude_monet/office
chmod 640 ~/lab0/claude_monet/office/vika_response
chmod u=rw,g=r,o= ~/lab0/inspector_arrival
cp ~/lab0/inspector_arrival ~/lab0/claude_monet/office/arrival_copy
cp -r ~/lab0/claude_monet/cleaning ~/lab0/claude_monet/sanitation/cleaning_backup
ln -s claude_monet/sanitation/inspection_act ~/lab0/inspection_link
ln -s ../sanitation ~/lab0/claude_monet/kitchen/sanitation_access
ln ~/lab0/claude_monet/sanitation/inspection_act ~/lab0/claude_monet/sanitation/act_duplicate
cat ~/lab0/claude_monet/kitchen/hot_station/hot_report ~/lab0/claude_monet/kitchen/cold_room/fish_check > ~/lab0/claude_monet/kitchen/stations_report
cat ~/lab0/claude_monet/sanitation/violations >> ~/lab0/claude_monet/office/vika_response
mv ~/lab0/claude_monet/hall/waiter_note ~/lab0/claude_monet/office/guest_zone_note
ls -lR ~/lab0 | grep '^-' | sort -k5 -n -r | head -5
grep -rhiE 'наруш|проверк' ~/lab0/claude_monet | grep -vi 'повторн' | sort -r | head -6
grep -rli 'уборк' ~/lab0/claude_monet/cleaning ~/lab0/claude_monet/sanitation/cleaning_backup | wc -l
for f in ~/lab0/claude_monet/kitchen/hot_station/*_report ~/lab0/claude_monet/kitchen/hot_station/*_check ~/lab0/claude_monet/kitchen/cold_room/*_check; do head -n1 "$f"; tail -n1 "$f"; done | grep -iE 'провер|наруш' | sort
grep -v 'Баринов' ~/lab0/claude_monet/kitchen/stations_report | grep -iE 'провер|рыб' | sort -r | wc -w
ls -lR ~/lab0 | grep -E '^-[^ ]* +2 ' | sort -k9
ls -lR ~/lab0 | grep '^l' | sort -k11 -r | head -1
rm ~/lab0/claude_monet/office/arrival_copy
rm ~/lab0/inspection_link
rm ~/lab0/claude_monet/kitchen/sanitation_access
rm ~/lab0/claude_monet/sanitation/act_duplicate
rm ~/lab0/claude_monet/office/guest_zone_note
rmdir ~/lab0/claude_monet/hall
rm ~/lab0/claude_monet/sanitation/violations
rm -r ~/lab0/claude_monet/sanitation/cleaning_backup