# Run this inside the agendav container the first time after setting up the database
cd /var/www/agendav && php7 /var/www/agendav/agendavcli migrations:migrate
