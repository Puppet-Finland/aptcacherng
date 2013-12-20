#
# == Class: aptcacherng::monit
#
# Setups monit rules for aptcacherng
#
class aptcacherng::monit
(
    $monitor_email
)
{
    monit::fragment { 'aptcacherng-apt-cacher-ng.monit':
        modulename => 'aptcacherng',
        basename => 'apt-cacher-ng',
    }
}
