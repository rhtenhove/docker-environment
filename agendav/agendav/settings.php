# Most of the settings below are personal preferences. You can remove the ones after the database tuple to get the defaults.

<?php
$app['db.options'] = [
        'dbname' => '$dbname',
        'user' => '$dbuser',
        'password' => '$dbpassword',
        'host' => '$dbhost',
        'port' => '$dbport',
        'driver' => 'pdo_pgsql'
];
$app['site.title'] = 'Agenda';
$app['proxies'] = []; # TODO: setup the haproxy container as a trusted proxy
$app['caldav.authmethod'] = 'basic';
$app['calendar.sharing'] = true;
$app['defaults.time_format'] = '24';
$app['defaults.show_week_nb'] = true;
$app['defaults.show_now_indicator'] = true;
$app['defaults.default_view'] = 'week';
$app['csrf.secret'] = '`< /dev/urandom tr -dc A-Za-z0-9 | head -c50`';
$app['caldav.baseurl'] = 'https://agendav.example.nl/'; # Change this to the base URL that will be used when browsing to this webserver
$app['defaults.timezone'] = 'Europe/Amsterdam';
$app['caldav.baseurl'] = 'http://davical/caldav.php'; # This connects through a docker network to the davical container
$app['defaults.weekstart'] = 1;
