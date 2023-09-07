# 2. Execute a command
exec {'killmenow':
  command => 'pkill killmenow',
  path    => '/bin:/usr/bin:/usr/sbin',
}
