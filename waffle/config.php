<?PHP
/** WAF-FLE configuration file
 * Define the database parameters, cache and session timeout
 * 
*/
$DB_HOST  = "DB_HOST_PARAM";
$DB_USER  = "DB_USER_PARAM";
$DB_PASS  = "DB_PASS_PARAM";
$DATABASE = "DATABASE_PARAM";

// To enable full events compression in database use 'TRUE', to disable 
// compression use 'FALSE'
$COMPRESSION = true;

// Define the performance timing presentation, set 'mili' for 
// miliseconds (1/1000 seconds), or 'micro' for microseconds 
// (1/1000000 seconds).
$timePreference = 'mili';

// To enable APC cache use 'TRUE', to disable APC cache use 'FALSE'
$APC_ON = true;

// Max events in events list
$max_event_number = "25";

// This directive limit events to delete, or mark as false positive, 
// each pass when deleting events by filter.
// You can tune it, but be aware that a very high value can block your 
// database, and prevent new event insertion for a (long) time. 
// Default: 2000
$deleteLimit = 2000;

// Wait time, in seconds, between each pass of delete event by filter. 
// Normally this is needed to allow time for new events get inserted on 
// database, avoiding database look in delete operation. You can tune 
// this, but be aware that a much lower value can lock your database, 
// and prevent new event insert for a (long) time;
// Default: 2 seconds
$deleteWait = 2;

// CACHE_TIMEOUT=30; // This is used to make data cache of frequent used 
// data
$CACHE_TIMEOUT   = 30;
$SESSION_TIMEOUT = 600;

// Enable/Disable the SensorInfo data in management menu. This can be 
// overwritten by user in user interface, and the change will affect and
// will be valid only for that user and while session still valid. The 
// default is "true"
$GetSensorInfo = true;

// Set rule id number for "Execution Error - PCRE limit exceeded".
// This number must not be used in any other rule id;
// Default: 99999
$PcreErrRuleId = 99999;

// Debug enable/disable
$DEBUG = false;

// Enable setup to initial run of WAF-FLE, it check prerequisite and 
// configure database schema. Upgrade of version and database can be 
// available too.
// While this is enable, no event is received or view.
$SETUP = SETUP_PARAM;

?>