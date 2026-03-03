<?php
// Performance tuning for Railway deployment

// Reuse MySQL connections instead of reconnecting every request
$cfg['PersistentConnections'] = true;

// Reduce navigation tree overhead
$cfg['NavigationTreeEnableGrouping'] = false;
$cfg['MaxNavigationItems'] = 30;

// Skip slow optional info queries
$cfg['ShowStats'] = false;
$cfg['ShowServerInfo'] = false;
$cfg['ShowPhpInfo'] = false;

// Faster table listing
$cfg['MaxTableList'] = 100;

// Longer timeout for slow connections
$cfg['ExecTimeLimit'] = 300;
$cfg['LoginCookieValidity'] = 3600;

// Disable slow features
$cfg['PropertiesNumColumns'] = 1;
$cfg['RememberSorting'] = false;
